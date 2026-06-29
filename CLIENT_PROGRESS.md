# TailorEd — Progress Update

**Date:** 29 June 2026
**Status:** Feature-complete — onboarding and branding finished; in final testing and hardening ahead of launch.

TailorEd is a digital care-documentation app for residential children's
homes, replacing paper records and disconnected tools with one secure system
for staff, managers, inspectors, and parents.

---

## Where we are at a glance

| Area | Status |
|------|--------|
| Core app & all care records | ✅ Built |
| Manager & oversight tools | ✅ Built |
| Inspector & parent access | ✅ Built |
| Team-leader role & oversight | ✅ Built |
| In-app onboarding (all roles) | ✅ Built |
| Security & two-factor sign-in | ✅ Built |
| AI shift summary | ✅ Live |
| Branding — name, icon & colours | ✅ Done |
| Final device testing | 🔄 In progress |

**Overall: all planned features are built and the app is fully branded as
TailorEd. The remaining work is testing, final sign-off, and security
hardening.**

---

## What the app does today (delivered)

**Secure sign-in**
- Email and password login for every role.
- Two-factor authentication (authenticator app) required for Managers and
  Inspectors, enforced both in the app and on the server.

**Children & care records** — a full digital record for each child:
- Daily notes & observations (with voice-to-text)
- Medication administration (scheduled, as-needed, refusals)
- Medical history, allergies and healthcare contacts
- Care plans and goals
- Behaviour monitoring (with charts and pattern tracking)
- Sleep, food, and activity diaries
- Achievements, rewards, and developmental "Smart Steps"
- Incident reporting
- Bath-temperature and visitor logs

**Daily oversight**
- Live tracking of which records are complete for each shift, with alerts for
  anything outstanding.
- Automatic shift-handover summaries — and an AI-written handover brief.
- Manager dashboard: home-wide view of incidents, behaviour, medication and
  documentation, with safeguarding alerts surfaced first.
- Team-leader oversight queue.

**External access**
- A regulated **Inspector portal** with time-limited, read-only access that is
  fully audit-logged.
- A **Parent/Guardian portal** showing their child's activities and
  achievements (with photo permissions controlled by the manager).

**Roles & in-app onboarding**
- Five roles: support worker, **team leader** (full care access plus oversight,
  below a manager), manager, inspector, and parent/guardian.
- Managers create and manage **all** accounts from inside the app — staff,
  parents, and inspectors — no technical dashboard needed.
- New accounts are given a temporary password and **must set their own** on
  first sign-in, so a manager never knows anyone's real password.
- If someone forgets their password, a manager resets it in one tap.

**Built-in throughout**
- Works **offline** and syncs automatically when back online.
- Data hosted in the **UK** (GDPR compliant).
- A complete **audit trail** on every change.
- **Accessibility**: large-text support and screen-reader labelling.
- Consistent, professional branding with the TailorEd colour palette and a new
  app icon.

---

## Completed in this latest round

- **Rebranded to "TailorEd"** — new app name, home-screen icon, and launch
  screen (the document-in-a-caring-hand mark with a safeguarding shield).
- A calm, consistent **design language** applied across every screen — colour
  is now reserved for things that matter (safety and status), so the important
  signals stand out.
- **Team-leader role** added — sitting between support workers and managers.
- **Full in-app onboarding** for every role, with a forced first-login
  password change and one-tap manager password resets.
- AI shift-summary verified **live**.
- A round of fixes from review (clearer error messages everywhere, layout and
  chart polish).

---

## What's left before go-live

These do not require more features — it's testing, sign-off, and final setup:

1. **Final testing on real devices** — each screen, the offline sync, and
   accessibility on phones and tablets.
2. **Security hardening** — a small tightening of the first-login password step.
3. **Email invitations (optional, later)** — accounts are set up with a
   temporary password today; sending email invites is a nice future addition
   once the app is on the app stores.
4. **Automated test coverage** — tests that guard against future regressions
   (in progress).

---

*Prepared for client review. Happy to walk through any section in more detail
or arrange a live demo.*
