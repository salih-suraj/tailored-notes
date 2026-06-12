-- ============================================================================
-- Parent/Guardian Portal — backend script (Phase 5 #30)
--
-- Run this in the Supabase SQL editor for the TailorEd Notes project
-- (eu-west-2, https://uvjvizphpmxybezkjjbl.supabase.co). Idempotent.
--
--   1. parent_links table + RLS — a manager links a parent account to a
--      specific child (per-child, unlike inspector grants which are
--      per-home). can_view_photos gates photo visibility per link.
--   2. parent_has_link() helper — security definer, mirrors
--      inspector_has_grant().
--   3. Read policies for parents: their linked children and those
--      children's activity_entries (activities, rewards, achievements).
--      Deliberately NOT exposed: daily notes, incidents, behaviour,
--      medication, or any other clinical table.
--   4. user_profiles search policy so managers can find parent accounts
--      by email in the link form.
--
-- Policy style note: policies must read role/home from JWT claims
-- (app_role / app_home_id, injected by custom_access_token_hook) — never
-- by subquerying user_profiles, which caused the 42P17 infinite-recursion
-- outage fixed on 2026-06-12.
-- ============================================================================

-- ─── 1. parent_links ────────────────────────────────────────────────────────

create table if not exists public.parent_links (
  id              uuid primary key default gen_random_uuid(),
  parent_user_id  uuid not null references auth.users(id) on delete cascade,
  child_id        uuid not null references public.children(id) on delete cascade,
  home_id         uuid not null,
  can_view_photos boolean not null default false,
  granted_by      uuid not null references auth.users(id),
  revoked_at      timestamptz,
  created_at      timestamptz not null default now()
);

alter table public.parent_links enable row level security;

-- Explicit grants (default privileges were fixed 2026-06-12, but be explicit).
grant select, insert, update, delete on public.parent_links
  to authenticated, service_role;

-- Parents can see their own links (active and revoked — the app filters).
drop policy if exists "parents_read_own_links" on public.parent_links;
create policy "parents_read_own_links"
  on public.parent_links for select
  using (parent_user_id = auth.uid());

-- Managers manage links for their own home.
drop policy if exists "managers_manage_parent_links" on public.parent_links;
create policy "managers_manage_parent_links"
  on public.parent_links for all
  using (
    (auth.jwt() ->> 'app_role') = 'manager'
    and home_id::text = (auth.jwt() ->> 'app_home_id')
  )
  with check (
    (auth.jwt() ->> 'app_role') = 'manager'
    and home_id::text = (auth.jwt() ->> 'app_home_id')
  );

-- ─── 2. parent_has_link helper ──────────────────────────────────────────────

create or replace function public.parent_has_link(p_child_id uuid)
returns boolean
language sql
stable
security definer
as $$
  select exists (
    select 1 from public.parent_links
     where parent_user_id = auth.uid()
       and child_id = p_child_id
       and revoked_at is null
  );
$$;

-- ─── 3. Parent read policies ────────────────────────────────────────────────

-- Linked children only (the child row carries name/photo_url for the portal).
drop policy if exists "parents_read_linked_children" on public.children;
create policy "parents_read_linked_children"
  on public.children for select
  using (
    deleted_at is null
    and public.parent_has_link(id)
  );

-- Activities, rewards, and achievements for linked children.
drop policy if exists "parents_read_activities" on public.activity_entries;
create policy "parents_read_activities"
  on public.activity_entries for select
  using (
    deleted_at is null
    and public.parent_has_link(child_id)
  );

-- ─── 4. Manager search for parent accounts ──────────────────────────────────

drop policy if exists "managers search parent accounts" on public.user_profiles;
create policy "managers search parent accounts"
  on public.user_profiles for select
  using (
    (auth.jwt() ->> 'app_role') = 'manager'
    and role = 'parent_guardian'
  );
