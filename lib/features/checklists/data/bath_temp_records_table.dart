import 'package:drift/drift.dart';

@DataClassName('BathTempRow')
class BathTempRecordsTable extends Table {
  @override
  String get tableName => 'bath_temp_records';

  TextColumn get id => text()();
  TextColumn get homeId => text().named('home_id')();
  TextColumn get childId => text().named('child_id')();
  RealColumn get temperatureCelsius =>
      real().named('temperature_celsius')();
  TextColumn get shift => text()();
  DateTimeColumn get recordedAt => dateTime().named('recorded_at')();
  TextColumn get recordedById => text().named('recorded_by_id')();
  TextColumn get recordedByName => text().named('recorded_by_name')();
  TextColumn get notes => text().nullable()();
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
