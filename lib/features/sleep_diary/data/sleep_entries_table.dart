import 'package:drift/drift.dart';

@DataClassName('SleepEntryRow')
class SleepEntriesTable extends Table {
  @override
  String get tableName => 'sleep_entries';

  TextColumn get id => text()();
  TextColumn get homeId => text().named('home_id')();
  TextColumn get childId => text().named('child_id')();
  TextColumn get date => text()(); // 'YYYY-MM-DD'
  TextColumn get shift => text()();
  TextColumn get bedTime => text().named('bed_time').nullable()();
  TextColumn get settledTime => text().named('settled_time').nullable()();
  TextColumn get wakeTime => text().named('wake_time').nullable()();
  IntColumn get numberOfWakings =>
      integer().named('number_of_wakings').withDefault(const Constant(0))();
  TextColumn get quality => text()();
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
