import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/audit/audit_log_writer.dart';
import '../../../core/offline/app_database.dart';
import '../../../features/auth/domain/app_user.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../core/offline/sync_service.dart';
import '../../../core/time/uk_time.dart';
import '../domain/smart_step.dart';
import '../domain/step_progress.dart';
import 'smart_steps_dao.dart';

class SmartStepsRepository implements SyncTarget {
  SmartStepsRepository({
    required SmartStepsDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
    required AuditLogWriter auditWriter,
  }) : _dao = dao,
       _supabaseClient = supabaseClient,
       _currentUser = currentUser,
       _audit = auditWriter;

  final SmartStepsDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;
  final AuditLogWriter _audit;

  // ── Steps ─────────────────────────────────────────────────────────────

  Stream<List<SmartStep>> watchByChild(String childId) => _dao
      .watchByChild(childId)
      .map((rows) => rows.map(_stepToDomain).toList());

  Future<void> saveStep(SmartStep step) async {
    final existing = await _dao.findStepById(step.id);
    final isNew = existing == null;
    final withUser = step.copyWith(
      createdById: isNew ? _currentUser?.id : step.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsertStep(_stepToCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'smart_steps',
      recordId: step.id,
      before: isNew ? null : _stepToDomain(existing).toJson(),
      after: withUser.toJson(),
    );
    _trySyncStep(withUser);
  }

  Future<void> deleteStep(String id) async {
    final existing = await _dao.findStepById(id);
    await _dao.softDeleteStep(id);
    await _audit.record(
      action: 'delete',
      table: 'smart_steps',
      recordId: id,
      before: existing != null ? _stepToDomain(existing).toJson() : null,
    );

    final deleted = await _dao.findStepById(id);
    if (deleted != null) _trySyncStep(_stepToDomain(deleted));
  }

  @override
  String get syncLabel => 'smart_steps';

  @override
  Future<void> syncPending() async {
    if (_supabaseClient == null) return;
    for (final row in await _dao.getUnsyncedSteps()) {
      final step = _stepToDomain(row);
      if (!SyncService.isCloudSyncable(step.homeId)) continue;
      await _trySyncStep(step);
    }
    for (final row in await _dao.getUnsyncedProgress()) {
      final progress = _progressToDomain(row);
      if (!SyncService.isCloudSyncable(progress.homeId)) continue;
      await _trySyncProgress(progress);
    }
  }

  // ── Progress notes ────────────────────────────────────────────────────

  Stream<List<StepProgress>> watchProgress(String stepId) => _dao
      .watchProgressByStep(stepId)
      .map((rows) => rows.map(_progressToDomain).toList());

  Future<Map<String, int>> getProgressCounts(String childId) =>
      _dao.progressCountByChild(childId);

  /// Logs a progress note and, if outcome is [ProgressOutcome.achieved],
  /// also marks the parent step as achieved.
  Future<void> logProgress(StepProgress progress) async {
    final existing = await _dao.findProgressById(progress.id);
    final isNew = existing == null;
    final withUser = progress.copyWith(
      createdById: isNew ? _currentUser?.id : progress.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsertProgress(_progressToCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'step_progress',
      recordId: progress.id,
      before: isNew ? null : _progressToDomain(existing).toJson(),
      after: withUser.toJson(),
    );

    // Auto-mark step as achieved when outcome is achieved.
    if (progress.outcome == ProgressOutcome.achieved) {
      final step = await _dao.findStepById(progress.stepId);
      if (step != null && step.status != StepStatus.achieved.name) {
        final now = DateTime.now().toUtc();
        final todayStr = _todayStr();
        final before = _stepToDomain(step);
        await _dao.upsertStep(
          SmartStepsTableCompanion(
            id: Value(step.id),
            status: const Value('achieved'),
            achievedDate: Value(todayStr),
            updatedById: Value(_currentUser?.id),
            updatedAt: Value(now),
            isSynced: const Value(false),
          ),
        );
        final after = before.copyWith(
          status: StepStatus.achieved,
          achievedDate: todayStr,
          updatedById: _currentUser?.id,
          updatedAt: now,
        );
        await _audit.record(
          action: 'update',
          table: 'smart_steps',
          recordId: step.id,
          before: before.toJson(),
          after: after.toJson(),
        );
      }
    }

    _trySyncProgress(withUser);
  }

  String _todayStr() => UkTime.todayStr();

  // ── Helpers ───────────────────────────────────────────────────────────

  SmartStep _stepToDomain(SmartStepRow r) => SmartStep(
    id: r.id,
    homeId: r.homeId,
    childId: r.childId,
    category: StepCategory.values.byName(r.category),
    title: r.title,
    description: r.description,
    targetDate: r.targetDate,
    status: StepStatus.values.byName(r.status),
    achievedDate: r.achievedDate,
    createdById: r.createdById,
    updatedById: r.updatedById,
    deletedAt: r.deletedAt,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
    isSynced: r.isSynced,
  );

  SmartStepsTableCompanion _stepToCompanion(SmartStep s) =>
      SmartStepsTableCompanion(
        id: Value(s.id),
        homeId: Value(s.homeId),
        childId: Value(s.childId),
        category: Value(s.category.name),
        title: Value(s.title),
        description: Value(s.description),
        targetDate: Value(s.targetDate),
        status: Value(s.status.name),
        achievedDate: Value(s.achievedDate),
        createdById: Value(s.createdById),
        updatedById: Value(s.updatedById),
        deletedAt: Value(s.deletedAt?.toUtc()),
        createdAt: Value(s.createdAt.toUtc()),
        updatedAt: Value(s.updatedAt.toUtc()),
        isSynced: Value(s.isSynced),
      );

  StepProgress _progressToDomain(StepProgressRow r) => StepProgress(
    id: r.id,
    homeId: r.homeId,
    childId: r.childId,
    stepId: r.stepId,
    date: r.date,
    shift: ShiftType.values.byName(r.shift),
    outcome: ProgressOutcome.values.byName(r.outcome),
    note: r.note,
    recordedById: r.recordedById,
    recordedByName: r.recordedByName,
    createdById: r.createdById,
    updatedById: r.updatedById,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
    isSynced: r.isSynced,
  );

  StepProgressTableCompanion _progressToCompanion(StepProgress p) =>
      StepProgressTableCompanion(
        id: Value(p.id),
        homeId: Value(p.homeId),
        childId: Value(p.childId),
        stepId: Value(p.stepId),
        date: Value(p.date),
        shift: Value(p.shift.name),
        outcome: Value(p.outcome.name),
        note: Value(p.note),
        recordedById: Value(p.recordedById),
        recordedByName: Value(p.recordedByName),
        createdById: Value(p.createdById),
        updatedById: Value(p.updatedById),
        createdAt: Value(p.createdAt.toUtc()),
        updatedAt: Value(p.updatedAt.toUtc()),
        isSynced: Value(p.isSynced),
      );

  Future<void> _trySyncStep(SmartStep s) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('smart_steps').upsert({
        'id': s.id,
        'home_id': s.homeId,
        'child_id': s.childId,
        'category': s.category.name,
        'title': s.title,
        'description': s.description,
        'target_date': s.targetDate,
        'status': s.status.name,
        'achieved_date': s.achievedDate,
        'created_by_id': s.createdById,
        'updated_by_id': s.updatedById,
        'updated_at': s.updatedAt.toUtc().toIso8601String(),
        'deleted_at': s.deletedAt?.toUtc().toIso8601String(),
      });
      await _dao.upsertStep(_stepToCompanion(s.copyWith(isSynced: true)));
    } catch (err, st) {
      log(
        'Sync failed for smart step ${s.id}',
        error: err,
        stackTrace: st,
        name: 'SmartStepsRepository',
      );
    }
  }

  Future<void> _trySyncProgress(StepProgress p) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('step_progress').upsert({
        'id': p.id,
        'home_id': p.homeId,
        'child_id': p.childId,
        'step_id': p.stepId,
        'date': p.date,
        'shift': p.shift.name,
        'outcome': p.outcome.name,
        'note': p.note,
        'recorded_by_id': p.recordedById,
        'recorded_by_name': p.recordedByName,
        'created_by_id': p.createdById,
        'updated_by_id': p.updatedById,
        'updated_at': p.updatedAt.toUtc().toIso8601String(),
      });
      await _dao.upsertProgress(
        _progressToCompanion(p.copyWith(isSynced: true)),
      );
    } catch (err, st) {
      log(
        'Sync failed for step progress ${p.id}',
        error: err,
        stackTrace: st,
        name: 'SmartStepsRepository',
      );
    }
  }
}
