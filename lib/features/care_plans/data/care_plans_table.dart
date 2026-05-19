import 'package:drift/drift.dart';

@DataClassName('CarePlanRow')
class CarePlansTable extends Table {
  @override
  String get tableName => 'care_plans';

  TextColumn get id => text()();
  TextColumn get homeId => text().named('home_id')();
  TextColumn get childId => text().named('child_id')();
  TextColumn get title => text()();
  TextColumn get status => text()(); // CarePlanStatus.name
  TextColumn get reviewDate => text().named('review_date').nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get authorId => text().named('author_id')();
  TextColumn get authorName => text().named('author_name')();
  TextColumn get approvedById =>
      text().named('approved_by_id').nullable()();
  TextColumn get approvedByName =>
      text().named('approved_by_name').nullable()();
  DateTimeColumn get approvedAt =>
      dateTime().named('approved_at').nullable()();
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
