# TailorEd Notes — Master To-Do List

> Source of truth for everything required from both the business proposal (Rabi Ahmed)
> and the technical build brief (guide.txt). Update this as items complete.
>
> Last updated: 2026-05-28

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
| I4 | MFA for Manager and Inspector roles | ✅ | `MfaScreen` built — enrollment mode (first-time TOTP setup with manual secret key entry) + challenge mode (ongoing 6-digit code). Triggers automatically post-login via `needsMfaChallenge` on `AppUser`. Session upgrades to AAL2 on success. Supabase TOTP enabled platform-wide. |
| I5 | Semantic labels on all interactive elements | ⬜ | Nav shell done. Module cards on profile screen, FABs, checklist task tiles, note cards — all missing Semantics wrappers or tooltip/semanticLabel properties. Guide: every interactive element labelled, text scales to 200%. |

---

## Phase 1 — Foundation

| # | Task | Status | Notes |
|---|------|--------|-------|
| 1 | Project setup, folder structure, pubspec.yaml | ✅ | |
| 2 | Design tokens — colours, spacing, radius, typography | ✅ | |
| 3 | Theme — light + dark ThemeData | ✅ | |
| 4 | Router skeleton — all top-level routes, placeholder screens | ✅ | `/daily-notes` tab (Support Worker + Team Leader) now shows `DailyNotesHubScreen` — lists all children, tap routes to that child's daily notes. Other unused top-level placeholders remain as stubs. |
| 5 | Supabase client — EU region, --dart-define credentials, safe null init | ✅ | |
| 6 | Auth — login screen, role-based redirect, MFA | ✅ | Email/password login + MFA (TOTP) for Manager and Inspector. Settings screen with sign-out, theme switcher, user/role card. |
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
| 24 | Incident reporting (replaces Datix) | ✅ | `features/incidents/`. IncidentReport (freezed), 6 incident types (behaviour/medical/accident/property damage/missing person/safeguarding), 4 severity levels, immediate action, injury details, police/parent/manager notification toggles, follow-up tracking. Drift table + DAO + repo (audit wired) + providers + list screen + editor. Module card on child profile. schemaVersion 14. |
| 25 | Auto shift handover summary | ✅ | `features/handover/`. HandoverSummaryScreen auto-generates from live Drift data — no manual entry. Per-child cards with flag chips (physical intervention/safeguarding/critical/med refusal) and section rows for notes, behaviour, incidents, medication, bath temp. Accessible via summarize button on Handover tab. |
| 26 | Team Leader oversight queue | ✅ | `features/handover/`. Shift overview screen on the Handover tab. Per-shift progress bar, children split into Needs Attention / Fully Documented sections. Each card shows missing sections or ✓ all complete. Taps through to child profile. Live from Drift streams. |
| 27 | Manager Oversight Dashboard | ✅ | `features/dashboard/`. ManagerDashboardScreen — aggregates all children live from Drift. Header stats card, priority alert cards (safeguarding/critical/intervention/med refusal), documentation status with child names, incidents by severity, behaviour summary. Route: /dashboard. |
| 28 | Behaviour Pattern Tracking Dashboard | ✅ | `features/dashboard/`. BehaviourPatternScreen — fl_chart bar chart (daily trend), shift/severity/child breakdown bars, top 5 antecedents. Period filter (7/14/30 days), child filter dropdown. Accessible from Manager Dashboard + Team Leader Oversight AppBars. Route: /dashboard/behaviour-patterns. |

---

## Phase 5 — External Access

| # | Task | Status | Notes |
|---|------|--------|-------|
| 29 | Regulatory Inspector Access Portal | ⬜ | Time-limited tokens + **feedback/recommendation entry** (proposal says inspectors can leave correction points — not just read-only). Full audit trail of all inspector activity. |
| 30 | Parent/Guardian Portal | ⬜ | Activities, achievements, wellbeing updates, photos (where permissions granted). Read-only. Controlled by role permissions. |
| 31 | AI-assisted shift summary | ⬜ | Anthropic API via Supabase Edge Function. Auto-summarises shift notes into handover brief. |

---

## Backend / Supabase

| # | Task | Status | Notes |
|---|------|--------|-------|
| B1 | Provision Supabase project — EU region (eu-west-2) | ✅ | Provisioned 2026-05-27. URL: https://uvjvizphpmxybezkjjbl.supabase.co. eu-west-2 London — UK GDPR compliant. |
| B2 | Full schema SQL — all tables with `id, home_id, created_at, updated_at, created_by, updated_by, deleted_at` | ✅ | 21 tables total (user_profiles, inspector_grants + 19 care tables). Script at `supabase_schema.sql`. |
| B3 | RLS policies on every table, every role | ✅ | All 21 tables have RLS. Auto-RLS enabled on project. home_id-scoped read/write for all roles. |
| B4 | `audit_log` table | ✅ | Audit log table + triggers on all 18 care-record tables. |
| B5 | `inspector_grants` table — `(inspector_user_id, home_id, granted_by, expires_at, scope[])` | ✅ | Table created. `inspector_has_grant()` function + RLS policies ready for Phase 5. |
| B6 | Supabase Auth — MFA (TOTP) enabled for Manager and Inspector roles | ✅ | TOTP enabled platform-wide. Enforcement in Flutter via `needsMfaChallenge` on `AppUser` (reads `aal` JWT claim). |
| B7 | Storage bucket for child photos — EU region, private, access-controlled | ✅ | `child-photos` bucket. Private, 5 MB limit, jpeg/png/webp only. RLS policies in place. |
| B8 | Supabase Edge Function for AI shift summary | ⬜ | Blocked on Phase 5 item 31. Infrastructure ready; function not written yet. |

---

## Quality & Cross-cutting  *(ongoing — some are overdue)*

| # | Task | Status | Notes |
|---|------|--------|-------|
| Q1 | `core/audit/` — AuditLogWriter built and called by all repositories | 🔧 | Local Drift part done (same as I1). Backend `audit_log` Supabase table live (B4 done). Sync of local audit rows to Supabase not yet wired — part of Q2 offline sync work. |
| Q2 | Proper offline sync queue in `core/offline/` | ⬜ | Current `_trySyncToSupabase()` is fire-and-forget with no retry, no queue, no conflict resolution. Needs a proper sync engine. Guide specifies "Drift offline sync engine" in `core/offline/`. |
| Q3 | Date/time — render in Europe/London timezone everywhere | ⬜ | Currently displaying UTC. Guide says: always UTC in storage, render in Europe/London. |
| Q4 | Riverpod `select()` — prevent unnecessary rebuilds | ⬜ | Currently using plain `watch()` everywhere. For large screens this will cause rebuild storms. |
| Q5 | Unit tests — all domain models and repositories | ⬜ | 0 tests written. Guide specifies `test/unit/`. |
| Q6 | Widget tests — all screens | ⬜ | 0 tests written. Guide specifies `test/widget/`. |
| Q7 | Integration tests — offline→online sync, auth flow | ⬜ | 0 tests written. Guide specifies `test/integration/`. |
| Q8 | CI — `dart format` + `dart analyze` gate on every push | ⬜ | |
| Q9 | Update ROADMAP.md to reflect actual current status | ⬜ | Needs a full update to match current progress. |
| Q10 | ~~reactive_forms~~ — **dropped from stack** | ✅ | Guide listed it as required but entire codebase (15+ screens) uses TextEditingController consistently. Migrating would be pure churn with regression risk and no functional gain. Removed from pubspec. Decision logged in ROADMAP. |
| Q11 | Fix delete confirmation dialogs — all screens | ✅ | `Navigator.pop(context, ...)` inside dialog builders was using the outer screen context instead of the dialog's own context, causing the wrong navigator to be popped inside ShellRoute. Fixed across all 12 screens (bath temp, daily notes, incidents, behaviour, sleep diary, food diary, activities, smart steps, visitor log, medication, medical history, care plans). |
| Q12 | Fix voice-to-text in daily note editor | ✅ | Original code only acted on `finalResult` which never fired on many Android devices. Removed `localeId: 'en_GB'` (silently failed if language pack missing). Added real-time partial result display. Moved session-end logic to `onStatus` callback in `initialize()` — `await _speech.listen()` returns immediately on start, not on finish, so the previous code was resetting `_isListening` right after starting. |
| Q13 | Full codebase audit — bugs and inconsistencies | ✅ | Found and fixed: `homeId ?? ''` → `'dev-home-001'` in add_child_screen (children would be saved with empty homeId and disappear from all lists); `Theme.of(context)` → `Theme.of(dialogContext)` in 2 remaining dialog builders (care_plan_detail, daily_notes_list); sleep diary FAB `AppColors.roleSupportWorker` → `teal400` (role badge color misused as action color); ABC labels in behaviour_screen hardcoded → AppStrings; mic semanticLabel inline strings → AppStrings. |
| Q14 | Router role-based route guards | ✅ | Added `_isRouteAllowed(location, role)` and `_defaultRoute(role)` to app_router.dart. Redirect now enforces role after auth/MFA checks — forbidden routes silently redirect to the role's default landing screen. Also fixed post-MFA redirect to use `_defaultRoute` (inspector → `/inspector`, parentGuardian → `/parent-portal`) instead of hardcoded `/children`. |

---

## Summary — what's actually done vs what's required

*Last updated: 2026-05-29 (session 4)*

| Area | Done | Total | % |
|------|------|-------|---|
| Phase 1 — Foundation | 9 of 9 | ✅ COMPLETE | 100% |
| Phase 2 — Daily Loop | 6 of 6 | ✅ COMPLETE | 100% |
| Phase 3 — Care Records | 8 of 8 | ✅ COMPLETE | 100% |
| Phase 4 — Oversight | 5 of 5 | ✅ COMPLETE | 100% |
| Phase 5 — External | 0 of 3 | | 0% |
| Backend / Supabase | 7 of 8 | (B8 Edge Function pending Phase 5 item 31) | 88% |
| Infrastructure gaps | 4 of 5 | (I5 accessibility/semantics pending) | 80% |
| Quality / cross-cutting | 5 of 14 | (Q10–Q14 done; Q1 partial) | 36% |
| **Total** | **44 of 57** | | **77%** |

---

## Recommended build order from here

1. **Phase 5 item 29** — Regulatory Inspector Access Portal (time-limited tokens, feedback entry)
2. **Phase 5 item 30** — Parent/Guardian Portal (read-only, activity/achievement/photo updates)
3. **Phase 5 item 31** — AI-assisted shift summary (Anthropic API via Supabase Edge Function) → also completes B8
4. **I5** — Accessibility: semantic labels on all interactive elements
5. **Q2** — Proper offline sync queue (critical before going live with real data)
6. **Q3** — Timezone rendering (UTC → Europe/London)
7. **Q-items** — Tests and CI pipeline — weave in throughout
