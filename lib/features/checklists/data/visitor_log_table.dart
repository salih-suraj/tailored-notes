import 'package:drift/drift.dart';

@DataClassName('VisitorLogRow')
class VisitorLogTable extends Table {
  @override
  String get tableName => 'visitor_log';

  TextColumn get id => text()();
  TextColumn get homeId => text().named('home_id')();
  TextColumn get visitorName => text().named('visitor_name')();
  TextColumn get relation => text().nullable()();
  TextColumn get purpose => text()();
  TextColumn get authorisedBy => text().named('authorised_by')();
  DateTimeColumn get arrivedAt => dateTime().named('arrived_at')();
  DateTimeColumn get departedAt =>
      dateTime().named('departed_at').nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get recordedById => text().named('recorded_by_id')();
  TextColumn get recordedByName => text().named('recorded_by_name')();
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
