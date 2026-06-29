-- ============================================================================
-- Add the "team_leader" role to user_profiles (P1)
--
-- Run in the Supabase SQL editor for the TailorEd Notes project
-- (eu-west-2, https://uvjvizphpmxybezkjjbl.supabase.co). Idempotent.
--
-- The team-leader role sits between support worker and manager: full care
-- access (children, daily notes, checklists, handover, the oversight dashboard,
-- and care plans / risk assessments) but NOT the manager-only admin surfaces
-- (staff, parent access, inspector access).
--
-- The app and the manage-staff Edge Function already know the role
-- (ALLOWED_ROLES includes 'team_leader') and the custom_access_token_hook
-- copies user_profiles.role into the `app_role` JWT claim verbatim, so the RLS
-- policies that already reference 'team_leader' work as-is. The only thing that
-- can still reject a team leader is the CHECK constraint on
-- user_profiles.role: older installs may have one that predates this role and
-- only allows support_worker / manager / inspector / parent_guardian. Inserting
-- a team leader then fails with a check violation (surfaced in-app as a generic
-- "something went wrong"). This drops whatever CHECK currently guards `role`
-- and re-adds a canonical one covering all five roles.
--
-- NOTE: this assumes `role` is a text column guarded by a CHECK constraint
-- (which is how every policy and seed in this project treats it). If your
-- schema instead defines `role` as a Postgres ENUM type, run this one line
-- rather than the block below:
--     alter type <your_role_enum> add value if not exists 'team_leader';
-- ============================================================================

-- 1. Drop any existing CHECK constraint on user_profiles that guards `role`.
--    (On a fresh install with no such constraint this loop simply does nothing.)
do $$
declare
  c record;
begin
  for c in
    select con.conname
    from pg_constraint con
    join pg_class      rel on rel.oid = con.conrelid
    join pg_namespace  nsp on nsp.oid = rel.relnamespace
    where nsp.nspname = 'public'
      and rel.relname = 'user_profiles'
      and con.contype = 'c'
      and pg_get_constraintdef(con.oid) ilike '%role%'
  loop
    execute format(
      'alter table public.user_profiles drop constraint %I', c.conname
    );
  end loop;
end $$;

-- 2. Re-add the canonical role CHECK covering all five roles.
alter table public.user_profiles
  add constraint user_profiles_role_check
  check (role in (
    'support_worker',
    'team_leader',
    'manager',
    'inspector',
    'parent_guardian'
  ));

-- 3. Verify — the constraint definition should now list team_leader.
select pg_get_constraintdef(con.oid) as role_check
from pg_constraint con
join pg_class     rel on rel.oid = con.conrelid
join pg_namespace nsp on nsp.oid = rel.relnamespace
where nsp.nspname = 'public'
  and rel.relname = 'user_profiles'
  and con.conname = 'user_profiles_role_check';
