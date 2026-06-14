import 'package:drift/drift.dart';

import '../../../core/offline/app_database.dart';
import 'med_administrations_table.dart';
import 'prescribed_meds_table.dart';

part 'medication_dao.g.dart';

@DriftAccessor(tables: [PrescribedMedsTable, MedAdministrationsTable])
class MedicationDao extends DatabaseAccessor<AppDatabase>
    with _$MedicationDaoMixin {
  MedicationDao(super.db);

  // ── Prescribed meds ────────────────────────────────────────────────────

  /// All active (non-deleted) meds for [childId], ordered by name.
  Stream<List<PrescribedMedRow>> watchActiveByChild(String childId) =>
      (select(prescribedMedsTable)
            ..where(
              (t) =>
                  t.childId.equals(childId) &
                  t.deletedAt.isNull() &
                  t.isActive.equals(true),
            )
            ..orderBy([(t) => OrderingTerm.asc(t.medicationName)]))
          .watch();

  Future<PrescribedMedRow?> findMedById(String id) => (select(
    prescribedMedsTable,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> upsertMed(PrescribedMedsTableCompanion med) =>
      into(prescribedMedsTable).insertOnConflictUpdate(med);

  Future<void> softDeleteMed(String id) =>
      (update(prescribedMedsTable)..where((t) => t.id.equals(id))).write(
        PrescribedMedsTableCompanion(
          deletedAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          isSynced: const Value(false),
        ),
      );

  /// One-shot list of meds pending upload, for the sync sweep.
  Future<List<PrescribedMedRow>> getUnsyncedMeds() => (select(
    prescribedMedsTable,
  )..where((t) => t.isSynced.equals(false))).get();

  // ── Administrations ────────────────────────────────────────────────────

  /// All administration records for [childId] on a given date window,
  /// newest first.
  Stream<List<MedAdministrationRow>> watchByChildAndDate(
    String childId,
    DateTime startUtc,
    DateTime endUtc,
  ) =>
      (select(medAdministrationsTable)
            ..where(
              (t) =>
                  t.childId.equals(childId) &
                  t.administeredAt.isBetweenValues(startUtc, endUtc),
            )
            ..orderBy([(t) => OrderingTerm.desc(t.administeredAt)]))
          .watch();

  Future<MedAdministrationRow?> findAdminById(String id) => (select(
    medAdministrationsTable,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> upsertAdmin(MedAdministrationsTableCompanion admin) =>
      into(medAdministrationsTable).insertOnConflictUpdate(admin);

  /// One-shot list of administrations pending upload, for the sync sweep.
  Future<List<MedAdministrationRow>> getUnsyncedAdmins() => (select(
    medAdministrationsTable,
  )..where((t) => t.isSynced.equals(false))).get();
}
