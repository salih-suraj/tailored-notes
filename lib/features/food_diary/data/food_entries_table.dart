import 'package:drift/drift.dart';

@DataClassName('FoodEntryRow')
class FoodEntriesTable extends Table {
  @override
  String get tableName => 'food_entries';

  TextColumn get id => text()();
  TextColumn get homeId => text().named('home_id')();
  TextColumn get childId => text().named('child_id')();
  TextColumn get date => text()(); // 'YYYY-MM-DD'
  TextColumn get shift => text()();
  TextColumn get mealType => text().named('meal_type')();
  TextColumn get description => text()();
  TextColumn get appetite => text()();
  TextColumn get concerns => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get recordedById => text().named('recorded_by_id')();
  TextColumn get recordedByName => text().named('recorded_by_name')();
  TextColumn get createdById => text().named('created_by_id').nullable()();
  TextColumn get updatedById => text().named('updated_by_id').nullable()();
  DateTimeColumn get deletedAt => dateTime().named('deleted_at').nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  BoolColumn get isSynced =>
      boolean().named('is_synced').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
