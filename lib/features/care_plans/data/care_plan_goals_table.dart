import 'package:drift/drift.dart';

@DataClassName('CarePlanGoalRow')
class CarePlanGoalsTable extends Table {
  @override
  String get tableName => 'care_plan_goals';

  TextColumn get id => text()();
  TextColumn get carePlanId => text().named('care_plan_id')();
  TextColumn get homeId => text().named('home_id')();
  TextColumn get childId => text().named('child_id')();
  TextColumn get category => text()(); // GoalCategory.name
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get strategy => text().nullable()();
  TextColumn get targetDate => text().named('target_date').nullable()();
  TextColumn get status => text()(); // GoalStatus.name
  TextColumn get progressNotes =>
      text().named('progress_notes').nullable()();
  IntColumn get sortOrder =>
      integer().named('sort_order').withDefault(const Constant(0))();
  TextColumn get createdById => text().named('created_by_id').nullable()();
  TextColumn get updatedById => text().named('updated_by_id').nullable()();
  DateTimeColumn get deletedAt =>
      dateTime().named('deleted_at').nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  BoolColumn get isSynced =>
      boolean().named('is_synced').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
