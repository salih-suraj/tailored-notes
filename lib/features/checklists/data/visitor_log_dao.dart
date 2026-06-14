import 'package:drift/drift.dart';

import '../../../core/offline/app_database.dart';
import 'visitor_log_table.dart';

part 'visitor_log_dao.g.dart';

@DriftAccessor(tables: [VisitorLogTable])
class VisitorLogDao extends DatabaseAccessor<AppDatabase>
    with _$VisitorLogDaoMixin {
  VisitorLogDao(super.db);

  /// Non-deleted entries for [homeId] where arrived_at falls on [date],
  /// newest first.
  Stream<List<VisitorLogRow>> watchByHomeAndDate(
    String homeId,
    DateTime startOfDay,
    DateTime endOfDay,
  ) =>
      (select(visitorLogTable)
            ..where(
              (t) =>
                  t.homeId.equals(homeId) &
                  t.deletedAt.isNull() &
                  t.arrivedAt.isBetweenValues(startOfDay, endOfDay),
            )
            ..orderBy([(t) => OrderingTerm.desc(t.arrivedAt)]))
          .watch();

  Future<VisitorLogRow?> findById(String id) => (select(
    visitorLogTable,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> upsert(VisitorLogTableCompanion entry) =>
      into(visitorLogTable).insertOnConflictUpdate(entry);

  Future<void> softDelete(String id) =>
      (update(visitorLogTable)..where((t) => t.id.equals(id))).write(
        VisitorLogTableCompanion(
          deletedAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          isSynced: const Value(false),
        ),
      );

  /// One-shot list of rows pending upload, for the sync sweep.
  Future<List<VisitorLogRow>> getUnsynced() =>
      (select(visitorLogTable)..where((t) => t.isSynced.equals(false))).get();
}
