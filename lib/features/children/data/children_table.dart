import 'package:drift/drift.dart';

@DataClassName('ChildRow')
class ChildrenTable extends Table {
  @override
  String get tableName => 'children';

  TextColumn get id => text()();
  TextColumn get homeId => text().named('home_id')();
  TextColumn get name => text()();
  TextColumn get dateOfBirth => text().named('date_of_birth')(); // YYYY-MM-DD
  TextColumn get room => text()();
  TextColumn get photoUrl => text().named('photo_url').nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  DateTimeColumn get deletedAt => dateTime().named('deleted_at').nullable()();
  TextColumn get createdById => text().named('created_by_id').nullable()();
  TextColumn get updatedById => text().named('updated_by_id').nullable()();
  BoolColumn get isSynced =>
      boolean().named('is_synced').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
