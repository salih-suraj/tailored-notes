# Standing up a new home + first manager (vendor runbook)

This is the one onboarding step that can't happen in-app: a brand-new home has
no manager yet, so the normal manager-gated provisioning can't run. The
`bootstrap-home` Edge Function does it instead, gated by a secret only you (the
vendor) hold. Run it **once per new care home** — after that, the first manager
provisions everyone else (staff, parents, inspectors) from inside the app.

> This is a deliberate, low-frequency vendor operation. There is **no app UI**
> for it on purpose — vendors aren't app users.

## One-time setup (per Supabase project)

```bash
# 1. Deploy the function WITHOUT JWT verification (it has no calling user).
supabase functions deploy bootstrap-home --no-verify-jwt

# 2. Set a long, random shared secret (keep it in your password manager).
supabase secrets set BOOTSTRAP_SECRET="$(openssl rand -hex 32)"
```

`SUPABASE_URL` and `SUPABASE_SERVICE_ROLE_KEY` are injected automatically — do
not set them.

## Create a home + its first manager

```bash
curl -X POST "https://uvjvizphpmxybezkjjbl.functions.supabase.co/bootstrap-home" \
  -H "x-bootstrap-secret: <BOOTSTRAP_SECRET>" \
  -H "Content-Type: application/json" \
  -d '{
    "homeName": "Norton Court House",
    "email": "manager@nortoncourt.example",
    "password": "<a temporary password, 8+ chars>",
    "displayName": "Jane Manager"
  }'
```

Success returns `{ "ok": true, "homeId": "...", "managerId": "...", "homeName": "..." }`.

## What happens next

1. Hand the manager their email + the temporary password (securely).
2. They sign in → are **forced to set their own password** → enrol **2FA**.
3. From there they onboard their own team in-app:
   - **Staff** screen → Add (support workers, team leaders, other managers)
   - **Parent Access** → Add parent
   - **Inspector Access** → Add inspector
   - and **Reset password** for anyone who forgets theirs.

No Supabase dashboard needed for any routine onboarding after this.

## Notes

- The home's friendly name is best-effort: if the `homes` row can't be written
  the manager is still created and the app falls back to a shortened home id.
  Re-running with the same email returns "account already exists" (safe).
- Security: the secret is the only gate, so keep it secret and rotate it with
  `supabase secrets set BOOTSTRAP_SECRET=...` if it's ever exposed.
