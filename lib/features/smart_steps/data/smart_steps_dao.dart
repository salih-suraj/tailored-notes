import 'package:drift/drift.dart';

import '../../../core/offline/app_database.dart';
import 'smart_steps_table.dart';
import 'step_progress_table.dart';

part 'smart_steps_dao.g.dart';

@DriftAccessor(tables: [SmartStepsTable, StepProgressTable])
class SmartStepsDao extends DatabaseAccessor<AppDatabase>
    with _$SmartStepsDaoMixin {
  SmartStepsDao(super.db);

  // ── Steps ──────────────────────────────────────────────────────────────

  /// Non-deleted steps for [childId], ordered: in_progress first,
  /// then not_started, then achieved.
  Stream<List<SmartStepRow>> watchByChild(String childId) =>
      (select(smartStepsTable)
            ..where(
              (t) => t.childId.equals(childId) & t.deletedAt.isNull(),
            )
            ..orderBy([(t) => OrderingTerm.asc(t.status)]))
          .watch();

  Future<SmartStepRow?> findStepById(String id) =>
      (select(smartStepsTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<void> upsertStep(SmartStepsTableCompanion step) =>
      into(smartStepsTable).insertOnConflictUpdate(step);

  Future<void> softDeleteStep(String id) =>
      (update(smartStepsTable)..where((t) => t.id.equals(id))).write(
        SmartStepsTableCompanion(
          deletedAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          isSynced: const Value(false),
        ),
      );

  /// One-shot list of steps pending upload, for the sync sweep.
  Future<List<SmartStepRow>> getUnsyncedSteps() =>
      (select(smartStepsTable)..where((t) => t.isSynced.equals(false))).get();

  // ── Progress notes ─────────────────────────────────────────────────────

  /// All progress notes for [stepId], newest first.
  Stream<List<StepProgressRow>> watchProgressByStep(String stepId) =>
      (select(stepProgressTable)
            ..where((t) => t.stepId.equals(stepId))
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .watch();

  Future<StepProgressRow?> findProgressById(String id) =>
      (select(stepProgressTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<void> upsertProgress(StepProgressTableCompanion progress) =>
      into(stepProgressTable).insertOnConflictUpdate(progress);

  /// One-shot list of progress notes pending upload, for the sync sweep.
  Future<List<StepProgressRow>> getUnsyncedProgress() =>
      (select(stepProgressTable)..where((t) => t.isSynced.equals(false)))
          .get();

  /// Count of progress notes per step for the given child.
  Future<Map<String, int>> progressCountByChild(String childId) async {
    final rows = await (select(stepProgressTable)
          ..where((t) => t.childId.equals(childId)))
        .get();
    final counts = <String, int>{};
    for (final r in rows) {
      counts[r.stepId] = (counts[r.stepId] ?? 0) + 1;
    }
    return counts;
  }
}
