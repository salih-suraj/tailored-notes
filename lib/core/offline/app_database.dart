import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
import '../../features/medical_history/data/healthcare_contacts_table.dart';
import '../../features/medical_history/data/medical_history_dao.dart';
import '../../features/medical_history/data/medical_profile_table.dart';
import '../../features/medication/data/med_administrations_table.dart';
import '../../features/medication/data/medication_dao.dart';
import '../../features/medication/data/prescribed_meds_table.dart';
import '../audit/audit_log_dao.dart';
import '../audit/audit_log_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    DailyNotesTable,
    ChecklistItemsTable,
    AuditLogTable,
    BathTempRecordsTable,
    VisitorLogTable,
    CarePlansTable,
    CarePlanGoalsTable,
    PrescribedMedsTable,
    MedAdministrationsTable,
    MedicalProfileTable,
    HealthcareContactsTable,
  ],
  daos: [
    DailyNotesDao,
    ChecklistItemsDao,
    AuditLogDao,
    BathTempRecordsDao,
    VisitorLogDao,
    CarePlansDao,
    MedicationDao,
    MedicalHistoryDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 8;

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
