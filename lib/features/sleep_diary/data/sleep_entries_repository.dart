import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/audit/audit_log_writer.dart';
import '../../../core/offline/app_database.dart';
import '../../../features/auth/domain/app_user.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../domain/sleep_entry.dart';
import 'sleep_entries_dao.dart';

class SleepEntriesRepository {
  SleepEntriesRepository({
    required SleepEntriesDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
    required AuditLogWriter auditWriter,
  })  : _dao = dao,
        _supabaseClient = supabaseClient,
        _currentUser = currentUser,
        _audit = auditWriter;

  final SleepEntriesDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;
  final AuditLogWriter _audit;

  Stream<List<SleepEntry>> watchByChild(String childId) =>
      _dao.watchByChild(childId).map((rows) => rows.map(_toDomain).toList());

  Future<void> save(SleepEntry entry) async {
    final existing = await _dao.findById(entry.id);
    final isNew = existing == null;
    final withUser = entry.copyWith(
      createdById: isNew ? _currentUser?.id : entry.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsert(_toCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'sleep_entries',
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
      table: 'sleep_entries',
      recordId: id,
      before: existing != null ? _toDomain(existing).toJson() : null,
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────

  SleepEntry _toDomain(SleepEntryRow r) => SleepEntry(
        id: r.id,
        homeId: r.homeId,
        childId: r.childId,
        date: r.date,
        shift: ShiftType.values.byName(r.shift),
        bedTime: r.bedTime,
        settledTime: r.settledTime,
        wakeTime: r.wakeTime,
        numberOfWakings: r.numberOfWakings,
        quality: SleepQuality.values.byName(r.quality),
        notes: r.notes,
        recordedById: r.recordedById,
        recordedByName: r.recordedByName,
        createdById: r.createdById,
        updatedById: r.updatedById,
        deletedAt: r.deletedAt,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        isSynced: r.isSynced,
      );

  SleepEntriesTableCompanion _toCompanion(SleepEntry e) =>
      SleepEntriesTableCompanion(
        id: Value(e.id),
        homeId: Value(e.homeId),
        childId: Value(e.childId),
        date: Value(e.date),
        shift: Value(e.shift.name),
        bedTime: Value(e.bedTime),
        settledTime: Value(e.settledTime),
        wakeTime: Value(e.wakeTime),
        numberOfWakings: Value(e.numberOfWakings),
        quality: Value(e.quality.name),
        notes: Value(e.notes),
        recordedById: Value(e.recordedById),
        recordedByName: Value(e.recordedByName),
        createdById: Value(e.createdById),
        updatedById: Value(e.updatedById),
        deletedAt: Value(e.deletedAt?.toUtc()),
        createdAt: Value(e.createdAt.toUtc()),
        updatedAt: Value(e.updatedAt.toUtc()),
        isSynced: Value(e.isSynced),
      );

  void _trySyncToSupabase(SleepEntry e) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('sleep_entries').upsert({
        'id': e.id,
        'home_id': e.homeId,
        'child_id': e.childId,
        'date': e.date,
        'shift': e.shift.name,
        'bed_time': e.bedTime,
        'settled_time': e.settledTime,
        'wake_time': e.wakeTime,
        'number_of_wakings': e.numberOfWakings,
        'quality': e.quality.name,
        'notes': e.notes,
        'recorded_by_id': e.recordedById,
        'recorded_by_name': e.recordedByName,
        'created_by_id': e.createdById,
        'updated_by_id': e.updatedById,
        'updated_at': e.updatedAt.toUtc().toIso8601String(),
      });
      await _dao.upsert(_toCompanion(e.copyWith(isSynced: true)));
    } catch (err, st) {
      log('Sync failed for sleep entry ${e.id}',
          error: err, stackTrace: st, name: 'SleepEntriesRepository');
    }
  }
}
