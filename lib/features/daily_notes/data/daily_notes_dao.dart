import 'package:drift/drift.dart';

import '../../../core/offline/app_database.dart';
import 'daily_notes_table.dart';

part 'daily_notes_dao.g.dart';

/// All database operations for daily observations.
@DriftAccessor(tables: [DailyNotesTable])
class DailyNotesDao extends DatabaseAccessor<AppDatabase>
    with _$DailyNotesDaoMixin {
  DailyNotesDao(super.db);

  /// Live stream of all non-deleted notes for [childId], newest first.
  Stream<List<DailyNoteRow>> watchByChild(String childId) =>
      (select(dailyNotesTable)
            ..where((t) => t.childId.equals(childId) & t.deletedAt.isNull())
            ..orderBy([(t) => OrderingTerm.desc(t.occurredAt)]))
          .watch();

  /// Insert or replace a note (upsert on primary key).
  Future<void> upsert(DailyNotesTableCompanion note) =>
      into(dailyNotesTable).insertOnConflictUpdate(note);

  /// Soft-delete: sets deleted_at and marks unsynced so the deletion reaches Supabase.
  Future<void> softDelete(String id) =>
      (update(dailyNotesTable)..where((t) => t.id.equals(id))).write(
        DailyNotesTableCompanion(
          deletedAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          isSynced: const Value(false),
        ),
      );

  /// Returns the current row for [id], or null if it doesn't exist.
  Future<DailyNoteRow?> findById(String id) =>
      (select(dailyNotesTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  /// Notes pending upload to Supabase.
  Stream<List<DailyNoteRow>> watchUnsynced() =>
      (select(dailyNotesTable)
            ..where((t) => t.isSynced.equals(false)))
          .watch();

  /// One-shot list of notes pending upload, for the sync sweep.
  Future<List<DailyNoteRow>> getUnsynced() =>
      (select(dailyNotesTable)..where((t) => t.isSynced.equals(false))).get();
}
