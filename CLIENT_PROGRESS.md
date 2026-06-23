# TailorEd Notes — Progress Update

**Date:** 23 June 2026
**Status:** Feature-complete — in final testing and hardening ahead of launch.

TailorEd Notes is a digital care-documentation app for residential children's
homes, replacing paper records and disconnected tools with one secure system
for staff, managers, inspectors, and parents.

---

## Where we are at a glance

| Area | Status |
|------|--------|
| Core app & all care records | ✅ Built |
| Manager & oversight tools | ✅ Built |
| Inspector & parent access | ✅ Built |
| Staff management (in-app) | ✅ Built — final setup pending |
| Security & two-factor sign-in | ✅ Built |
| Branding, colours & app icon | ✅ Done |
| Final device testing | 🔄 In progress |
| AI shift summary | 🔄 Built — awaiting AI service top-up |

**Overall: all planned features are built. The remaining work is testing,
final sign-off, and switching on the last two services.**

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

**Staff management (new)**
- Managers can now create and disable staff accounts from inside the app —
  no need to touch any technical dashboard.

**Built-in throughout**
- Works **offline** and syncs automatically when back online.
- Data hosted in the **UK** (GDPR compliant).
- A complete **audit trail** on every change.
- **Accessibility**: large-text support and screen-reader labelling.
- Consistent, professional branding with the TailorEd colour palette and a new
  app icon.

---

## Completed in this latest round

- Polished, professional colour design across the app (brand-led, not noisy).
- New branded **app icon** for the home screen.
- Improved sign-in: clearer error messages, smoother button behaviour.
- Bug fixes found during review.
- In-app **staff management** for managers.

---

## What's left before go-live

These do not require more features — it's testing, sign-off, and final setup:

1. **Final testing on real devices** — checking each screen, the offline sync,
   and accessibility on phones and tablets.
2. **Switch on the AI shift-summary** — the feature is built and deployed; it
   needs the AI service account topped up with credit to go live.
3. **Activate in-app staff management** — one quick server step to enable it.
4. **Automated test coverage** — adding tests that guard against future
   regressions (in progress).

---

*Prepared for client review. Happy to walk through any section in more detail
or arrange a live demo.*
