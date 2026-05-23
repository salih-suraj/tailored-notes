# TailorEd Notes — Master To-Do List

> Source of truth for everything required from both the business proposal (Rabi Ahmed)
> and the technical build brief (guide.txt). Update this as items complete.
>
> Last updated: 2026-05-22

---

## Status key

| Symbol | Meaning |
|--------|---------|
| ✅ | Done and clean |
| 🔧 | Built but has known gaps (see Notes) |
| ⬜ | Not started |
| 🚫 | Blocked — dependency noted |

---

## STOP — Infrastructure Gaps (do before continuing any features)

These are non-negotiable requirements from the build brief that have been skipped.
Every new feature added without them makes the retrofit harder.

| # | Task | Status | Notes |
|---|------|--------|-------|
| I1 | Build `core/audit/` — AuditLogWriter called by every repository on every mutation | ✅ | AuditLogTable + AuditLogDao + AuditLogWriter. Wired into DailyNotesRepository + ChecklistItemsRepository. schemaVersion bumped to 3. |
| I2 | Add `created_by` + `updated_by` to DailyNotesTable and ChecklistItemsTable | ✅ | `updated_by_id/name` on DailyNotesTable. `created_by_id/updated_by_id` on ChecklistItemsTable. Every new table must include these from day one. |
| I3 | Fix AppStrings violations in all existing screens | ✅ | All 4 screens fixed. Added: childNotFound, careRecordSection, module labels/descs, checklist strings, observation strings. |
| I4 | MFA for Manager and Inspector roles | ⬜ | Build brief requires this. Supabase supports TOTP MFA. Flutter side needs MFA prompt flow on login for those roles. |
| I5 | Semantic labels on all interactive elements | ⬜ | Nav shell done. Module cards on profile screen, FABs, checklist task tiles, note cards — all missing Semantics wrappers or tooltip/semanticLabel properties. Guide: every interactive element labelled, text scales to 200%. |

---

## Phase 1 — Foundation

| # | Task | Status | Notes |
|---|------|--------|-------|
| 1 | Project setup, folder structure, pubspec.yaml | ✅ | |
| 2 | Design tokens — colours, spacing, radius, typography | ✅ | |
| 3 | Theme — light + dark ThemeData | ✅ | |
| 4 | Router skeleton — all top-level routes, placeholder screens | ✅ | |
| 5 | Supabase client — EU region, --dart-define credentials, safe null init | ✅ | |
| 6 | Auth — login screen, role-based redirect | 🔧 | Works for email/password. MFA not built (see I4). |
| 7 | Navigation shell — bottom bar (mobile) + rail (tablet) + extended rail (wide) | ✅ | Role-based tabs. Semantic labels on icons. |
| 8 | Children list screen | ✅ | Loading/error/empty states. |
| 9 | Child profile screen | ✅ | Avatar, age, room, shift progress bar, module cards. |

---

## Phase 2 — Core Daily Loop

| # | Task | Status | Notes |
|---|------|--------|-------|
| 10 | Daily notes & observations | ✅ | Full CRUD + voice-to-text. AppStrings + updated_by + audit trail all wired. |
| 11 | Documentation completion status bar | ✅ | ShiftProgressBar + CompletionDot. Daily Notes, Bath Temp, Medication all wired live. Cleaning removed from bar at client request. |
| 12 | Alerts for incomplete documentation | ✅ | Amber banner on children list (names outstanding docs). Red/amber alert card on child profile (lists specific missing sections). Medication section excluded from completion tracking when no scheduled meds exist. |
| 13 | Cleaning checklists (room + communal) | 🔧 | Built and working but removed from child profile at client request. Code + DB intact. Accessible via `/checklists/cleaning` route. Home-level screen (`HomeCleaningScreen`) built. Revisit placement with client. |
| 14 | Bath temperature check | ✅ | `features/checklists/`. BathTempRecord (freezed), Drift table, DAO, repo (audit wired), provider, screen with bottom-sheet entry. Colour-coded: <37°C blue, 37–40°C green, >40°C red. Wired to completion bar (per-day). schemaVersion 4. |
| 15 | Visitor log | ✅ | `features/checklists/`. VisitorLogEntry (freezed), Drift table, DAO, repo (audit wired), provider, list screen + full entry screen. On-site badge, departure recording, relation chips. Replaces /checklists nav tab placeholder. schemaVersion 5. |

---

## Phase 3 — Care Records

| # | Task | Status | Notes |
|---|------|--------|-------|
| 16 | Child-centred Care Plans | ✅ | `features/care_plans/`. CarePlan + CarePlanGoal (freezed), 2 Drift tables, combined DAO, repository (audit wired), providers, list/detail/editor screens. Goal categories (7), statuses (4), support strategy field. schemaVersion 6. |
| 17 | Medication administration record (MAR) | ✅ | `features/medication/`. PrescribedMed + MedAdministration (freezed). Scheduled vs PRN split. AdminOutcome (administered/refused/held). Outcome-coloured sheet. Completion bar wired (all scheduled meds recorded = done). schemaVersion 7. |
| 18 | Medical history | ✅ | `features/medical_history/`. MedicalProfile + HealthcareContact (freezed). Allergy banner in red (critical). Phone tap-to-copy. 8 contact types. Profile editor + contact bottom sheet. schemaVersion 8. |
| 19 | Behaviour monitoring & charts | ✅ | `features/behaviour/`. BehaviourIncident (freezed), ABC model (Antecedent/Behaviour/Consequence), severity (mild/moderate/severe), physical intervention + injury safety flags with red toggle styling, date/time picker. schemaVersion 9. |
| 20 | Sleep diary | ✅ | `features/sleep_diary/`. SleepEntry (freezed), bed/settled/wake times ('HH:mm'), wakings count, quality (poor/fair/good), per-child list screen + editor. schemaVersion 10. |
| 21 | Food diary | ✅ | `features/food_diary/`. FoodEntry (freezed), 7 meal types colour-coded, appetite (good/fair/poor), description + concerns. Auto-selects meal from time of day. schemaVersion 11. |
| 22 | Activity records, reward charts, achievements | ✅ | `features/activities/`. ActivityEntry (freezed), 7 categories colour-coded, reward toggle (⭐), achievement highlight field (🏆 badge on card). schemaVersion 12. |
| 23 | Smart Steps progress tracking | ✅ | `features/smart_steps/`. SmartStep + StepProgress (freezed), 8 categories, 3 statuses, grouped list (In Progress / Not Started / Achieved), detail screen with progress notes, auto-marks step as Achieved when progress outcome = achieved. schemaVersion 13. |

---

## Phase 4 — Oversight

| # | Task | Status | Notes |
|---|------|--------|-------|
| 24 | Incident reporting (replaces Datix) | ⬜ | Designed specifically for residential childcare — simpler than Datix. Severity levels, involved parties, follow-up actions. |
| 25 | Auto shift handover summary | ⬜ | Compiles key information from the shift into a clear summary for the next team. Reduces manual effort for Team Leaders. |
| 26 | Team Leader oversight queue | ✅ | `features/handover/`. Shift overview screen on the Handover tab. Per-shift progress bar, children split into Needs Attention / Fully Documented sections. Each card shows missing sections or ✓ all complete. Taps through to child profile. Live from Drift streams. |
| 27 | Manager Oversight Dashboard | ⬜ | Completion levels across staff/shifts, incidents, behaviour trends, medication records, safeguarding alerts. Real-time overview. |
| 28 | Behaviour Pattern Tracking Dashboard | ⬜ | Visual analytics — trends over time, potential triggers, sleep/activity correlations. |

---

## Phase 5 — External Access

| # | Task | Status | Notes |
|---|------|--------|-------|
| 29 | Regulatory Inspector Access Portal | ⬜ | Time-limited tokens + **feedback/recommendation entry** (proposal says inspectors can leave correction points — not just read-only). Full audit trail of all inspector activity. |
| 30 | Parent/Guardian Portal | ⬜ | Activities, achievements, wellbeing updates, photos (where permissions granted). Read-only. Controlled by role permissions. |
| 31 | AI-assisted shift summary | ⬜ | Anthropic API via Supabase Edge Function. Auto-summarises shift notes into handover brief. |

---

## Backend / Supabase  *(parallel track — needs Supabase project first)*

| # | Task | Status | Notes |
|---|------|--------|-------|
| B1 | Provision Supabase project — EU region (eu-west-2 or eu-central-1) | ⬜ | **Abba must create this.** Nothing else in this section can proceed without it. |
| B2 | Full schema SQL — all tables with `id, home_id, created_at, updated_at, created_by, updated_by, deleted_at` | 🚫 | Blocked on B1. |
| B3 | RLS policies on every table, every role | 🚫 | Blocked on B1. Non-negotiable: no user reads/writes outside their home + role scope. |
| B4 | `audit_log` table | 🚫 | Blocked on B1. |
| B5 | `inspector_grants` table — `(inspector_user_id, home_id, granted_by, expires_at, scope[])` | 🚫 | Blocked on B1. |
| B6 | Supabase Auth — MFA (TOTP) enabled for Manager and Inspector roles | 🚫 | Blocked on B1. |
| B7 | Storage bucket for child photos — EU region, private, access-controlled | 🚫 | Blocked on B1. |
| B8 | Supabase Edge Function for AI shift summary | 🚫 | Blocked on B1 and Phase 5 item 31. |

---

## Quality & Cross-cutting  *(ongoing — some are overdue)*

| # | Task | Status | Notes |
|---|------|--------|-------|
| Q1 | `core/audit/` — AuditLogWriter built and called by all repositories | 🔧 | Local Drift part done (same as I1). Backend `audit_log` Supabase table still blocked on B1. |
| Q2 | Proper offline sync queue in `core/offline/` | ⬜ | Current `_trySyncToSupabase()` is fire-and-forget with no retry, no queue, no conflict resolution. Needs a proper sync engine. Guide specifies "Drift offline sync engine" in `core/offline/`. |
| Q3 | Date/time — render in Europe/London timezone everywhere | ⬜ | Currently displaying UTC. Guide says: always UTC in storage, render in Europe/London. |
| Q4 | Riverpod `select()` — prevent unnecessary rebuilds | ⬜ | Currently using plain `watch()` everywhere. For large screens this will cause rebuild storms. |
| Q5 | Unit tests — all domain models and repositories | ⬜ | 0 tests written. Guide specifies `test/unit/`. |
| Q6 | Widget tests — all screens | ⬜ | 0 tests written. Guide specifies `test/widget/`. |
| Q7 | Integration tests — offline→online sync, auth flow | ⬜ | 0 tests written. Guide specifies `test/integration/`. |
| Q8 | CI — `dart format` + `dart analyze` gate on every push | ⬜ | |
| Q9 | Update ROADMAP.md to reflect actual current status | ⬜ | Needs a full update to match current progress. |

---

## Summary — what's actually done vs what's required

*Last updated: 2026-05-23*

| Area | Done | Total | % |
|------|------|-------|---|
| Phase 1 — Foundation | 8 of 9 | (MFA pending Supabase) | 89% |
| Phase 2 — Daily Loop | 6 of 6 | ✅ COMPLETE | 100% |
| Phase 3 — Care Records | 8 of 8 | ✅ COMPLETE | 100% |
| Phase 4 — Oversight | 1 of 5 | (Team Leader oversight done) | 20% |
| Phase 5 — External | 0 of 3 | | 0% |
| Backend / Supabase | 0 of 8 | (all blocked on B1) | 0% |
| Infrastructure gaps | 3 of 5 | (I4 MFA + I5 semantics pending) | 60% |
| Quality / cross-cutting | 0 of 9 | | 0% |
| **Total** | **26 of 53** | | **49%** |

---

## Recommended build order from here

1. **Phase 4** — Oversight, starting with item 24 (Incident Reporting — replaces Datix)
2. **B1** — Abba provisions Supabase — unblocks RLS, MFA, audit backend, AI summary
3. **Phase 2 item 12** — Alerts for incomplete documentation
4. **Phase 5** — External access (inspector portal, parent portal, AI summary)
5. **Q-items** — tests, timezone rendering, CI pipeline — weave in throughout
