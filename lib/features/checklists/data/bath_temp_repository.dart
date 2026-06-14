import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/audit/audit_log_writer.dart';
import '../../../core/offline/app_database.dart';
import '../../../features/auth/domain/app_user.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../core/offline/sync_service.dart';
import '../../../core/time/uk_time.dart';
import '../domain/bath_temp_record.dart';
import 'bath_temp_records_dao.dart';

class BathTempRepository implements SyncTarget {
  BathTempRepository({
    required BathTempRecordsDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
    required AuditLogWriter auditWriter,
  }) : _dao = dao,
       _supabaseClient = supabaseClient,
       _currentUser = currentUser,
       _audit = auditWriter;

  final BathTempRecordsDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;
  final AuditLogWriter _audit;

  /// Live stream of today's bath temp records for [childId], newest first.
  Stream<List<BathTempRecord>> watchToday(String childId) => _dao
      .watchByChildAndDate(childId, _todayStr())
      .map((rows) => rows.map(_toDomain).toList());

  Future<void> save(BathTempRecord record) async {
    final existing = await _dao.findById(record.id);
    final isNew = existing == null;
    final withUser = record.copyWith(
      createdById: isNew ? _currentUser?.id : record.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsert(_toCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'bath_temp_records',
      recordId: record.id,
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
      table: 'bath_temp_records',
      recordId: id,
      before: existing != null ? _toDomain(existing).toJson() : null,
    );

    // BathTempRecord (domain) carries no deletedAt — pass the tombstone
    // from the row explicitly so the cloud copy is marked deleted too.
    final deleted = await _dao.findById(id);
    if (deleted != null) {
      _trySyncToSupabase(_toDomain(deleted), deletedAt: deleted.deletedAt);
    }
  }

  @override
  String get syncLabel => 'bath_temp_records';

  @override
  Future<void> syncPending() async {
    if (_supabaseClient == null) return;
    final rows = await _dao.getUnsynced();
    for (final row in rows) {
      final record = _toDomain(row);
      if (!SyncService.isCloudSyncable(record.homeId)) continue;
      await _trySyncToSupabase(record, deletedAt: row.deletedAt);
    }
  }

  // ── Helpers ──────────────────────────────────────────────────────────────

  String _todayStr() => UkTime.todayStr();

  BathTempRecord _toDomain(BathTempRow row) => BathTempRecord(
    id: row.id,
    homeId: row.homeId,
    childId: row.childId,
    temperatureCelsius: row.temperatureCelsius,
    shift: ShiftType.values.byName(row.shift),
    recordedAt: row.recordedAt,
    recordedById: row.recordedById,
    recordedByName: row.recordedByName,
    notes: row.notes,
    createdById: row.createdById,
    updatedById: row.updatedById,
    createdAt: row.createdAt,
    updatedAt: row.updatedAt,
    isSynced: row.isSynced,
  );

  BathTempRecordsTableCompanion _toCompanion(BathTempRecord r) =>
      BathTempRecordsTableCompanion(
        id: Value(r.id),
        homeId: Value(r.homeId),
        childId: Value(r.childId),
        temperatureCelsius: Value(r.temperatureCelsius),
        shift: Value(r.shift.name),
        recordedAt: Value(r.recordedAt.toUtc()),
        recordedById: Value(r.recordedById),
        recordedByName: Value(r.recordedByName),
        notes: Value(r.notes),
        createdById: Value(r.createdById),
        updatedById: Value(r.updatedById),
        createdAt: Value(r.createdAt.toUtc()),
        updatedAt: Value(r.updatedAt.toUtc()),
        isSynced: Value(r.isSynced),
      );

  Future<void> _trySyncToSupabase(
    BathTempRecord r, {
    DateTime? deletedAt,
  }) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('bath_temp_records').upsert({
        'id': r.id,
        'home_id': r.homeId,
        'child_id': r.childId,
        'temperature_celsius': r.temperatureCelsius,
        'shift': r.shift.name,
        'recorded_at': r.recordedAt.toUtc().toIso8601String(),
        'recorded_by_id': r.recordedById,
        'recorded_by_name': r.recordedByName,
        'notes': r.notes,
        'created_by_id': r.createdById,
        'updated_by_id': r.updatedById,
        'updated_at': r.updatedAt.toUtc().toIso8601String(),
        'deleted_at': deletedAt?.toUtc().toIso8601String(),
      });
      await _dao.upsert(_toCompanion(r.copyWith(isSynced: true)));
    } catch (e, st) {
      log(
        'Supabase sync failed for bath temp ${r.id}',
        error: e,
        stackTrace: st,
        name: 'BathTempRepository',
      );
    }
  }
}
