import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/audit/audit_log_writer.dart';
import '../../../core/offline/app_database.dart';
import '../../../features/auth/domain/app_user.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../core/offline/sync_service.dart';
import '../../../core/time/uk_time.dart';
import '../domain/checklist_item.dart';
import 'checklist_items_dao.dart';

/// Coordinates local Drift persistence and background Supabase sync for
/// cleaning checklists. All writes go to Drift first.
/// Every toggle is recorded in the audit log.
class ChecklistItemsRepository implements SyncTarget {
  ChecklistItemsRepository({
    required ChecklistItemsDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
    required AuditLogWriter auditWriter,
  })  : _dao = dao,
        _supabaseClient = supabaseClient,
        _currentUser = currentUser,
        _audit = auditWriter;

  final ChecklistItemsDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;
  final AuditLogWriter _audit;

  String get _homeId => _currentUser?.homeId ?? 'dev-home-001';

  /// Live stream of bedroom task items for [childId] on today's current shift.
  Stream<List<ChecklistItem>> watchRoomItems(String childId) {
    final shift = ShiftType.forTime(DateTime.now());
    final date = _todayStr();
    return _dao
        .watchByChildShiftAndDate(childId, shift.name, date)
        .map((rows) => _mergeRoomTemplates(
              childId: childId,
              shift: shift,
              date: date,
              rows: rows,
            ));
  }

  /// Live stream of communal task items for the home on today's current shift.
  Stream<List<ChecklistItem>> watchCommunalItems() {
    final shift = ShiftType.forTime(DateTime.now());
    final date = _todayStr();
    return _dao
        .watchCommunalByShiftAndDate(_homeId, shift.name, date)
        .map((rows) =>
            _mergeCommunalTemplates(shift: shift, date: date, rows: rows));
  }

  /// Toggles the completion state of [item], logs the change, persists locally, then syncs.
  Future<void> toggle(ChecklistItem item) async {
    final now = DateTime.now().toUtc();
    final toggled = item.copyWith(
      isComplete: !item.isComplete,
      completedAt: !item.isComplete ? now : null,
      completedByName: !item.isComplete ? _currentUser?.displayName : null,
      updatedById: _currentUser?.id,
      updatedAt: now,
      isSynced: false,
    );

    // For a stub (no DB row yet), this is an insert; otherwise an update.
    final existing = await _dao.findById(item.id);
    final isNew = existing == null;

    final withCreator = isNew
        ? toggled.copyWith(createdById: _currentUser?.id)
        : toggled;

    await _dao.upsert(_toCompanion(withCreator));

    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'checklist_items',
      recordId: item.id,
      before: isNew ? null : item.toJson(),
      after: withCreator.toJson(),
    );

    _trySyncToSupabase(withCreator);
  }

  @override
  String get syncLabel => 'checklist_items';

  // Checklist items are toggle-only (no delete flow), so the sweep just
  // re-pushes pending upserts.
  @override
  Future<void> syncPending() async {
    if (_supabaseClient == null) return;
    final rows = await _dao.getUnsynced();
    for (final row in rows) {
      final item = _toDomain(row);
      if (!SyncService.isCloudSyncable(item.homeId)) continue;
      await _trySyncToSupabase(item);
    }
  }

  // ── Private helpers ──────────────────────────────────────────────────────

  List<ChecklistItem> _mergeRoomTemplates({
    required String childId,
    required ShiftType shift,
    required String date,
    required List<ChecklistItemRow> rows,
  }) {
    final byId = {for (final r in rows) r.id: r};
    return roomCleaningTasks.map((task) {
      final (taskKey, taskLabel) = task;
      final id = _itemId(
        childId: childId,
        areaKey: 'bedroom',
        taskKey: taskKey,
        shift: shift,
        date: date,
      );
      final row = byId[id];
      return row != null
          ? _toDomain(row)
          : _stub(
              id: id,
              childId: childId,
              areaKey: 'bedroom',
              areaLabel: 'Bedroom',
              taskKey: taskKey,
              taskLabel: taskLabel,
              shift: shift,
              date: date,
            );
    }).toList();
  }

  List<ChecklistItem> _mergeCommunalTemplates({
    required ShiftType shift,
    required String date,
    required List<ChecklistItemRow> rows,
  }) {
    final byId = {for (final r in rows) r.id: r};
    final result = <ChecklistItem>[];
    for (final area in communalAreas) {
      for (final task in area.tasks) {
        final (taskKey, taskLabel) = task;
        final id = _itemId(
          areaKey: area.key,
          taskKey: taskKey,
          shift: shift,
          date: date,
        );
        final row = byId[id];
        result.add(
          row != null
              ? _toDomain(row)
              : _stub(
                  id: id,
                  areaKey: area.key,
                  areaLabel: area.label,
                  taskKey: taskKey,
                  taskLabel: taskLabel,
                  shift: shift,
                  date: date,
                ),
        );
      }
    }
    return result;
  }

  ChecklistItem _stub({
    required String id,
    String? childId,
    required String areaKey,
    required String areaLabel,
    required String taskKey,
    required String taskLabel,
    required ShiftType shift,
    required String date,
  }) {
    final now = DateTime.now().toUtc();
    return ChecklistItem(
      id: id,
      homeId: _homeId,
      childId: childId,
      areaKey: areaKey,
      areaLabel: areaLabel,
      taskKey: taskKey,
      taskLabel: taskLabel,
      shift: shift,
      date: date,
      createdAt: now,
      updatedAt: now,
    );
  }

  String _itemId({
    String? childId,
    required String areaKey,
    required String taskKey,
    required ShiftType shift,
    required String date,
  }) =>
      '${_homeId}_${childId ?? 'communal'}_${areaKey}_${taskKey}_${shift.name}_$date';

  String _todayStr() => UkTime.todayStr();

  ChecklistItem _toDomain(ChecklistItemRow row) => ChecklistItem(
        id: row.id,
        homeId: row.homeId,
        childId: row.childId,
        areaKey: row.areaKey,
        areaLabel: row.areaLabel,
        taskKey: row.taskKey,
        taskLabel: row.taskLabel,
        shift: ShiftType.values.byName(row.shift),
        date: row.date,
        isComplete: row.isComplete,
        completedAt: row.completedAt,
        completedByName: row.completedByName,
        createdById: row.createdById,
        updatedById: row.updatedById,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        isSynced: row.isSynced,
      );

  ChecklistItemsTableCompanion _toCompanion(ChecklistItem item) =>
      ChecklistItemsTableCompanion(
        id: Value(item.id),
        homeId: Value(item.homeId),
        childId: Value(item.childId),
        areaKey: Value(item.areaKey),
        areaLabel: Value(item.areaLabel),
        taskKey: Value(item.taskKey),
        taskLabel: Value(item.taskLabel),
        shift: Value(item.shift.name),
        date: Value(item.date),
        isComplete: Value(item.isComplete),
        completedAt: Value(item.completedAt),
        completedByName: Value(item.completedByName),
        createdById: Value(item.createdById),
        updatedById: Value(item.updatedById),
        createdAt: Value(item.createdAt),
        updatedAt: Value(item.updatedAt),
        isSynced: Value(item.isSynced),
      );

  Future<void> _trySyncToSupabase(ChecklistItem item) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('checklist_items').upsert({
        'id': item.id,
        'home_id': item.homeId,
        'child_id': item.childId,
        'area_key': item.areaKey,
        'area_label': item.areaLabel,
        'task_key': item.taskKey,
        'task_label': item.taskLabel,
        'shift': item.shift.name,
        'date': item.date,
        'is_complete': item.isComplete,
        'completed_at': item.completedAt?.toIso8601String(),
        'completed_by_name': item.completedByName,
        'created_by_id': item.createdById,
        'updated_by_id': item.updatedById,
        'updated_at': item.updatedAt.toIso8601String(),
      });
      await _dao.upsert(_toCompanion(item.copyWith(isSynced: true)));
    } catch (e, st) {
      log(
        'Supabase sync failed for checklist item ${item.id}',
        error: e,
        stackTrace: st,
        name: 'ChecklistItemsRepository',
      );
    }
  }
}
