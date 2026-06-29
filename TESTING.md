# TailorEd — Full Manual Test Plan

Five testers, one role each, coordinating live. Tick every box. When a box
fails, note: what you did, what you expected, what happened.

## Role assignment (5 people, 5 roles — one each)

| Tester | Role | Notes |
|--------|------|-------|
| 1 | **Manager** | The linchpin — grants Inspector access and links Parents, so Testers 4 & 5 depend on this person acting first. |
| 2 | **Support Worker** | Logs the bulk of the care data the others will view. |
| 3 | **Team Leader** | Can do everything the Support Worker can, plus oversight/handover. |
| 4 | **Inspector** | Read-only regulatory access; depends on the Manager granting a scoped, time-limited grant. |
| 5 | **Parent/Guardian** | Read-only "My Child" portal; depends on the Manager linking a child. |

## Prerequisites before you start

- [ ] Each tester has their **own account** (auth user + `user_profiles` row with the right `role` and the **same `home_id`** for all of them).
- [ ] Manager and Inspector each have an **authenticator app** (Google Authenticator / Authy / Microsoft Authenticator) on their phone.
- [ ] App is running with the real Supabase credentials (not dev mode).
- [ ] Anthropic account has **credit** (needed only for the AI shift summary test).
- [ ] All four are on the same `home_id` or you won't see each other's data.

---

## A. EVERYONE tests this (all four roles)

- [ ] **Login** with correct email + password succeeds.
- [ ] **Wrong password** shows a clear error, does not log in.
- [ ] After login you land on the **correct home screen for your role**.
- [ ] **Only your role's tabs** appear in the bottom bar (see each role below).
- [ ] **Settings tab** opens: shows your name + role.
- [ ] **Theme switch** (Settings → light / dark / system) changes the app theme.
- [ ] **Sign out** returns you to the login screen.
- [ ] Sign back in — you return to your role's home.
- [ ] **Offline banner:** turn on airplane mode → an amber "you are offline" strip appears; turn it off → it disappears.
- [ ] **Offline data entry** (staff roles): with airplane mode on, create a record → it saves locally; turn airplane mode off → it syncs (confirm another tester can see it).
- [ ] **Big font:** set the phone's system font size to maximum → screens stay usable, text doesn't get cut off.

---

## B. SUPPORT WORKER — full checklist

Tabs expected: **Children · Daily Notes · Checklists · Settings**

### Navigation & children
- [ ] Children list loads (loading → list, or empty state if no children).
- [ ] **Add a child** (FAB): name, date of birth, room — saves and appears in the list.
- [ ] Each child row shows a **documentation completion dot**.
- [ ] An **amber alert banner** names children with outstanding documentation.
- [ ] Open a child → profile shows **avatar, age, room, shift progress bar**.
- [ ] Profile shows an **alert card** listing missing sections (when incomplete).
- [ ] All module cards are present: Daily Notes, Bath Temp, Care Plans, Medication, Medical History, Behaviour, Sleep Diary, Food Diary, Activities, Smart Steps, Incidents.

### Daily notes
- [ ] Open Daily Notes for a child → list (or empty state).
- [ ] **Add a note**: shift auto-selected, type content, save → appears in list with shift badge + time.
- [ ] **Voice-to-text:** tap the mic, speak, words appear in the note.
- [ ] **Edit** a note → change persists.
- [ ] **Delete** a note → confirmation dialog → note removed.
- [ ] **Daily Notes tab** (hub): lists all children; tapping one opens that child's notes.

### Checklists tab (Visitor Log)
- [ ] Visitor Log opens (today's visitors, newest first).
- [ ] **Add a visitor**: name, relation, purpose, arrival → appears with an "on-site" badge.
- [ ] **Record departure** → departure time shows, on-site badge clears.
- [ ] **Edit** a visitor entry → persists.
- [ ] **Delete** a visitor entry → confirmation → removed.

### Bath temperature
- [ ] Open Bath Temp → add a reading.
- [ ] Colour coding: **< 37°C blue, 37–40°C green, > 40°C red**.
- [ ] Recording a temp ticks the **completion bar** for the day.
- [ ] Delete a reading → confirmation → removed.

### Behaviour
- [ ] Add an incident: antecedent / behaviour / consequence (ABC), severity (mild/moderate/severe), date & time.
- [ ] Toggle **physical intervention** and **injury** flags → they show red styling.
- [ ] Edit an incident → persists. Delete → confirmation → removed.

### Sleep diary
- [ ] Add an entry: bed / settled / wake times, number of wakings, quality (poor/fair/good).
- [ ] Edit → persists. Delete → confirmation → removed.

### Food diary
- [ ] Add an entry: meal type **auto-selected from time of day**, appetite, description, concerns.
- [ ] Edit → persists. Delete → confirmation → removed.

### Activities
- [ ] Add an activity: category, title, optional duration.
- [ ] Toggle **reward earned** (⭐) and add an **achievement** (🏆 badge on card).
- [ ] Edit → persists. Delete → confirmation → removed.
- [ ] **(Cross-role)** Tell Tester 5 to confirm this shows in the Parent feed.

### Smart Steps
- [ ] Add a step: category, title, description, target date.
- [ ] Steps are grouped: In Progress / Not Started / Achieved.
- [ ] Open a step → add a **progress note**.
- [ ] A progress note with outcome "achieved" **auto-marks the step as Achieved**.

### Medication (MAR)
- [ ] Add a **prescribed medication** (scheduled): name, dose, route, frequency.
- [ ] Record an **administration**: outcome administered / refused / held → outcome-coloured.
- [ ] Recording all scheduled meds ticks the **completion bar**.
- [ ] Add a **PRN (as-needed)** med and record it.
- [ ] Edit a prescribed med → persists. Delete → confirmation → removed.

### Medical history
- [ ] Open Medical History → edit the profile: NHS number, blood type, conditions, **allergies**.
- [ ] Allergies show in a **prominent red banner**.
- [ ] Add a **healthcare contact** (try several of the 8 types).
- [ ] **Tap a phone number** → it copies.
- [ ] Edit / delete a contact → works.

### Care plans
- [ ] Add a care plan: title, status, review date.
- [ ] Open the plan → add **goals** (try several of the 7 categories), set status, support strategy.
- [ ] Edit a plan / goal → persists. Delete → confirmation → removed.

### Incidents
- [ ] Add an incident report: type (try several of the 6), severity (low/medium/high/critical), title, description, immediate action.
- [ ] Toggle police / parent / manager **notification** flags and **injury** details.
- [ ] Set **follow-up required** → follow-up fields appear.
- [ ] Edit → persists. Delete → confirmation → removed.
- [ ] **(Cross-role)** Log a **high or critical safeguarding** incident, then tell Testers 1 & 3 to confirm it raises a flag on their dashboards.

### Live updates
- [ ] As you add records, the child's **shift progress bar and alerts update** without leaving the screen.

---

## C. TEAM LEADER — full checklist

Tabs expected: **Children · Daily Notes · Checklists · Handover · Settings**

- [ ] **Everything in section B** (Support Worker) — repeat the core CRUD on at least a couple of modules to confirm Team Leader has the same access.
- [ ] **Handover tab** opens to the **oversight queue**.
- [ ] Oversight shows a **per-shift progress bar**.
- [ ] Children are split into **Needs Attention** vs **Fully Documented**.
- [ ] Each card lists the **missing sections** (or ✓ all complete).
- [ ] Tapping a card **navigates to that child's profile**.
- [ ] **Generate the handover summary** (summarize button) → per-child cards.
- [ ] Cards show **flag chips** (physical intervention / safeguarding / critical / med refusal) for records Tester 2 logged.
- [ ] Cards show section rows: notes, behaviour, incidents, medication, bath temp.
- [ ] **Behaviour pattern dashboard** (chart icon in oversight AppBar) opens: trend chart, breakdowns, period filter (7/14/30 days), child filter.
- [ ] **AI shift summary** (✨ button): with records logged for the current shift and Anthropic credit, a written brief appears; copy-to-clipboard works. (Without credit → a clean "temporarily unavailable" message.)

---

## D. MANAGER — full checklist

Tabs expected: **Children · Dashboard · Handover · Settings**

### MFA (first thing)
- [ ] **First login:** after password, the app shows a secret key → add it to your authenticator app → enter the 6-digit code → enrolment succeeds.
- [ ] **Sign out and back in:** you're asked only for the **6-digit code** now (challenge mode).
- [ ] Entering a **wrong code** is rejected.

### Dashboard & oversight
- [ ] **Manager Dashboard** loads: header stats card.
- [ ] **Priority alert cards** appear for safeguarding / critical / physical intervention / med refusal (from records Testers 2 & 3 logged).
- [ ] **Documentation status** lists children with outstanding docs by name.
- [ ] **Incidents by severity** and **behaviour summary** show.
- [ ] **Behaviour pattern screen** (chart icon): bar chart, shift/severity/child breakdowns, top antecedents, period + child filters.
- [ ] **Handover tab** works (same as Team Leader).
- [ ] Children list + care records are viewable.

### Inspector access (enables Tester 4)
- [ ] Dashboard → **Inspector Access** (fact-check icon).
- [ ] **Grant access:** search the inspector by **email**, pick **scopes** (modules), pick an **expiry date**, save.
- [ ] The grant appears with an **Active** badge.
- [ ] Tell **Tester 4 (Inspector)** to confirm it appears in their portal.
- [ ] **Feedback tab:** after the Inspector leaves feedback, it appears here.
- [ ] **Acknowledge** and **Resolve** a piece of feedback (add resolution notes).
- [ ] **Revoke** the grant → tell Tester 4 to confirm they lose access.

### Parent access (enables Tester 5)
- [ ] Dashboard → **Parent Access** (family icon).
- [ ] **Link a parent:** search the parent by **email**, pick the **child**, set the **photo-access toggle**, save.
- [ ] The link appears with an **Active** badge and the photo-permission chip.
- [ ] Tell **Tester 5 (Parent)** to confirm the child appears in their portal.
- [ ] **Revoke** the link → tell Tester 5 to confirm they lose access.

---

## E. INSPECTOR — full checklist (Tester 4)

Tabs expected: **Inspector portal · Settings** (no Children tab)

- [ ] **MFA enrolment + login** (same flow as Manager above).
- [ ] **Before a grant exists:** portal shows the empty "no active access" state.
- [ ] **After Manager grants access:** the home appears as a card with **scope chips** and an **expiry label**.
- [ ] Open the home → **children list** + **module sections** (only the granted scopes).
- [ ] Open each granted module and confirm records are **readable**: Daily Notes, Care Plans, Incidents, Behaviour, Medication, Medical History.
- [ ] Records are **read-only** — there is no edit/delete/add.
- [ ] **Leave feedback:** pick a module, optionally a child, choose **compliment / recommendation / requirement**, write content, submit.
- [ ] Tell **Tester 1 (Manager)** to confirm the feedback appears for them.
- [ ] **You cannot reach staff routes** — you only have the portal + settings.
- [ ] **After Manager revokes:** the home disappears from your portal.
- [ ] **(Audit)** Ask Tester 1 to confirm your views + feedback are logged (Supabase `audit_log`, actions `inspector_view` / `inspector_feedback`).

---

## F. PARENT / GUARDIAN — full checklist (Tester 5)

Tabs expected: **My Child · Settings** (no MFA, no clinical data)

- [ ] **Login** with email + password — **no MFA prompt**.
- [ ] **Before a link exists:** portal shows the empty "no children linked" state.
- [ ] **After Manager links a child:** the child appears (with photo only if the Manager enabled it; otherwise an avatar).
- [ ] Open the child → **date-grouped feed** of activities.
- [ ] **Reward** activities show a ⭐; **achievements** show a highlighted 🏆 panel.
- [ ] The feed is **read-only**.
- [ ] **Confirm clinical records are NOT shown** — no daily notes, incidents, behaviour, medication, or medical history anywhere.
- [ ] You **cannot reach any other route** — only the portal + settings.
- [ ] **After Manager revokes:** the child disappears from your portal.

---

## G. CROSS-ROLE INTEGRATION — the reason you're testing together

These need two or more people. Coordinate live.

- [ ] **Sync visibility:** Tester 2 adds a daily note → Testers 1 & 3 see it in oversight/dashboard within a minute (or after pulling to refresh).
- [ ] **Activity → Parent:** Tester 2 logs an **activity with an achievement** → Tester 5 (Parent) sees it in the feed.
- [ ] **Safeguarding flag:** Tester 2 logs a **critical safeguarding incident** → it raises priority alerts on Tester 1's dashboard and a flag chip on Tester 3's handover.
- [ ] **Med refusal flag:** Tester 2 records a medication as **refused** → shows as a flag on the dashboard/handover.
- [ ] **Delete propagation (important):** Tester 2 **deletes a record** → confirm it disappears from Tester 4's Inspector view (for a granted module) and from Tester 5's Parent feed (for an activity). *This is the fix where deletes used to never reach the portals.*
- [ ] **Inspector grant lifecycle:** Manager grants → Inspector sees it → Inspector reads records + leaves feedback → Manager sees & resolves feedback → Manager revokes → Inspector loses access.
- [ ] **Parent link lifecycle:** Manager links → Parent sees child → Parent views feed → Manager revokes → Parent loses access.
- [ ] **Scope enforcement:** Manager grants the Inspector **only some** modules → Inspector sees only those, not the others.
- [ ] **MFA enforcement:** confirm Manager & Inspector cannot reach any data without completing the 6-digit code.
- [ ] **Role isolation:** each tester confirms they **cannot** open another role's screens (e.g. Support Worker can't reach the Dashboard or Inspector portal).

---

## How to report

For each failed box, capture: **role · screen · what you did · expected · actual** (a screenshot helps). Collect them in one place and hand the list back for fixing.
