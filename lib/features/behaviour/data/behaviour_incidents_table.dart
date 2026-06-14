import 'package:drift/drift.dart';

@DataClassName('BehaviourIncidentRow')
class BehaviourIncidentsTable extends Table {
  @override
  String get tableName => 'behaviour_incidents';

  TextColumn get id => text()();
  TextColumn get homeId => text().named('home_id')();
  TextColumn get childId => text().named('child_id')();
  TextColumn get shift => text()();
  DateTimeColumn get occurredAt => dateTime().named('occurred_at')();
  TextColumn get severity => text()();
  TextColumn get antecedent => text()();
  TextColumn get behaviour => text()();
  TextColumn get consequence => text()();
  IntColumn get durationMinutes =>
      integer().named('duration_minutes').nullable()();
  TextColumn get location => text().nullable()();
  BoolColumn get physicalIntervention => boolean()
      .named('physical_intervention')
      .withDefault(const Constant(false))();
  TextColumn get interventionDetails =>
      text().named('intervention_details').nullable()();
  BoolColumn get injuryOccurred =>
      boolean().named('injury_occurred').withDefault(const Constant(false))();
  TextColumn get injuryDetails => text().named('injury_details').nullable()();
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
