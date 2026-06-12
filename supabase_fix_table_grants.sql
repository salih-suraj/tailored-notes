-- ============================================================================
-- Fix: "permission denied for table ..." (PostgrestException 42501)
--
-- Run this in the Supabase SQL editor. Idempotent.
--
-- Root cause: the `authenticated` role has no base table privileges on the
-- public schema tables. RLS policies only filter rows AFTER the role passes
-- the table-level GRANT check, so every query fails with 42501 regardless of
-- policy. Supabase normally applies these grants automatically via default
-- privileges when tables are created; that didn't happen for this project's
-- tables, so we grant explicitly — to all current tables and, via default
-- privileges, to any table created in the future.
--
-- Security note: this does NOT open up data access. Every table in the
-- schema has RLS enabled, and RLS remains the gatekeeper for which rows an
-- authenticated user can touch. `anon` is deliberately excluded — the app
-- never reads public tables before login. The deliberate REVOKE on
-- custom_access_token_hook is untouched (no function grants here).
-- ============================================================================

grant usage on schema public to authenticated, service_role;

grant select, insert, update, delete
  on all tables in schema public
  to authenticated, service_role;

grant usage, select
  on all sequences in schema public
  to authenticated, service_role;

-- Cover tables/sequences created in the future by the postgres role.
alter default privileges in schema public
  grant select, insert, update, delete on tables
  to authenticated, service_role;

alter default privileges in schema public
  grant usage, select on sequences
  to authenticated, service_role;
