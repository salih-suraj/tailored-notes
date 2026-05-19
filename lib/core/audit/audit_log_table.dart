import 'package:drift/drift.dart';

/// Append-only log of every insert, update, and soft-delete in the app.
/// Required for safeguarding compliance and regulatory inspection.
@DataClassName('AuditLogRow')
class AuditLogTable extends Table {
  @override
  String get tableName => 'audit_log';

  TextColumn get id => text()();
  TextColumn get userId => text().named('user_id')();
  TextColumn get userDisplayName => text().named('user_display_name')();
  TextColumn get homeId => text().named('home_id')();

  /// 'insert', 'update', or 'delete'
  TextColumn get action => text()();

  /// The Drift table name the mutation affected (e.g. 'daily_notes')
  TextColumn get entityTable => text().named('entity_table')();

  TextColumn get recordId => text().named('record_id')();

  /// JSON snapshot of the record before the change (null for inserts)
  TextColumn get before => text().nullable()();

  /// JSON snapshot of the record after the change (null for deletes)
  TextColumn get after => text().nullable()();

  DateTimeColumn get timestamp => dateTime()();
  BoolColumn get isSynced =>
      boolean().named('is_synced').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
