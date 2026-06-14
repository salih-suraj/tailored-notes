import 'package:drift/drift.dart';

@DataClassName('IncidentReportRow')
class IncidentReportsTable extends Table {
  @override
  String get tableName => 'incident_reports';

  TextColumn get id => text()();
  TextColumn get homeId => text().named('home_id')();
  TextColumn get childId => text().named('child_id')();
  TextColumn get incidentType => text().named('incident_type')();
  TextColumn get severity => text()();
  TextColumn get title => text()();
  DateTimeColumn get occurredAt => dateTime().named('occurred_at')();
  TextColumn get location => text().nullable()();
  TextColumn get description => text()();
  TextColumn get immediateAction => text().named('immediate_action')();
  TextColumn get injuryDetails => text().named('injury_details').nullable()();
  BoolColumn get policeNotified =>
      boolean().named('police_notified').withDefault(const Constant(false))();
  BoolColumn get parentNotified =>
      boolean().named('parent_notified').withDefault(const Constant(false))();
  BoolColumn get managerNotified =>
      boolean().named('manager_notified').withDefault(const Constant(false))();
  BoolColumn get followUpRequired => boolean()
      .named('follow_up_required')
      .withDefault(const Constant(false))();
  TextColumn get followUpDetails =>
      text().named('follow_up_details').nullable()();
  TextColumn get reportedById => text().named('reported_by_id')();
  TextColumn get reportedByName => text().named('reported_by_name')();
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
