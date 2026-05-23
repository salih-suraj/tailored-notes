import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/activities/data/activity_entries_dao.dart';
import '../../features/activities/data/activity_entries_table.dart';
import '../../features/incidents/data/incident_reports_dao.dart';
import '../../features/incidents/data/incident_reports_table.dart';
import '../../features/behaviour/data/behaviour_incidents_dao.dart';
import '../../features/behaviour/data/behaviour_incidents_table.dart';
import '../../features/care_plans/data/care_plan_goals_table.dart';
import '../../features/care_plans/data/care_plans_dao.dart';
import '../../features/care_plans/data/care_plans_table.dart';
import '../../features/checklists/data/bath_temp_records_dao.dart';
import '../../features/checklists/data/bath_temp_records_table.dart';
import '../../features/checklists/data/checklist_items_dao.dart';
import '../../features/checklists/data/checklist_items_table.dart';
import '../../features/checklists/data/visitor_log_dao.dart';
import '../../features/checklists/data/visitor_log_table.dart';
import '../../features/daily_notes/data/daily_notes_dao.dart';
import '../../features/daily_notes/data/daily_notes_table.dart';
import '../../features/food_diary/data/food_entries_dao.dart';
import '../../features/food_diary/data/food_entries_table.dart';
import '../../features/medical_history/data/healthcare_contacts_table.dart';
import '../../features/medical_history/data/medical_history_dao.dart';
import '../../features/medical_history/data/medical_profile_table.dart';
import '../../features/medication/data/med_administrations_table.dart';
import '../../features/medication/data/medication_dao.dart';
import '../../features/medication/data/prescribed_meds_table.dart';
import '../../features/sleep_diary/data/sleep_entries_dao.dart';
import '../../features/sleep_diary/data/sleep_entries_table.dart';
import '../../features/smart_steps/data/smart_steps_dao.dart';
import '../../features/smart_steps/data/smart_steps_table.dart';
import '../../features/smart_steps/data/step_progress_table.dart';
import '../audit/audit_log_dao.dart';
import '../audit/audit_log_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    DailyNotesTable, ChecklistItemsTable, AuditLogTable,
    BathTempRecordsTable, VisitorLogTable,
    CarePlansTable, CarePlanGoalsTable,
    PrescribedMedsTable, MedAdministrationsTable,
    MedicalProfileTable, HealthcareContactsTable,
    BehaviourIncidentsTable, SleepEntriesTable,
    FoodEntriesTable, ActivityEntriesTable,
    SmartStepsTable, StepProgressTable,
    IncidentReportsTable,
  ],
  daos: [
    DailyNotesDao, ChecklistItemsDao, AuditLogDao,
    BathTempRecordsDao, VisitorLogDao, CarePlansDao,
    MedicationDao, MedicalHistoryDao, BehaviourIncidentsDao,
    SleepEntriesDao, FoodEntriesDao, ActivityEntriesDao,
    SmartStepsDao, IncidentReportsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 14;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from < 2) await m.createTable(checklistItemsTable);
          if (from < 3) {
            await m.createTable(auditLogTable);
            await m.addColumn(dailyNotesTable, dailyNotesTable.updatedById);
            await m.addColumn(dailyNotesTable, dailyNotesTable.updatedByName);
            if (from >= 2) {
              await m.addColumn(
                  checklistItemsTable, checklistItemsTable.createdById);
              await m.addColumn(
                  checklistItemsTable, checklistItemsTable.updatedById);
            }
          }
          if (from < 4) await m.createTable(bathTempRecordsTable);
          if (from < 5) await m.createTable(visitorLogTable);
          if (from < 6) {
            await m.createTable(carePlansTable);
            await m.createTable(carePlanGoalsTable);
          }
          if (from < 7) {
            await m.createTable(prescribedMedsTable);
            await m.createTable(medAdministrationsTable);
          }
          if (from < 8) {
            await m.createTable(medicalProfileTable);
            await m.createTable(healthcareContactsTable);
          }
          if (from < 9) await m.createTable(behaviourIncidentsTable);
          if (from < 10) await m.createTable(sleepEntriesTable);
          if (from < 11) await m.createTable(foodEntriesTable);
          if (from < 12) await m.createTable(activityEntriesTable);
          if (from < 13) {
            await m.createTable(smartStepsTable);
            await m.createTable(stepProgressTable);
          }
          if (from < 14) await m.createTable(incidentReportsTable);
        },
      );

  static QueryExecutor _openConnection() =>
      driftDatabase(name: 'tailored_notes_db');
}

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}
