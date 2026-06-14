import 'package:drift/drift.dart';

@DataClassName('MedAdministrationRow')
class MedAdministrationsTable extends Table {
  @override
  String get tableName => 'med_administrations';

  TextColumn get id => text()();
  TextColumn get homeId => text().named('home_id')();
  TextColumn get childId => text().named('child_id')();
  TextColumn get prescribedMedId => text().named('prescribed_med_id')();
  TextColumn get medicationName => text().named('medication_name')();
  TextColumn get dose => text()();
  TextColumn get outcome => text()(); // AdminOutcome.name
  TextColumn get shift => text()(); // ShiftType.name
  DateTimeColumn get administeredAt => dateTime().named('administered_at')();
  TextColumn get administeredById => text().named('administered_by_id')();
  TextColumn get administeredByName => text().named('administered_by_name')();
  TextColumn get reason => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get createdById => text().named('created_by_id').nullable()();
  TextColumn get updatedById => text().named('updated_by_id').nullable()();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  BoolColumn get isSynced =>
      boolean().named('is_synced').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
