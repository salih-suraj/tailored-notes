# TailorEd Notes — Build Roadmap

> Updated as we build. Each item is marked `done`, `in progress`, or `todo`.
> Full tracking in TODO.md. Phases match the build brief in `guide.txt`.

---

## Phase 1 — Foundation

| # | Task | Status | Notes |
|---|------|--------|-------|
| 1 | Project init + folder structure | `done` | 61 dirs, all feature folders scaffolded |
| 2 | `pubspec.yaml` — all dependencies | `done` | 141 packages resolved |
| 3 | Theme (`core/theme/`) — light + dark, all tokens | `done` | All colour/spacing/typography tokens |
| 4 | Router skeleton — all top-level routes | `done` | go_router, all routes defined, placeholder screens |
| 5 | Supabase client setup (EU region) | `done` | --dart-define credentials, safe null init |
| 6 | Auth — login screen, auth state provider, role-based redirect | `done` | Email/password. MFA pending (see Infrastructure). |
| 7 | Navigation shell — bottom tabs (mobile) + rail (tablet) | `done` | Role-based tabs, semantic labels on icons |
| 8 | Children list screen + child profile overview screen | `done` | List + profile screens, loading/error/empty states |

---

## Phase 2 — Core Daily Loop

| # | Task | Status | Notes |
|---|------|--------|-------|
| 5 | Daily notes & observations (voice-to-text) | `done` | Full CRUD + voice-to-text, Drift + Supabase sync |
| 6 | Documentation completion status (progress bar) | `done` | ShiftProgressBar + CompletionDot, live from Drift stream |
| 7 | Cleaning checklists (room + communal) | `done` | Room (5 tasks) + communal areas, in `features/checklists/` |
| 8 | Bath temperature check | `todo` | Goes in `features/checklists/` |
| 9 | Visitor log | `todo` | Goes in `features/checklists/` |
| – | Alerts for incomplete documentation | `done` | Banner on children list + alert card on child profile. Live from Drift streams. |

---

## Phase 3 — Care Records

| # | Task | Status | Notes |
|---|------|--------|-------|
| – | Child-centred Care Plans | `todo` | From proposal — was missing from original plan |
| 10 | Medication administration record (MAR + PRN + refusals) | `todo` | |
| 11 | Medical history | `todo` | |
| 12 | Behaviour monitoring & charts | `todo` | |
| 13 | Sleep diary | `todo` | |
| 14 | Food diary | `todo` | |
| 15 | Activity records, reward charts, achievements | `todo` | |
| 16 | Smart Steps progress tracking | `todo` | |

---

## Phase 4 — Oversight

| # | Task | Status | Notes |
|---|------|--------|-------|
| 17 | Incident reporting (replaces Datix) | `done` | `features/incidents/`. 6 types, 4 severity levels, notifications, follow-up. schemaVersion 14. |
| 18 | Shift handover summary (auto-generated) | `done` | `features/handover/`. HandoverSummaryScreen — per-child flag chips + section rows, live from Drift. |
| 19 | Team Leader oversight queue | `done` | Shift overview on Handover tab. Progress bar, Needs Attention / Fully Documented sections, taps to child profile. |
| 20 | Manager Oversight Dashboard | `done` | `features/dashboard/`. ManagerDashboardScreen — priority alerts + aggregated home-wide stats. |
| 21 | Behaviour Pattern Tracking Dashboard | `done` | `features/dashboard/`. BehaviourPatternScreen — fl_chart trend chart, shift/severity/child bars, antecedents. |

---

## Phase 5 — External Access

| # | Task | Status | Notes |
|---|------|--------|-------|
| 22 | Regulatory Inspector Access Portal | `todo` | Time-limited tokens + **inspector feedback entry** (not just read-only) |
| 23 | Parent/Guardian Portal | `todo` | |
| 24 | AI-assisted shift summary | `todo` | Anthropic API via Supabase Edge Function |

---

## Infrastructure & Cross-Cutting

| Task | Status | Notes |
|------|--------|-------|
| Audit trail (`core/audit/`) — every mutation logged | `done` | AuditLogWriter, local Drift table, Supabase sync |
| `created_by` / `updated_by` on all Drift tables | `done` | Added to DailyNotesTable + ChecklistItemsTable. All future tables must include at creation. |
| MFA for Manager + Inspector roles | `todo` | Requires Supabase project to be provisioned first |
| AppStrings — all UI strings through constants | `done` | All existing screens fixed |
| Semantic labels on all interactive elements | `todo` | Nav shell done; profile cards, FABs, tiles in progress |
| Supabase project provisioned (EU region) | `todo` | **Abba must create this** — eu-west-2 or eu-central-1 |
| RLS policies on all tables, all roles | `todo` | Blocked on Supabase project |
| Audit log table in Supabase | `todo` | Blocked on Supabase project |
| Inspector grants table | `todo` | Blocked on Supabase project |
| Drift offline sync engine (proper queue) | `todo` | Currently fire-and-forget; needs retry queue |
| Date/time — render in Europe/London timezone | `todo` | Currently UTC display |
| CI — `dart format` + `dart analyze` gate | `todo` | |
| Unit tests | `todo` | 0 written |
| Widget tests | `todo` | 0 written |
| Integration tests | `todo` | 0 written |

---

## Decisions Log

| Date | Decision | Reason |
|------|----------|--------|
| 2026-05-15 | Starting Phase 1 | Project init session |
| 2026-05-15 | `reactive_forms` bumped to ^18.2.2 | ^17 doesn't exist on pub.dev |
| 2026-05-15 | Supabase credentials via `--dart-define` not `.env` | Avoids secrets in source tree |
| 2026-05-15 | Dropped `always_use_package_imports` lint | Relative imports within `lib/` are idiomatic in Flutter |
| 2026-05-15 | Supabase init skipped when no credentials provided | Allows app to run and show UI before Supabase project is created |
| 2026-05-19 | Bath temp + visitor log go in `features/checklists/` | Matches build brief folder structure |
| 2026-05-19 | Added `updated_by_id/name` to DailyNotesTable | Audit compliance — track who last edited a note |
| 2026-05-19 | Added `created_by_id/updated_by_id` to ChecklistItemsTable | Standard across all tables per build brief |
| 2026-05-19 | AuditLogWriter uses `record()` not `log()` | Avoids name collision with `dart:developer` |
| 2026-05-26 | Dropped `reactive_forms` from tech stack | Guide listed it as required but entire codebase (15+ screens) built consistently with TextEditingController. Migration would be pure churn with regression risk and zero functional gain. Formally removed from pubspec. |
| 2026-05-26 | Moved `ShiftType` to `shared/models/shift_type.dart` | Was incorrectly defined inside `daily_notes/domain/daily_note.dart` despite being used by behaviour, medication, handover, and dashboard features. Exported from `daily_note.dart` for backwards compatibility. |

---

_Last updated: 2026-05-23 — Phase 2 complete. Phase 3 complete. Phase 4 item 17 (Incident Reporting) done. Phase 4 item 19 (Team Leader oversight) done. Alerts for incomplete docs done. Delete buttons added to Medication and Smart Steps. Audit gap in Smart Steps auto-achieve fixed._
