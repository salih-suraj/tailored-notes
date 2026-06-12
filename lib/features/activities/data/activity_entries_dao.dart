import 'package:drift/drift.dart';

import '../../../core/offline/app_database.dart';
import 'activity_entries_table.dart';

part 'activity_entries_dao.g.dart';

@DriftAccessor(tables: [ActivityEntriesTable])
class ActivityEntriesDao extends DatabaseAccessor<AppDatabase>
    with _$ActivityEntriesDaoMixin {
  ActivityEntriesDao(super.db);

  Stream<List<ActivityEntryRow>> watchByChild(String childId) =>
      (select(activityEntriesTable)
            ..where(
              (t) => t.childId.equals(childId) & t.deletedAt.isNull(),
            )
            ..orderBy([
              (t) => OrderingTerm.desc(t.date),
              (t) => OrderingTerm.desc(t.createdAt),
            ]))
          .watch();

  Future<ActivityEntryRow?> findById(String id) =>
      (select(activityEntriesTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<void> upsert(ActivityEntriesTableCompanion entry) =>
      into(activityEntriesTable).insertOnConflictUpdate(entry);

  Future<void> softDelete(String id) =>
      (update(activityEntriesTable)..where((t) => t.id.equals(id))).write(
        ActivityEntriesTableCompanion(
          deletedAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          isSynced: const Value(false),
        ),
      );

  /// One-shot list of rows pending upload, for the sync sweep.
  Future<List<ActivityEntryRow>> getUnsynced() =>
      (select(activityEntriesTable)..where((t) => t.isSynced.equals(false)))
          .get();
}
