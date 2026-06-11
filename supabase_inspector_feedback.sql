-- ============================================================================
-- Inspector Access Portal — backend completion script
-- Phase 5 #29
--
-- Run this in the Supabase SQL editor for the TailorEd Notes project
-- (eu-west-2, https://uvjvizphpmxybezkjjbl.supabase.co).
--
-- This script is idempotent — safe to re-run. It contains everything the
-- Inspector Portal needs on top of supabase_schema.sql:
--
--   1. inspector_feedback table + RLS
--   2. Inspector read policies missing from the base schema:
--      care_plans, care_plan_goals, medical_profiles, healthcare_contacts
--      (daily_notes, incidents, medication, behaviour, children already
--      exist in supabase_schema.sql)
--   3. audit_log INSERT policy for inspectors (the staff policy requires the
--      writer's own home_id, but inspector activity is logged against the
--      *granted* home, so writes were silently rejected without this)
--   4. user_profiles.email column + backfill + manager search policy
--      (the grant form searches inspectors by email; the base schema has no
--      email column and RLS hides cross-home profiles from managers)
--
-- Scope keys must match InspectorModule.scopeKey in
-- lib/features/inspector/domain/inspector_module.dart:
--   daily_notes, care_plans, incidents, behaviour, medication, medical_history
-- (plus 'children', which the app appends to every grant it creates).
-- ============================================================================

-- ─── 1. inspector_feedback ──────────────────────────────────────────────────

create table if not exists public.inspector_feedback (
  id                uuid primary key default gen_random_uuid(),
  home_id           uuid not null,
  inspector_user_id uuid not null references auth.users(id),
  inspector_email   text not null,
  child_id          uuid references public.children(id),
  child_name        text,
  module            text not null,
  severity          text not null check (severity in ('compliment', 'recommendation', 'requirement')),
  content           text not null,
  status            text not null default 'open' check (status in ('open', 'acknowledged', 'resolved')),
  created_at        timestamptz not null default now(),
  resolved_at       timestamptz,
  resolved_by       uuid references auth.users(id),
  resolution_notes  text
);

alter table public.inspector_feedback enable row level security;

-- Inspectors can submit feedback for a home only while they hold an active grant.
drop policy if exists "inspectors insert feedback for granted homes" on public.inspector_feedback;
create policy "inspectors insert feedback for granted homes"
  on public.inspector_feedback for insert
  with check (
    inspector_user_id = auth.uid()
    and exists (
      select 1 from public.inspector_grants g
      where g.inspector_user_id = auth.uid()
        and g.home_id = inspector_feedback.home_id
        and g.expires_at > now()
    )
  );

-- Inspectors can view their own submitted feedback.
drop policy if exists "inspectors view own feedback" on public.inspector_feedback;
create policy "inspectors view own feedback"
  on public.inspector_feedback for select
  using (inspector_user_id = auth.uid());

-- Managers can view all feedback for their home.
-- Claim names match AppUser.fromSession (lib/features/auth/domain/app_user.dart),
-- injected by the custom_access_token_hook. home_id is uuid, claims are text.
drop policy if exists "managers view feedback for their home" on public.inspector_feedback;
create policy "managers view feedback for their home"
  on public.inspector_feedback for select
  using (
    (auth.jwt() ->> 'app_role') = 'manager'
    and (auth.jwt() ->> 'app_home_id') = home_id::text
  );

-- Managers can acknowledge/resolve feedback for their home.
drop policy if exists "managers update feedback for their home" on public.inspector_feedback;
create policy "managers update feedback for their home"
  on public.inspector_feedback for update
  using (
    (auth.jwt() ->> 'app_role') = 'manager'
    and (auth.jwt() ->> 'app_home_id') = home_id::text
  )
  with check (
    (auth.jwt() ->> 'app_role') = 'manager'
    and (auth.jwt() ->> 'app_home_id') = home_id::text
  );

-- ─── 2. Inspector read policies missing from the base schema ────────────────
-- supabase_schema.sql already covers daily_notes ('daily_notes'),
-- incident_reports ('incidents'), prescribed_medications / med_administrations
-- ('medication'), behaviour_incidents ('behaviour'), children ('children').

-- deleted_at is filtered here (not just app-side) because care_plan_goals
-- rows reach the app through a PostgREST embed, which bypasses the app's
-- top-level deleted_at filter.

drop policy if exists "inspectors_read_care_plans" on public.care_plans;
create policy "inspectors_read_care_plans"
  on public.care_plans for select
  using (
    deleted_at is null
    and public.inspector_has_grant(home_id, 'care_plans')
  );

drop policy if exists "inspectors_read_care_plan_goals" on public.care_plan_goals;
create policy "inspectors_read_care_plan_goals"
  on public.care_plan_goals for select
  using (
    deleted_at is null
    and public.inspector_has_grant(home_id, 'care_plans')
  );

-- medical_profiles has no deleted_at column.
drop policy if exists "inspectors_read_medical_profiles" on public.medical_profiles;
create policy "inspectors_read_medical_profiles"
  on public.medical_profiles for select
  using (public.inspector_has_grant(home_id, 'medical_history'));

drop policy if exists "inspectors_read_healthcare_contacts" on public.healthcare_contacts;
create policy "inspectors_read_healthcare_contacts"
  on public.healthcare_contacts for select
  using (
    deleted_at is null
    and public.inspector_has_grant(home_id, 'medical_history')
  );

-- ─── 3. audit_log — let inspectors log views against the granted home ───────
-- The existing staff_insert_audit_log policy requires home_id to be the
-- writer's own home; inspector view/feedback logging targets the granted
-- home, so InspectorAuditService writes need this additive policy.

drop policy if exists "inspectors_insert_audit_log" on public.audit_log;
create policy "inspectors_insert_audit_log"
  on public.audit_log for insert
  with check (
    user_id = auth.uid()
    and action in ('inspector_view', 'inspector_feedback')
    and exists (
      select 1 from public.inspector_grants g
      where g.inspector_user_id = auth.uid()
        and g.home_id = audit_log.home_id
        and g.expires_at > now()
    )
  );

-- ─── 4. user_profiles.email — needed for the manager grant form ─────────────
-- The grant form searches inspector accounts by email. The base schema has
-- no email column, and RLS only exposes same-home profiles to managers.

alter table public.user_profiles add column if not exists email text;

-- Backfill from auth.users (re-runnable; only fills missing values).
update public.user_profiles p
   set email = u.email
  from auth.users u
 where u.id = p.id
   and p.email is null;

-- Keep email in sync when profiles are created/updated without one.
create or replace function public.sync_user_profile_email()
returns trigger
language plpgsql
security definer
as $$
begin
  if new.email is null then
    select email into new.email from auth.users where id = new.id;
  end if;
  return new;
end;
$$;

drop trigger if exists trg_user_profiles_email on public.user_profiles;
create trigger trg_user_profiles_email
  before insert or update on public.user_profiles
  for each row execute function public.sync_user_profile_email();

-- Managers can look up inspector accounts (cross-home) to create grants.
drop policy if exists "managers search inspector accounts" on public.user_profiles;
create policy "managers search inspector accounts"
  on public.user_profiles for select
  using (
    (auth.jwt() ->> 'app_role') = 'manager'
    and role = 'inspector'
  );
