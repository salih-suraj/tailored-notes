import 'package:drift/drift.dart';

import '../../../core/offline/app_database.dart';
import 'food_entries_table.dart';

part 'food_entries_dao.g.dart';

@DriftAccessor(tables: [FoodEntriesTable])
class FoodEntriesDao extends DatabaseAccessor<AppDatabase>
    with _$FoodEntriesDaoMixin {
  FoodEntriesDao(super.db);

  Stream<List<FoodEntryRow>> watchByChild(String childId) =>
      (select(foodEntriesTable)
            ..where(
              (t) => t.childId.equals(childId) & t.deletedAt.isNull(),
            )
            ..orderBy([
              (t) => OrderingTerm.desc(t.date),
              (t) => OrderingTerm.desc(t.createdAt),
            ]))
          .watch();

  Future<FoodEntryRow?> findById(String id) =>
      (select(foodEntriesTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<void> upsert(FoodEntriesTableCompanion entry) =>
      into(foodEntriesTable).insertOnConflictUpdate(entry);

  Future<void> softDelete(String id) =>
      (update(foodEntriesTable)..where((t) => t.id.equals(id))).write(
        FoodEntriesTableCompanion(
          deletedAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          isSynced: const Value(false),
        ),
      );

  /// One-shot list of rows pending upload, for the sync sweep.
  Future<List<FoodEntryRow>> getUnsynced() =>
      (select(foodEntriesTable)..where((t) => t.isSynced.equals(false))).get();
}
