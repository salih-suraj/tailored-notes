// Bootstrap Home — Supabase Edge Function (vendor / super-admin only)
//
// Stands up a brand-new home and its FIRST manager. This is the one onboarding
// step that can't be manager-gated (a new home has no manager yet), so it is
// gated by a shared secret known only to the vendor — never the app.
//
// It is deliberately NOT exposed in the app. Vendors aren't app users; they
// run this once per new care home (a contract/setup event) from a terminal.
//
// Deploy WITHOUT JWT verification (it has no calling user) and set the secret:
//   supabase functions deploy bootstrap-home --no-verify-jwt
//   supabase secrets set BOOTSTRAP_SECRET="<a long random string>"
//   (SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY are injected automatically.)
//
// Usage:
//   curl -X POST "https://<project>.functions.supabase.co/bootstrap-home" \
//     -H "x-bootstrap-secret: <BOOTSTRAP_SECRET>" \
//     -H "Content-Type: application/json" \
//     -d '{"homeName":"Norton Court House","email":"manager@home.example",
//          "password":"<temp password>","displayName":"Jane Manager"}'
//
// On success it creates: a `homes` row (id + name), the manager auth user
// (email pre-confirmed, must_change_password armed), and the matching
// user_profiles row (role=manager, home_id=the new home). The manager then
// signs in once with the temp password, is forced to set their own, enrols
// MFA, and can provision the rest of their staff/parents/inspectors in-app.

import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type, x-bootstrap-secret",
};

const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

function json(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }
  if (req.method !== "POST") {
    return json({ error: "Method not allowed" }, 405);
  }

  // Secret gate. A short/unset secret fails closed so a misconfigured deploy
  // can never be open to the world.
  const expected = Deno.env.get("BOOTSTRAP_SECRET") ?? "";
  const provided = req.headers.get("x-bootstrap-secret") ?? "";
  if (expected.length < 16 || provided !== expected) {
    return json({ error: "Forbidden" }, 403);
  }

  const url = Deno.env.get("SUPABASE_URL");
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!url || !serviceKey) {
    return json({ error: "Server is not configured." }, 500);
  }
  const admin = createClient(url, serviceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  let body: {
    homeName?: string;
    email?: string;
    password?: string;
    displayName?: string;
  };
  try {
    body = await req.json();
  } catch {
    return json({ error: "Invalid JSON body" }, 400);
  }

  const homeName = body.homeName?.trim() ?? "";
  const email = body.email?.trim().toLowerCase() ?? "";
  const password = body.password ?? "";
  const displayName = body.displayName?.trim() ?? "";

  if (homeName.length === 0) {
    return json({ error: "Enter the home's name." }, 400);
  }
  if (!EMAIL_RE.test(email)) {
    return json({ error: "Enter a valid manager email address." }, 400);
  }
  if (password.length < 8) {
    return json({ error: "Temporary password must be at least 8 characters." }, 400);
  }
  if (displayName.length === 0) {
    return json({ error: "Enter the manager's name." }, 400);
  }

  const homeId = crypto.randomUUID();

  // Create the home row for a friendly name. Best-effort: the app tolerates a
  // missing homes row (it falls back to a shortened id), so a schema mismatch
  // here must not block standing up the manager.
  const { error: homeErr } = await admin
    .from("homes")
    .insert({ id: homeId, name: homeName });
  if (homeErr) {
    console.error("homes insert failed (continuing):", homeErr);
  }

  // Create the manager auth user — email pre-confirmed, temp password armed.
  const { data: created, error: createErr } = await admin.auth.admin.createUser({
    email,
    password,
    email_confirm: true,
    user_metadata: { display_name: displayName },
    // Forced first-login password change — admin-only app_metadata (see
    // change-password function).
    app_metadata: { must_change_password: true },
  });
  if (createErr) {
    const msg = /already|exist|registered/i.test(createErr.message ?? "")
      ? "An account with that email already exists."
      : "Could not create the manager account. Please try again.";
    console.error("createUser failed:", createErr);
    await admin.from("homes").delete().eq("id", homeId);
    return json({ error: msg }, 400);
  }

  const managerId = created.user.id;

  const { error: profileErr } = await admin.from("user_profiles").insert({
    id: managerId,
    home_id: homeId,
    role: "manager",
    display_name: displayName,
    email,
    is_active: true,
  });
  if (profileErr) {
    // Roll back the orphaned auth user (and home) so a retry can reuse the email.
    console.error("user_profiles insert failed, rolling back:", profileErr);
    await admin.auth.admin.deleteUser(managerId);
    await admin.from("homes").delete().eq("id", homeId);
    return json(
      { error: "Could not finish setting up the home. Please try again." },
      500,
    );
  }

  return json({ ok: true, homeId, managerId, homeName });
});
