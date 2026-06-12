import 'package:drift/drift.dart';

import '../offline/app_database.dart';
import 'audit_log_table.dart';

part 'audit_log_dao.g.dart';

@DriftAccessor(tables: [AuditLogTable])
class AuditLogDao extends DatabaseAccessor<AppDatabase>
    with _$AuditLogDaoMixin {
  AuditLogDao(super.db);

  Future<void> insert(AuditLogTableCompanion entry) =>
      into(auditLogTable).insert(entry);

  /// All unsynced entries, oldest first.
  Stream<List<AuditLogRow>> watchUnsynced() =>
      (select(auditLogTable)
            ..where((t) => t.isSynced.equals(false))
            ..orderBy([(t) => OrderingTerm.asc(t.timestamp)]))
          .watch();

  Future<void> markSynced(String id) =>
      (update(auditLogTable)..where((t) => t.id.equals(id))).write(
        const AuditLogTableCompanion(isSynced: Value(true)),
      );

  /// One-shot list of unsynced entries (oldest first), for the sync sweep.
  Future<List<AuditLogRow>> getUnsynced() =>
      (select(auditLogTable)
            ..where((t) => t.isSynced.equals(false))
            ..orderBy([(t) => OrderingTerm.asc(t.timestamp)]))
          .get();
}
