import 'package:drift/drift.dart';

import '../../../core/offline/app_database.dart';
import 'healthcare_contacts_table.dart';
import 'medical_profile_table.dart';

part 'medical_history_dao.g.dart';

@DriftAccessor(tables: [MedicalProfileTable, HealthcareContactsTable])
class MedicalHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$MedicalHistoryDaoMixin {
  MedicalHistoryDao(super.db);

  // ── Medical profile ────────────────────────────────────────────────────

  /// Stream of the profile for [childId] — emits null if none exists yet.
  Stream<MedicalProfileRow?> watchProfile(String childId) =>
      (select(medicalProfileTable)
            ..where((t) => t.childId.equals(childId)))
          .watchSingleOrNull();

  Future<MedicalProfileRow?> findProfile(String childId) =>
      (select(medicalProfileTable)
            ..where((t) => t.childId.equals(childId)))
          .getSingleOrNull();

  Future<void> upsertProfile(MedicalProfileTableCompanion profile) =>
      into(medicalProfileTable).insertOnConflictUpdate(profile);

  // ── Healthcare contacts ────────────────────────────────────────────────

  Stream<List<HealthcareContactRow>> watchContacts(String childId) =>
      (select(healthcareContactsTable)
            ..where(
              (t) => t.childId.equals(childId) & t.deletedAt.isNull(),
            )
            ..orderBy([(t) => OrderingTerm.asc(t.contactType)]))
          .watch();

  Future<HealthcareContactRow?> findContactById(String id) =>
      (select(healthcareContactsTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<void> upsertContact(HealthcareContactsTableCompanion contact) =>
      into(healthcareContactsTable).insertOnConflictUpdate(contact);

  Future<void> softDeleteContact(String id) =>
      (update(healthcareContactsTable)..where((t) => t.id.equals(id))).write(
        HealthcareContactsTableCompanion(
          deletedAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          isSynced: const Value(false),
        ),
      );
}
