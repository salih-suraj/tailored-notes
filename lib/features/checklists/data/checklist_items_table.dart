import 'package:drift/drift.dart';

/// Drift table for cleaning checklist task instances.
/// One row per (home/child, area, task, shift, date) combination.
@DataClassName('ChecklistItemRow')
class ChecklistItemsTable extends Table {
  @override
  String get tableName => 'checklist_items';

  TextColumn get id => text()();
  TextColumn get homeId => text().named('home_id')();
  TextColumn get childId => text().named('child_id').nullable()();
  TextColumn get areaKey => text().named('area_key')();
  TextColumn get areaLabel => text().named('area_label')();
  TextColumn get taskKey => text().named('task_key')();
  TextColumn get taskLabel => text().named('task_label')();
  TextColumn get shift => text()();
  TextColumn get date => text()(); // 'YYYY-MM-DD'
  BoolColumn get isComplete =>
      boolean().named('is_complete').withDefault(const Constant(false))();
  DateTimeColumn get completedAt =>
      dateTime().named('completed_at').nullable()();
  TextColumn get completedByName =>
      text().named('completed_by_name').nullable()();
  TextColumn get createdById => text().named('created_by_id').nullable()();
  TextColumn get updatedById => text().named('updated_by_id').nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  BoolColumn get isSynced =>
      boolean().named('is_synced').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
