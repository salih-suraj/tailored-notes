import 'package:drift/drift.dart';

import '../../../core/offline/app_database.dart';
import '../../../core/time/uk_time.dart';
import 'bath_temp_records_table.dart';

part 'bath_temp_records_dao.g.dart';

@DriftAccessor(tables: [BathTempRecordsTable])
class BathTempRecordsDao extends DatabaseAccessor<AppDatabase>
    with _$BathTempRecordsDaoMixin {
  BathTempRecordsDao(super.db);

  /// Live stream of non-deleted records for [childId] on [date] ('YYYY-MM-DD'),
  /// newest first.
  Stream<List<BathTempRow>> watchByChildAndDate(
    String childId,
    String date,
  ) =>
      (select(bathTempRecordsTable)
            ..where(
              (t) =>
                  t.childId.equals(childId) &
                  t.deletedAt.isNull() &
                  _onDate(t, date),
            )
            ..orderBy([(t) => OrderingTerm.desc(t.recordedAt)]))
          .watch();

  Future<BathTempRow?> findById(String id) =>
      (select(bathTempRecordsTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<void> upsert(BathTempRecordsTableCompanion entry) =>
      into(bathTempRecordsTable).insertOnConflictUpdate(entry);

  Future<void> softDelete(String id) =>
      (update(bathTempRecordsTable)..where((t) => t.id.equals(id))).write(
        BathTempRecordsTableCompanion(
          deletedAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          isSynced: const Value(false),
        ),
      );

  /// One-shot list of rows pending upload, for the sync sweep.
  Future<List<BathTempRow>> getUnsynced() =>
      (select(bathTempRecordsTable)..where((t) => t.isSynced.equals(false)))
          .get();

  // Matches rows where recorded_at falls on the given London date.
  Expression<bool> _onDate(BathTempRecordsTable t, String date) {
    return t.recordedAt.isBetweenValues(
      UkTime.dayStartUtc(date),
      UkTime.dayEndUtc(date),
    );
  }
}
