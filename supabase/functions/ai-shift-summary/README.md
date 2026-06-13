# AI Shift Summary — Edge Function (Phase 5 #31 / B8)

Generates a written shift handover brief from the shift's care records, using
Claude via the Anthropic Messages API. The API key stays server-side — it is
never shipped in the Flutter app.

## What it does

The Flutter app (handover screen → ✨ button) gathers the current shift's
records client-side (the same provider data as the handover cards), POSTs them
as JSON, and this function returns `{ "summary": "..." }`.

## Security

- **JWT-verified** by the Supabase platform (`verify_jwt` is on by default).
- **Role-gated** in code: only `team_leader` and `manager` may call it, and
  `manager` sessions must be at `aal2` (MFA complete) — mirroring the
  `require_mfa_for_privileged_roles` RLS policy. Roles/AAL are read from the
  `app_role` / `aal` JWT claims injected by `custom_access_token_hook`.
- No care data is persisted by the function — it is summarised and returned.

## Model

Uses `claude-opus-4-8`. This is deliberate for safety-critical content
(safeguarding flags, medication refusals must be represented faithfully, not
hallucinated). To trade accuracy for lower cost/latency, change the `model`
field in `index.ts` to `claude-haiku-4-5` (fast/cheap) — a one-line edit.

## Deploy

```bash
# from the project root
supabase functions deploy ai-shift-summary

# set the API key secret (once)
supabase secrets set ANTHROPIC_API_KEY=sk-ant-...
```

Requires the Supabase CLI linked to project `uvjvizphpmxybezkjjbl`.

## Test

```bash
curl -i -X POST \
  https://uvjvizphpmxybezkjjbl.functions.supabase.co/ai-shift-summary \
  -H "Authorization: Bearer <a team-leader or manager access token>" \
  -H "Content-Type: application/json" \
  -d '{"date":"2026-06-13","shift":"Morning","children":[
        {"name":"Test Child","notes":[{"time":"09:15","author":"A. Worker","content":"Settled breakfast."}]}
      ]}'
```

Expect `200` with a `summary` string. A non-team-leader/manager token returns
`403`; a missing secret returns `500`.
