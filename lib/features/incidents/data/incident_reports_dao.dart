import 'package:drift/drift.dart';

import '../../../core/offline/app_database.dart';
import 'incident_reports_table.dart';

part 'incident_reports_dao.g.dart';

@DriftAccessor(tables: [IncidentReportsTable])
class IncidentReportsDao extends DatabaseAccessor<AppDatabase>
    with _$IncidentReportsDaoMixin {
  IncidentReportsDao(super.db);

  Stream<List<IncidentReportRow>> watchByChild(String childId) =>
      (select(incidentReportsTable)
            ..where(
              (t) => t.childId.equals(childId) & t.deletedAt.isNull(),
            )
            ..orderBy([(t) => OrderingTerm.desc(t.occurredAt)]))
          .watch();

  Future<IncidentReportRow?> findById(String id) =>
      (select(incidentReportsTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<void> upsert(IncidentReportsTableCompanion report) =>
      into(incidentReportsTable).insertOnConflictUpdate(report);

  Future<void> softDelete(String id) =>
      (update(incidentReportsTable)..where((t) => t.id.equals(id))).write(
        IncidentReportsTableCompanion(
          deletedAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          isSynced: const Value(false),
        ),
      );

  /// One-shot list of rows pending upload, for the sync sweep.
  Future<List<IncidentReportRow>> getUnsynced() =>
      (select(incidentReportsTable)..where((t) => t.isSynced.equals(false)))
          .get();
}
