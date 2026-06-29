// Staff Management — Supabase Edge Function (P1)
//
// Lets a Manager provision and disable staff accounts from inside the app, so
// a real care-home manager never needs the Supabase dashboard. Creating an
// auth user and banning/unbanning require admin privileges, so this runs with
// the SERVICE ROLE key — which lives only in this function's environment and
// is never shipped in the app.
//
// Deploy:
//   supabase functions deploy manage-staff
//   (SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY are injected automatically.)
//
// Security model:
// - The platform verifies the caller's Supabase JWT (verify_jwt on).
// - On top of that we gate by role + AAL: only a MANAGER at AAL2 may call this,
//   mirroring require_mfa_for_privileged_roles.
// - The new/target account's home is FORCED to the manager's own app_home_id
//   claim — never taken from the request — so a manager can only manage staff
//   in their own home.
// - A manager may provision internal staff (support_worker, team_leader,
//   manager), parent/guardian accounts, and inspector accounts — see
//   ALLOWED_ROLES. Linking parents to children and granting inspectors home
//   access are separate flows; this function only creates the account.

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
function jwtClaims(authHeader: string | null): Record<string, unknown> {
  try {
    const token = authHeader?.replace(/^Bearer\s+/i, "") ?? "";
    const payload = token.split(".")[1];
    return JSON.parse(atob(payload.replace(/-/g, "+").replace(/_/g, "/")));
  } catch {
    return {};
  }
}

// Roles a manager may provision in-app: internal staff, parent/guardian
// accounts (created here, then linked to a child separately), and inspector
// accounts (created here, then granted time-boxed home access separately).
// Every account is forced onto the manager's own home and made to reset its
// temporary password on first login.
const ALLOWED_ROLES = [
  "support_worker",
  "team_leader",
  "manager",
  "parent_guardian",
  "inspector",
];

// ~100 years — effectively permanent until explicitly re-enabled.
const BAN_DURATION = "876600h";

const EMAIL_RE = /^[^@\s]+@[^@\s]+\.[^@\s]+$/;

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }
  if (req.method !== "POST") {
    return json({ error: "Method not allowed" }, 405);
  }

  // Role + MFA gate — managers only, at AAL2.
  const claims = jwtClaims(req.headers.get("Authorization"));
  const role = claims["app_role"] as string | undefined;
  const aal = claims["aal"] as string | undefined;
  const managerHomeId = claims["app_home_id"] as string | undefined;
  if (role !== "manager") {
    return json({ error: "Forbidden: staff management is limited to managers" }, 403);
  }
  if (aal !== "aal2") {
    return json({ error: "Forbidden: complete the MFA challenge first" }, 403);
  }
  if (!managerHomeId) {
    return json({ error: "Your account has no home assigned. Contact an administrator." }, 403);
  }

  const url = Deno.env.get("SUPABASE_URL");
  const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!url || !serviceKey) {
    return json({ error: "Server is not configured for staff management." }, 500);
  }
  const admin = createClient(url, serviceKey, {
    auth: { autoRefreshToken: false, persistSession: false },
  });

  let body: {
    action?: string;
    email?: string;
    password?: string;
    displayName?: string;
    role?: string;
    userId?: string;
    active?: boolean;
  };
  try {
    body = await req.json();
  } catch {
    return json({ error: "Invalid JSON body" }, 400);
  }

  switch (body.action) {
    case "create":
      return await createStaff(admin, managerHomeId, body);
    case "setActive":
      return await setActive(admin, managerHomeId, body);
    case "resetPassword":
      return await resetPassword(admin, managerHomeId, body);
    default:
      return json({ error: "Unknown action" }, 400);
  }
});

async function createStaff(
  // deno-lint-ignore no-explicit-any
  admin: any,
  homeId: string,
  body: { email?: string; password?: string; displayName?: string; role?: string },
): Promise<Response> {
  const email = body.email?.trim().toLowerCase() ?? "";
  const password = body.password ?? "";
  const displayName = body.displayName?.trim() ?? "";
  const role = body.role ?? "";

  if (!EMAIL_RE.test(email)) {
    return json({ error: "Enter a valid email address." }, 400);
  }
  if (password.length < 8) {
    return json({ error: "Temporary password must be at least 8 characters." }, 400);
  }
  if (displayName.length === 0) {
    return json({ error: "Enter the staff member's name." }, 400);
  }
  if (!ALLOWED_ROLES.includes(role)) {
    return json({ error: "Choose a valid role." }, 400);
  }

  // Create the auth user (email pre-confirmed — managers vouch for staff).
  const { data: created, error: createErr } = await admin.auth.admin.createUser({
    email,
    password,
    email_confirm: true,
    // must_change_password forces the app's set-password screen on first login,
    // so the manager's temporary password is only ever transitional and the
    // staff member sets (and solely knows) their own. Cleared by updateUser.
    user_metadata: { display_name: displayName, must_change_password: true },
  });
  if (createErr) {
    // Most common: email already registered.
    const msg = /already|exist|registered/i.test(createErr.message ?? "")
      ? "An account with that email already exists."
      : "Could not create the account. Please try again.";
    console.error("createUser failed:", createErr);
    return json({ error: msg }, 400);
  }

  const newId = created.user.id;

  // Matching user_profiles row — role + the MANAGER'S home (never client-supplied).
  const { error: profileErr } = await admin.from("user_profiles").insert({
    id: newId,
    home_id: homeId,
    role,
    display_name: displayName,
    email,
    is_active: true,
  });
  if (profileErr) {
    // Roll back the orphaned auth user so a retry can reuse the email.
    console.error("user_profiles insert failed, rolling back auth user:", profileErr);
    await admin.auth.admin.deleteUser(newId);
    return json({ error: "Could not finish setting up the account. Please try again." }, 500);
  }

  return json({ ok: true, id: newId });
}

async function setActive(
  // deno-lint-ignore no-explicit-any
  admin: any,
  homeId: string,
  body: { userId?: string; active?: boolean },
): Promise<Response> {
  const userId = body.userId ?? "";
  const active = body.active === true;
  if (userId.length === 0) {
    return json({ error: "Missing user id." }, 400);
  }

  // The target must belong to the manager's own home — a manager cannot touch
  // staff in another home.
  const { data: target, error: lookupErr } = await admin
    .from("user_profiles")
    .select("id, home_id, role")
    .eq("id", userId)
    .maybeSingle();
  if (lookupErr || !target) {
    return json({ error: "Staff member not found." }, 404);
  }
  if (target.home_id !== homeId) {
    return json({ error: "Forbidden: that account is in another home." }, 403);
  }

  // Ban (disable) or clear the ban (enable) at the auth layer — this is what
  // actually blocks sign-in — then mirror it onto is_active for display.
  const { error: banErr } = await admin.auth.admin.updateUserById(userId, {
    ban_duration: active ? "none" : BAN_DURATION,
  });
  if (banErr) {
    console.error("updateUserById (ban) failed:", banErr);
    return json({ error: "Could not update the account. Please try again." }, 500);
  }

  const { error: flagErr } = await admin
    .from("user_profiles")
    .update({ is_active: active })
    .eq("id", userId);
  if (flagErr) {
    console.error("is_active update failed:", flagErr);
    return json({ error: "Account updated, but its status may be out of sync. Refresh." }, 500);
  }

  return json({ ok: true });
}

// Reset an account's password to a manager-set temporary one and re-arm the
// forced password change, so the user signs in once with the temp password and
// is then made to set their own. This is the in-app answer to "I forgot my
// password" — a manager resolves it without the Supabase dashboard.
async function resetPassword(
  // deno-lint-ignore no-explicit-any
  admin: any,
  homeId: string,
  body: { userId?: string; password?: string },
): Promise<Response> {
  const userId = body.userId ?? "";
  const password = body.password ?? "";
  if (userId.length === 0) {
    return json({ error: "Missing user id." }, 400);
  }
  if (password.length < 8) {
    return json({ error: "Temporary password must be at least 8 characters." }, 400);
  }

  // The target must belong to the manager's own home.
  const { data: target, error: lookupErr } = await admin
    .from("user_profiles")
    .select("id, home_id, display_name")
    .eq("id", userId)
    .maybeSingle();
  if (lookupErr || !target) {
    return json({ error: "That account was not found." }, 404);
  }
  if (target.home_id !== homeId) {
    return json({ error: "Forbidden: that account is in another home." }, 403);
  }

  // Set the new temporary password and re-arm must_change_password. Carry the
  // existing display_name so the metadata merge never drops it.
  const { error: updateErr } = await admin.auth.admin.updateUserById(userId, {
    password,
    user_metadata: {
      display_name: target.display_name,
      must_change_password: true,
    },
  });
  if (updateErr) {
    console.error("resetPassword updateUserById failed:", updateErr);
    return json({ error: "Could not reset the password. Please try again." }, 500);
  }

  return json({ ok: true });
}
