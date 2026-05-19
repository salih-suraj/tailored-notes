import 'package:drift/drift.dart';

@DataClassName('MedicalProfileRow')
class MedicalProfileTable extends Table {
  @override
  String get tableName => 'medical_profiles';

  TextColumn get id => text()();
  TextColumn get homeId => text().named('home_id')();
  TextColumn get childId => text().named('child_id')();
  TextColumn get nhsNumber => text().named('nhs_number').nullable()();
  TextColumn get bloodType => text().named('blood_type').nullable()();
  TextColumn get conditions => text().nullable()();
  TextColumn get allergies => text().nullable()();
  TextColumn get immunisationNotes =>
      text().named('immunisation_notes').nullable()();
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
