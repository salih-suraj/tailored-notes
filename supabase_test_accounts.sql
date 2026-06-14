-- ============================================================================
-- Test accounts for manual testing — 5 testers, one role each
-- Run in the Supabase SQL editor (project uvjvizphpmxybezkjjbl). Re-runnable.
-- ============================================================================
--
-- STEP 1 — create the 5 auth users FIRST, in the Dashboard:
--   Authentication → Users → "Add user"
--   For EACH user: enter the email + a password, and TICK "Auto Confirm User"
--   (otherwise they can't log in until they confirm an email).
--   Use the 5 emails below, or your own — if you change them, edit this script.
--
-- STEP 2 — run this script. It finds those auth users by email and gives each
--   a user_profiles row (role + a SHARED home_id). The role/home come from
--   here into every JWT via custom_access_token_hook, so the app knows who
--   they are. All 5 share one home so they see each other's data.
--
-- ORDER MATTERS: create the auth user (Step 1), then run this (Step 2), THEN
--   log in. If anyone logged in before their profile existed, have them sign
--   out and back in to pick up a fresh token with their role.
-- ============================================================================

do $$
declare
  -- One shared home for all testers. Staff-created children/records inherit
  -- this id, so everyone sees the same home. Keep it identical for all five.
  v_home_id uuid := '7e57f00d-0000-4000-8000-000000000001';
begin
  insert into public.user_profiles (id, home_id, role, display_name, email)
  select u.id, v_home_id, t.role, t.display_name, u.email
  from auth.users u
  join (values
    ('manager@tailoredtest.local',   'manager',         'Test Manager'),
    ('support@tailoredtest.local',   'support_worker',  'Test Support Worker'),
    ('lead@tailoredtest.local',      'team_leader',     'Test Team Leader'),
    ('inspector@tailoredtest.local', 'inspector',       'Test Inspector'),
    ('parent@tailoredtest.local',    'parent_guardian', 'Test Parent')
  ) as t(email, role, display_name) on lower(u.email) = lower(t.email)
  on conflict (id) do update
    set home_id      = excluded.home_id,
        role         = excluded.role,
        display_name = excluded.display_name,
        email        = excluded.email;
end $$;

-- Verify — should list all 5 with their roles, all on the same home_id.
select email, role, home_id
from public.user_profiles
where email like '%@tailoredtest.local'
order by role;
