import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/audit/audit_log_writer.dart';
import '../../../core/offline/app_database.dart';
import '../../../features/auth/domain/app_user.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../core/offline/sync_service.dart';
import '../domain/activity_entry.dart';
import 'activity_entries_dao.dart';

class ActivityEntriesRepository implements SyncTarget {
  ActivityEntriesRepository({
    required ActivityEntriesDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
    required AuditLogWriter auditWriter,
  }) : _dao = dao,
       _supabaseClient = supabaseClient,
       _currentUser = currentUser,
       _audit = auditWriter;

  final ActivityEntriesDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;
  final AuditLogWriter _audit;

  Stream<List<ActivityEntry>> watchByChild(String childId) =>
      _dao.watchByChild(childId).map((rows) => rows.map(_toDomain).toList());

  Future<void> save(ActivityEntry entry) async {
    final existing = await _dao.findById(entry.id);
    final isNew = existing == null;
    final withUser = entry.copyWith(
      createdById: isNew ? _currentUser?.id : entry.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsert(_toCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'activity_entries',
      recordId: entry.id,
      before: isNew ? null : _toDomain(existing).toJson(),
      after: withUser.toJson(),
    );
    _trySyncToSupabase(withUser);
  }

  Future<void> delete(String id) async {
    final existing = await _dao.findById(id);
    await _dao.softDelete(id);
    await _audit.record(
      action: 'delete',
      table: 'activity_entries',
      recordId: id,
      before: existing != null ? _toDomain(existing).toJson() : null,
    );

    final deleted = await _dao.findById(id);
    if (deleted != null) _trySyncToSupabase(_toDomain(deleted));
  }

  @override
  String get syncLabel => 'activity_entries';

  @override
  Future<void> syncPending() async {
    if (_supabaseClient == null) return;
    final rows = await _dao.getUnsynced();
    for (final row in rows) {
      final entry = _toDomain(row);
      if (!SyncService.isCloudSyncable(entry.homeId)) continue;
      await _trySyncToSupabase(entry);
    }
  }

  ActivityEntry _toDomain(ActivityEntryRow r) => ActivityEntry(
    id: r.id,
    homeId: r.homeId,
    childId: r.childId,
    date: r.date,
    shift: ShiftType.values.byName(r.shift),
    category: ActivityCategory.values.byName(r.category),
    title: r.title,
    description: r.description,
    durationMinutes: r.durationMinutes,
    rewardEarned: r.rewardEarned,
    achievement: r.achievement,
    recordedById: r.recordedById,
    recordedByName: r.recordedByName,
    createdById: r.createdById,
    updatedById: r.updatedById,
    deletedAt: r.deletedAt,
    createdAt: r.createdAt,
    updatedAt: r.updatedAt,
    isSynced: r.isSynced,
  );

  ActivityEntriesTableCompanion _toCompanion(ActivityEntry e) =>
      ActivityEntriesTableCompanion(
        id: Value(e.id),
        homeId: Value(e.homeId),
        childId: Value(e.childId),
        date: Value(e.date),
        shift: Value(e.shift.name),
        category: Value(e.category.name),
        title: Value(e.title),
        description: Value(e.description),
        durationMinutes: Value(e.durationMinutes),
        rewardEarned: Value(e.rewardEarned),
        achievement: Value(e.achievement),
        recordedById: Value(e.recordedById),
        recordedByName: Value(e.recordedByName),
        createdById: Value(e.createdById),
        updatedById: Value(e.updatedById),
        deletedAt: Value(e.deletedAt?.toUtc()),
        createdAt: Value(e.createdAt.toUtc()),
        updatedAt: Value(e.updatedAt.toUtc()),
        isSynced: Value(e.isSynced),
      );

  Future<void> _trySyncToSupabase(ActivityEntry e) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('activity_entries').upsert({
        'id': e.id,
        'home_id': e.homeId,
        'child_id': e.childId,
        'date': e.date,
        'shift': e.shift.name,
        'category': e.category.name,
        'title': e.title,
        'description': e.description,
        'duration_minutes': e.durationMinutes,
        'reward_earned': e.rewardEarned,
        'achievement': e.achievement,
        'recorded_by_id': e.recordedById,
        'recorded_by_name': e.recordedByName,
        'created_by_id': e.createdById,
        'updated_by_id': e.updatedById,
        'updated_at': e.updatedAt.toUtc().toIso8601String(),
        'deleted_at': e.deletedAt?.toUtc().toIso8601String(),
      });
      await _dao.upsert(_toCompanion(e.copyWith(isSynced: true)));
    } catch (err, st) {
      log(
        'Sync failed for activity entry ${e.id}',
        error: err,
        stackTrace: st,
        name: 'ActivityEntriesRepository',
      );
    }
  }
}
