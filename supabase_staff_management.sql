-- ============================================================================
-- Staff Management (P1) — manager-provisioned staff accounts
--
-- Run in the Supabase SQL editor for the TailorEd Notes project
-- (eu-west-2, https://uvjvizphpmxybezkjjbl.supabase.co). Idempotent.
--
-- Adds an `is_active` flag to user_profiles so the in-app Staff screen can
-- show whether an account is enabled or disabled. The flag is for display +
-- least-privilege checks; the ACTUAL enforcement of a disabled account is the
-- auth-level ban applied by the `manage-staff` Edge Function (a banned user
-- cannot obtain a token at all). The function keeps the two in lock-step:
-- disable → ban + is_active=false; enable → unban + is_active=true.
--
-- Managers already read user_profiles for their own home via the JWT-claim
-- policy `managers_read_home_profiles` (see supabase_fix_user_profiles_recursion.sql),
-- so the Staff list is a plain RLS SELECT — no extra read policy needed here.
-- Writes (create/ban/unban) are service-role only, via the Edge Function;
-- there is deliberately no client UPDATE policy on is_active.
-- ============================================================================

alter table public.user_profiles
  add column if not exists is_active boolean not null default true;

-- Backfill any pre-existing rows (no-op for fresh installs).
update public.user_profiles set is_active = true where is_active is null;

comment on column public.user_profiles.is_active is
  'Account enabled flag. Mirrors the auth ban applied by the manage-staff '
  'Edge Function. Disabled accounts (is_active=false) are banned and cannot '
  'sign in. Maintained server-side only.';
