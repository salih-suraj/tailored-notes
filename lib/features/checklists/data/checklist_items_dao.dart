import 'package:drift/drift.dart';

import '../../../core/offline/app_database.dart';
import 'checklist_items_table.dart';

part 'checklist_items_dao.g.dart';

@DriftAccessor(tables: [ChecklistItemsTable])
class ChecklistItemsDao extends DatabaseAccessor<AppDatabase>
    with _$ChecklistItemsDaoMixin {
  ChecklistItemsDao(super.db);

  /// All task rows for a specific child + shift + date.
  Stream<List<ChecklistItemRow>> watchByChildShiftAndDate(
    String childId,
    String shift,
    String date,
  ) =>
      (select(checklistItemsTable)..where(
            (t) =>
                t.childId.equals(childId) &
                t.shift.equals(shift) &
                t.date.equals(date),
          ))
          .watch();

  /// All communal (no child) task rows for a home + shift + date.
  Stream<List<ChecklistItemRow>> watchCommunalByShiftAndDate(
    String homeId,
    String shift,
    String date,
  ) =>
      (select(checklistItemsTable)..where(
            (t) =>
                t.homeId.equals(homeId) &
                t.childId.isNull() &
                t.shift.equals(shift) &
                t.date.equals(date),
          ))
          .watch();

  Future<ChecklistItemRow?> findById(String id) => (select(
    checklistItemsTable,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> upsert(ChecklistItemsTableCompanion item) =>
      into(checklistItemsTable).insertOnConflictUpdate(item);

  /// One-shot list of rows pending upload, for the sync sweep.
  Future<List<ChecklistItemRow>> getUnsynced() => (select(
    checklistItemsTable,
  )..where((t) => t.isSynced.equals(false))).get();
}
