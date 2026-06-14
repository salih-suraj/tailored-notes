import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/audit/audit_log_writer.dart';
import '../../../core/offline/app_database.dart';
import '../../../features/auth/domain/app_user.dart';
import '../../../core/offline/sync_service.dart';
import '../../../core/time/uk_time.dart';
import '../domain/visitor_log_entry.dart';
import 'visitor_log_dao.dart';

class VisitorLogRepository implements SyncTarget {
  VisitorLogRepository({
    required VisitorLogDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
    required AuditLogWriter auditWriter,
  }) : _dao = dao,
       _supabaseClient = supabaseClient,
       _currentUser = currentUser,
       _audit = auditWriter;

  final VisitorLogDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;
  final AuditLogWriter _audit;

  String get _homeId => _currentUser?.homeId ?? 'dev-home-001';

  /// Live stream of today's (London time) visitor entries, newest first.
  Stream<List<VisitorLogEntry>> watchToday() {
    return _dao
        .watchByHomeAndDate(
          _homeId,
          UkTime.startOfTodayUtc(),
          UkTime.endOfTodayUtc(),
        )
        .map((rows) => rows.map(_toDomain).toList());
  }

  Future<void> save(VisitorLogEntry entry) async {
    final existing = await _dao.findById(entry.id);
    final isNew = existing == null;
    final withUser = entry.copyWith(
      createdById: isNew ? _currentUser?.id : entry.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsert(_toCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'visitor_log',
      recordId: entry.id,
      before: isNew ? null : _toDomain(existing).toJson(),
      after: withUser.toJson(),
    );
    _trySyncToSupabase(withUser);
  }

  /// Records departure time for [id].
  Future<void> recordDeparture(String id) async {
    final existing = await _dao.findById(id);
    if (existing == null) return;
    final departed = _toDomain(existing).copyWith(
      departedAt: DateTime.now().toUtc(),
      updatedById: _currentUser?.id,
      updatedAt: DateTime.now().toUtc(),
      isSynced: false,
    );
    await _dao.upsert(_toCompanion(departed));
    await _audit.record(
      action: 'update',
      table: 'visitor_log',
      recordId: id,
      before: _toDomain(existing).toJson(),
      after: departed.toJson(),
    );
    _trySyncToSupabase(departed);
  }

  Future<void> delete(String id) async {
    final existing = await _dao.findById(id);
    await _dao.softDelete(id);
    await _audit.record(
      action: 'delete',
      table: 'visitor_log',
      recordId: id,
      before: existing != null ? _toDomain(existing).toJson() : null,
    );

    final deleted = await _dao.findById(id);
    if (deleted != null) _trySyncToSupabase(_toDomain(deleted));
  }

  @override
  String get syncLabel => 'visitor_log';

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

  // ── Helpers ──────────────────────────────────────────────────────────────

  VisitorLogEntry _toDomain(VisitorLogRow r) => VisitorLogEntry(
    id: r.id,
    homeId: r.homeId,
    visitorName: r.visitorName,
    relation: r.relation,
    purpose: r.purpose,
    authorisedBy: r.authorisedBy,
    arrivedAt: r.arrivedAt,
    departedAt: r.departedAt,
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

  VisitorLogTableCompanion _toCompanion(VisitorLogEntry e) =>
      VisitorLogTableCompanion(
        id: Value(e.id),
        homeId: Value(e.homeId),
        visitorName: Value(e.visitorName),
        relation: Value(e.relation),
        purpose: Value(e.purpose),
        authorisedBy: Value(e.authorisedBy),
        arrivedAt: Value(e.arrivedAt.toUtc()),
        departedAt: Value(e.departedAt?.toUtc()),
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

  Future<void> _trySyncToSupabase(VisitorLogEntry entry) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('visitor_log').upsert({
        'id': entry.id,
        'home_id': entry.homeId,
        'visitor_name': entry.visitorName,
        'relation': entry.relation,
        'purpose': entry.purpose,
        'authorised_by': entry.authorisedBy,
        'arrived_at': entry.arrivedAt.toUtc().toIso8601String(),
        'departed_at': entry.departedAt?.toUtc().toIso8601String(),
        'notes': entry.notes,
        'recorded_by_id': entry.recordedById,
        'recorded_by_name': entry.recordedByName,
        'created_by_id': entry.createdById,
        'updated_by_id': entry.updatedById,
        'updated_at': entry.updatedAt.toUtc().toIso8601String(),
        'deleted_at': entry.deletedAt?.toUtc().toIso8601String(),
      });
      await _dao.upsert(_toCompanion(entry.copyWith(isSynced: true)));
    } catch (err, st) {
      log(
        'Supabase sync failed for visitor log ${entry.id}',
        error: err,
        stackTrace: st,
        name: 'VisitorLogRepository',
      );
    }
  }
}
