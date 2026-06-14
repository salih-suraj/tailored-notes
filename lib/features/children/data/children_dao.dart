import 'package:drift/drift.dart';

import '../../../core/offline/app_database.dart';
import 'children_table.dart';

part 'children_dao.g.dart';

@DriftAccessor(tables: [ChildrenTable])
class ChildrenDao extends DatabaseAccessor<AppDatabase>
    with _$ChildrenDaoMixin {
  ChildrenDao(super.db);

  Stream<List<ChildRow>> watchByHome(String homeId) =>
      (select(childrenTable)
            ..where((t) => t.homeId.equals(homeId) & t.deletedAt.isNull())
            ..orderBy([(t) => OrderingTerm.asc(t.name)]))
          .watch();

  Future<ChildRow?> findById(String id) =>
      (select(childrenTable)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> upsert(ChildrenTableCompanion child) =>
      into(childrenTable).insertOnConflictUpdate(child);

  Future<void> softDelete(String id) =>
      (update(childrenTable)..where((t) => t.id.equals(id))).write(
        ChildrenTableCompanion(
          deletedAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          isSynced: const Value(false),
        ),
      );

  /// One-shot list of rows pending upload, for the sync sweep.
  Future<List<ChildRow>> getUnsynced() =>
      (select(childrenTable)..where((t) => t.isSynced.equals(false))).get();
}
