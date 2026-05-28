# Supabase Setup Prompt

Copy everything below this line and paste it into a new Claude conversation.

---

I am building TailorEd Notes — a Flutter digital care documentation platform for UK residential 
children's homes. The Flutter app is fully built and offline-first (using Drift locally). I now 
need to set up Supabase as the cloud backend. Walk me through every step, generating all SQL 
and configuration as we go.

---

## What the app does

Records safeguarding data for vulnerable children (daily notes, medication, behaviour incidents, 
incident reports, care plans, etc.). Children's data is UK GDPR special category. This is 
production-critical — not a hobby project.

---

## Fixed requirements (non-negotiable)

- Supabase project must be in EU region: eu-west-2 (London) or eu-central-1 (Frankfurt)
- Row Level Security on every table — users can only read/write their own home's data
- Audit trail on every mutation (audit_log table)
- Auth: email/password. MFA (TOTP) required for Manager and Inspector roles
- Flutter credentials via --dart-define (not .env): SUPABASE_URL and SUPABASE_ANON_KEY
- No data leaves the EU

---

## User roles (enforced via RLS + JWT custom claims)

| Role           | What they can do                                              |
|----------------|---------------------------------------------------------------|
| support_worker | Create/edit records they authored, within their home         |
| team_leader    | Read all records for their home, approve care plans          |
| manager        | Full read/write for their home(s), access audit log          |
| inspector      | Time-limited read of authorised sections (inspector_grants)  |
| parent_guardian| Read-only view of their child's curated records              |

Each user's JWT must carry two custom claims: `home_id` (uuid) and `role` (text).

---

## Database schema — 19 tables to create

Match these column names exactly (the Flutter Drift tables use these snake_case names).
All text primary keys store UUIDs as text. All timestamps are UTC.

### children
```sql
id text PK, home_id text, name text, date_of_birth text,
room text, photo_url text nullable, notes text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
created_by_id text nullable, updated_by_id text nullable, is_synced boolean default false
```

### daily_notes
```sql
id text PK, home_id text, child_id text, author_id text, author_name text,
shift text, content text, occurred_at timestamptz,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
updated_by_id text nullable, updated_by_name text nullable, is_synced boolean default false
```

### checklist_items
```sql
id text PK, home_id text, child_id text nullable, checklist_type text,
label text, is_completed boolean default false, completed_at timestamptz nullable,
completed_by_id text nullable, completed_by_name text nullable, shift text nullable,
date text nullable, sort_order integer default 0, notes text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
created_by_id text nullable, updated_by_id text nullable, is_synced boolean default false
```

### bath_temp_records
```sql
id text PK, home_id text, child_id text,
temperature_celsius real, shift text, recorded_at timestamptz,
recorded_by_id text, recorded_by_name text,
created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
is_synced boolean default false
```

### visitor_log
```sql
id text PK, home_id text, visitor_name text, relation text nullable, purpose text,
authorised_by text nullable, badge_number text nullable, notes text nullable,
arrived_at timestamptz, departed_at timestamptz nullable, is_on_site boolean default true,
recorded_by_id text, recorded_by_name text,
created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
is_synced boolean default false
```

### care_plans
```sql
id text PK, home_id text, child_id text, title text, status text,
review_date text nullable, notes text nullable,
author_id text, author_name text,
approved_by_id text nullable, approved_by_name text nullable, approved_at timestamptz nullable,
created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
is_synced boolean default false
```

### care_plan_goals
```sql
id text PK, care_plan_id text, home_id text, child_id text,
category text, title text, description text nullable, strategy text nullable,
target_date text nullable, status text, progress_notes text nullable,
sort_order integer default 0,
created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
is_synced boolean default false
```

### prescribed_meds
```sql
id text PK, home_id text, child_id text, medication_name text, dose text,
route text, frequency text, instructions text nullable, prescribed_by text nullable,
start_date text, end_date text nullable, is_active boolean default true,
created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
is_synced boolean default false
```

### med_administrations
```sql
id text PK, home_id text, child_id text, prescribed_med_id text,
medication_name text, dose text, outcome text, shift text,
administered_at timestamptz, administered_by_id text, administered_by_name text,
reason text nullable, notes text nullable,
created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, is_synced boolean default false
```

### medical_profile
```sql
id text PK, home_id text, child_id text UNIQUE,
allergies text nullable, medical_conditions text nullable,
current_medications_summary text nullable, dietary_requirements text nullable,
mobility_notes text nullable, communication_notes text nullable,
additional_notes text nullable,
created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
is_synced boolean default false
```

### healthcare_contacts
```sql
id text PK, home_id text, child_id text, contact_type text,
name text, organisation text nullable, phone text nullable, email text nullable,
notes text nullable, sort_order integer default 0,
created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
is_synced boolean default false
```

### behaviour_incidents
```sql
id text PK, home_id text, child_id text, shift text, occurred_at timestamptz,
severity text, antecedent text, behaviour text, consequence text,
duration_minutes integer nullable, location text nullable,
physical_intervention boolean default false, intervention_details text nullable,
injury_occurred boolean default false, injury_details text nullable, notes text nullable,
recorded_by_id text, recorded_by_name text,
created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
is_synced boolean default false
```

### sleep_entries
```sql
id text PK, home_id text, child_id text, date text, shift text,
bed_time text nullable, settled_time text nullable, wake_time text nullable,
wakings_count integer default 0, quality text nullable, notes text nullable,
recorded_by_id text, recorded_by_name text,
created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
is_synced boolean default false
```

### food_entries
```sql
id text PK, home_id text, child_id text, date text, shift text,
meal_type text, appetite text nullable, description text nullable, concerns text nullable,
recorded_by_id text, recorded_by_name text,
created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
is_synced boolean default false
```

### activity_entries
```sql
id text PK, home_id text, child_id text, date text, shift text,
category text, title text, description text nullable,
duration_minutes integer nullable, reward_earned boolean default false,
achievement text nullable, recorded_by_id text, recorded_by_name text,
created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
is_synced boolean default false
```

### smart_steps
```sql
id text PK, home_id text, child_id text, title text, category text,
description text nullable, status text, target_date text nullable,
achieved_at timestamptz nullable, created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
is_synced boolean default false
```

### step_progress
```sql
id text PK, home_id text, child_id text, step_id text,
date text, shift text, outcome text, notes text nullable,
recorded_by_id text, recorded_by_name text,
created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
is_synced boolean default false
```

### incident_reports
```sql
id text PK, home_id text, child_id text, incident_type text, severity text,
title text, occurred_at timestamptz, location text nullable,
description text, immediate_action text, injury_details text nullable,
police_notified boolean default false, parent_notified boolean default false,
manager_notified boolean default false, follow_up_required boolean default false,
follow_up_details text nullable, reported_by_id text, reported_by_name text,
created_by_id text nullable, updated_by_id text nullable,
created_at timestamptz, updated_at timestamptz, deleted_at timestamptz nullable,
is_synced boolean default false
```

### audit_log
```sql
id text PK, home_id text, user_id text, action text,
table_name text, record_id text, before_json text nullable, after_json text nullable,
timestamp timestamptz
```

### inspector_grants (cloud only — not in local Drift)
```sql
id uuid PK default gen_random_uuid(),
inspector_user_id uuid references auth.users,
home_id text, granted_by uuid references auth.users,
expires_at timestamptz, scope text[],
created_at timestamptz default now()
```

---

## What I need you to walk me through, step by step

1. **Create the Supabase project** — which region to pick, what to name it, what to note down

2. **Configure Authentication** — disable unnecessary providers, configure email/password,
   set up TOTP MFA, explain how to enforce MFA for specific roles (Manager + Inspector)

3. **Custom JWT claims** — every user needs `home_id` and `role` in their JWT. Show me
   exactly how to set this up using a Postgres function + Auth hook (or the Supabase
   custom claims approach — whichever is production-correct in 2025)

4. **Create all 19 tables** — generate the complete SQL for all tables above.
   Use `text` for UUIDs (to match the Flutter Drift tables which store UUIDs as text).
   Use `timestamptz` for all timestamps.

5. **Row Level Security** — enable RLS on every table and write policies for each role.
   The RLS must read `home_id` and `role` from the JWT claims. Pattern:
   - SELECT: users can read records where home_id matches their JWT home_id,
     plus role-gating (e.g. inspectors only see granted scopes)
   - INSERT: own home only, created_by_id = auth.uid()
   - UPDATE: own home only, role-gated (managers can update anything,
     support workers only their own records)
   - DELETE: manager only (but all deletes should be soft — set deleted_at, not hard delete)

6. **Audit log** — show me how to write a Postgres trigger that fires on INSERT/UPDATE/DELETE
   on all care-record tables and writes to audit_log automatically
   (so even if the app forgets, the DB captures it)

7. **Storage bucket** — create a private bucket for child photos.
   EU region, access-controlled per home.

8. **Wire up Flutter** — give me the exact `flutter run` command with
   `--dart-define=SUPABASE_URL=xxx --dart-define=SUPABASE_ANON_KEY=xxx`
   filled in with my actual values. The app already reads these via
   `const String.fromEnvironment('SUPABASE_URL')`.

9. **Test the connection** — how to verify auth works, that RLS is blocking
   what it should block, and that data is syncing from the device.

---

Walk me through one section at a time. Don't dump everything at once —
do step 1, confirm I've done it, then proceed to step 2, and so on.
If you need to generate SQL, generate it as a complete runnable block
I can paste into the Supabase SQL editor. Ask me for my actual values
(URL, keys, user IDs) when you need them.

This is a safeguarding app for vulnerable children — get the security right.
