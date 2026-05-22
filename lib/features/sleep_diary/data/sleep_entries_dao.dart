import 'package:drift/drift.dart';

import '../../../core/offline/app_database.dart';
import 'sleep_entries_table.dart';

part 'sleep_entries_dao.g.dart';

@DriftAccessor(tables: [SleepEntriesTable])
class SleepEntriesDao extends DatabaseAccessor<AppDatabase>
    with _$SleepEntriesDaoMixin {
  SleepEntriesDao(super.db);

  /// Non-deleted entries for [childId], newest first.
  Stream<List<SleepEntryRow>> watchByChild(String childId) =>
      (select(sleepEntriesTable)
            ..where(
              (t) => t.childId.equals(childId) & t.deletedAt.isNull(),
            )
            ..orderBy([
              (t) => OrderingTerm.desc(t.date),
              (t) => OrderingTerm.desc(t.createdAt),
            ]))
          .watch();

  Future<SleepEntryRow?> findById(String id) =>
      (select(sleepEntriesTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<void> upsert(SleepEntriesTableCompanion entry) =>
      into(sleepEntriesTable).insertOnConflictUpdate(entry);

  Future<void> softDelete(String id) =>
      (update(sleepEntriesTable)..where((t) => t.id.equals(id))).write(
        SleepEntriesTableCompanion(
          deletedAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          isSynced: const Value(false),
        ),
      );
}
