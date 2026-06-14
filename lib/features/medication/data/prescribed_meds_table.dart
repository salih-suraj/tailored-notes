import 'package:drift/drift.dart';

@DataClassName('PrescribedMedRow')
class PrescribedMedsTable extends Table {
  @override
  String get tableName => 'prescribed_medications';

  TextColumn get id => text()();
  TextColumn get homeId => text().named('home_id')();
  TextColumn get childId => text().named('child_id')();
  TextColumn get medicationName => text().named('medication_name')();
  TextColumn get dose => text()();
  TextColumn get route => text()(); // MedRoute.name
  TextColumn get frequency => text()(); // MedFrequency.name
  TextColumn get instructions => text().nullable()();
  TextColumn get prescribedBy => text().named('prescribed_by').nullable()();
  TextColumn get startDate => text().named('start_date')(); // 'YYYY-MM-DD'
  TextColumn get endDate => text().named('end_date').nullable()();
  BoolColumn get isActive =>
      boolean().named('is_active').withDefault(const Constant(true))();
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
