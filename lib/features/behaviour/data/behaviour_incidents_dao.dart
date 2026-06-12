import 'package:drift/drift.dart';

import '../../../core/offline/app_database.dart';
import 'behaviour_incidents_table.dart';

part 'behaviour_incidents_dao.g.dart';

@DriftAccessor(tables: [BehaviourIncidentsTable])
class BehaviourIncidentsDao extends DatabaseAccessor<AppDatabase>
    with _$BehaviourIncidentsDaoMixin {
  BehaviourIncidentsDao(super.db);

  /// Non-deleted incidents for [childId], newest first.
  Stream<List<BehaviourIncidentRow>> watchByChild(String childId) =>
      (select(behaviourIncidentsTable)
            ..where(
              (t) =>
                  t.childId.equals(childId) & t.deletedAt.isNull(),
            )
            ..orderBy([(t) => OrderingTerm.desc(t.occurredAt)]))
          .watch();

  Future<BehaviourIncidentRow?> findById(String id) =>
      (select(behaviourIncidentsTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<void> upsert(BehaviourIncidentsTableCompanion incident) =>
      into(behaviourIncidentsTable).insertOnConflictUpdate(incident);

  Future<void> softDelete(String id) =>
      (update(behaviourIncidentsTable)..where((t) => t.id.equals(id))).write(
        BehaviourIncidentsTableCompanion(
          deletedAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          isSynced: const Value(false),
        ),
      );

  /// One-shot list of rows pending upload, for the sync sweep.
  Future<List<BehaviourIncidentRow>> getUnsynced() =>
      (select(behaviourIncidentsTable)..where((t) => t.isSynced.equals(false)))
          .get();
}
