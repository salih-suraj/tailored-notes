// Change Password — Supabase Edge Function
//
// Lets a signed-in user set their own password AND clears the admin-only
// `must_change_password` flag in one server-side step. Because the flag lives
// in app_metadata (not user-writable) and is only ever cleared here — together
// with an actual password change — a user can't skip the forced first-login
// reset by tampering with their own metadata.
//
// Gating: deploy with JWT verification ON (the default) so the platform proves
// who the caller is; we act only on that caller's own account (sub from JWT).
//
// Deploy:
//   supabase functions deploy change-password
//   (SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY are injected automatically.)

import { createClient } from "npm:@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
};

function json(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

/** Decodes the (platform-verified) JWT payload without re-verifying. */
function jwtSub(authHeader: string | null): string | null {
  try {
    const token = authHeader?.replace(/^Bearer\s+/i, "") ?? "";
    const payload = JSON.parse(
      atob(token.split(".")[1].replace(/-/g, "+").replace(/_/g, "/")),
    );
    return (payload.sub as string) ?? null;
  } catch {
    return null;
  }
}

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }
  if (req.method !== "POST") {
    return json({ error: "Method not allowed" }, 405);
  }

  const sub = jwtSub(req.headers.get("Authorization"));
  if (!sub) {
    return json({ error: "Please sign in again." }, 401);
  }

  const url = Deno.env.get("SUPABASE_URL");
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!url || !serviceKey) {
    return json({ error: "Server is not configured." }, 500);
  }
  const admin = createClient(url, serviceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  let body: { password?: string };
  try {
    body = await req.json();
  } catch {
    return json({ error: "Invalid request." }, 400);
  }
  const password = body.password ?? "";
  if (password.length < 8) {
    return json({ error: "Choose a password of at least 8 characters." }, 400);
  }

  // Read the existing app_metadata so we only flip the one flag and keep the
  // rest (e.g. provider info) intact.
  const { data: current, error: getErr } = await admin.auth.admin.getUserById(
    sub,
  );
  if (getErr || !current?.user) {
    console.error("getUserById failed:", getErr);
    return json({ error: "Could not update your password. Please try again." }, 500);
  }
  const appMetadata = {
    ...(current.user.app_metadata ?? {}),
    must_change_password: false,
  };

  // Set the new password and clear the flag together — atomic and admin-only.
  const { error: updateErr } = await admin.auth.admin.updateUserById(sub, {
    password,
    app_metadata: appMetadata,
  });
  if (updateErr) {
    console.error("updateUserById failed:", updateErr);
    return json({ error: "Could not update your password. Please try again." }, 500);
  }

  return json({ ok: true });
});
