-- ============================================================================
-- Enforce MFA (AAL2) at the data layer for Manager and Inspector roles
--
-- Run this in the Supabase SQL editor. Idempotent.
--
-- Gap this closes: MFA was only enforced by the Flutter app's routing.
-- Every RLS policy gates on role/home but never on the session's assurance
-- level, so a stolen manager or inspector PASSWORD (without the TOTP
-- authenticator) could bypass the app and read/write data through the REST
-- API directly at AAL1.
--
-- Fix: a RESTRICTIVE policy on every public table. Restrictive policies are
-- ANDed with the existing permissive ones, so this adds the condition
-- "privileged roles must hold an AAL2 session" on top of all current rules:
--
--   - support_worker / team_leader / parent_guardian sessions: unaffected
--     (those roles don't enrol in MFA).
--   - manager / inspector sessions: every read AND write is denied until
--     the TOTP challenge has upgraded the session to AAL2.
--   - service_role and the auth token hook: unaffected (policy targets
--     only the `authenticated` role; security-definer functions bypass RLS).
--
-- App-side note: the sync engine now waits for the MFA challenge to
-- complete before sweeping (sync_provider.dart), so the brief AAL1 window
-- between password login and TOTP entry produces no denied requests.
-- ============================================================================

do $$
declare
  t record;
begin
  for t in
    select tablename
      from pg_tables
     where schemaname = 'public'
  loop
    execute format(
      'drop policy if exists "require_mfa_for_privileged_roles" on public.%I',
      t.tablename
    );
    execute format($p$
      create policy "require_mfa_for_privileged_roles"
        on public.%I
        as restrictive
        for all
        to authenticated
        using (
          coalesce(auth.jwt() ->> 'app_role', '') not in ('manager', 'inspector')
          or coalesce(auth.jwt() ->> 'aal', '') = 'aal2'
        )
    $p$, t.tablename);
  end loop;
end $$;

-- Verify: should list one row per public table.
-- select tablename from pg_policies
--  where policyname = 'require_mfa_for_privileged_roles' order by tablename;
