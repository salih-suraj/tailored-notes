-- ============================================================================
-- Fix: infinite recursion in user_profiles RLS (PostgrestException 42P17)
--
-- Run this in the Supabase SQL editor for the TailorEd Notes project
-- (eu-west-2, https://uvjvizphpmxybezkjjbl.supabase.co). Idempotent.
--
-- Root cause: the base schema's managers_read_home_profiles policy on
-- public.user_profiles subqueries public.user_profiles inside its own USING
-- clause. Evaluating the policy requires reading the table, which re-evaluates
-- the policy → Postgres aborts with "infinite recursion detected in policy
-- for relation user_profiles".
--
-- Because almost every other table's RLS policy also subqueries
-- user_profiles (e.g. `home_id = (select home_id from user_profiles where
-- id = auth.uid())`), the recursive policy poisons those queries too — any
-- authenticated read/write that touches RLS ends up evaluating
-- user_profiles' policies and hits the same error.
--
-- Fix: rewrite the policy to read role/home_id from the JWT claims that
-- custom_access_token_hook injects (app_role, app_home_id) instead of
-- querying the table. Same pattern as the manager policies in
-- supabase_inspector_feedback.sql.
--
-- Requires the access-token hook to be enabled:
-- Dashboard → Authentication → Hooks → "Customize Access Token (JWT) Claims"
-- → public.custom_access_token_hook.
-- After running this, sign out and back in so the app holds a fresh JWT.
-- ============================================================================

drop policy if exists "managers_read_home_profiles" on public.user_profiles;
create policy "managers_read_home_profiles"
  on public.user_profiles for select
  using (
    (auth.jwt() ->> 'app_role') in ('manager', 'team_leader')
    and home_id::text = (auth.jwt() ->> 'app_home_id')
  );

-- users_read_own_profile (auth.uid() = id) and
-- "managers search inspector accounts" (JWT-claim based) are already safe —
-- no changes needed.
