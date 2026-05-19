import 'package:drift/drift.dart';

/// Drift table definition for daily observations.
/// Column names use snake_case to match Supabase.
@DataClassName('DailyNoteRow')
class DailyNotesTable extends Table {
  @override
  String get tableName => 'daily_notes';

  TextColumn get id => text()();
  TextColumn get homeId => text().named('home_id')();
  TextColumn get childId => text().named('child_id')();
  TextColumn get authorId => text().named('author_id')();
  TextColumn get authorName => text().named('author_name')();
  TextColumn get shift => text()(); // stored as ShiftType.name string
  TextColumn get content => text()();
  DateTimeColumn get occurredAt => dateTime().named('occurred_at')();
  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  DateTimeColumn get deletedAt => dateTime().named('deleted_at').nullable()();
  TextColumn get updatedById => text().named('updated_by_id').nullable()();
  TextColumn get updatedByName => text().named('updated_by_name').nullable()();
  BoolColumn get isSynced =>
      boolean().named('is_synced').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
