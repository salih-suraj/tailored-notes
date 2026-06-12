import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/audit/audit_log_writer.dart';
import '../../../core/offline/app_database.dart';
import '../../../core/offline/sync_service.dart';
import '../../auth/domain/app_user.dart';
import '../domain/child.dart';
import 'children_dao.dart';

/// Coordinates local Drift persistence and background Supabase sync for children.
/// All writes go to Drift first — the app is fully functional offline.
/// Every mutation is recorded in the audit log.
class ChildrenRepository implements SyncTarget {
  ChildrenRepository({
    required ChildrenDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
    required AuditLogWriter auditWriter,
  })  : _dao = dao,
        _supabaseClient = supabaseClient,
        _currentUser = currentUser,
        _audit = auditWriter;

  final ChildrenDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;
  final AuditLogWriter _audit;

  Stream<List<Child>> watchByHome(String homeId) =>
      _dao.watchByHome(homeId).map((rows) => rows.map(_toDomain).toList());

  Future<void> save(Child child) async {
    final existing = await _dao.findById(child.id);
    final isNew = existing == null;

    final withUpdater = child.copyWith(
      createdById: isNew ? (_currentUser?.id) : child.createdById,
      updatedById: _currentUser?.id,
    );

    await _dao.upsert(_toCompanion(withUpdater));

    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'children',
      recordId: child.id,
      before: isNew ? null : {'id': existing.id, 'name': existing.name, 'room': existing.room},
      after: {'id': child.id, 'name': child.name, 'room': child.room, 'date_of_birth': child.dateOfBirth},
    );

    _trySyncToSupabase(withUpdater);
  }

  @override
  String get syncLabel => 'children';

  @override
  Future<void> syncPending() async {
    if (_supabaseClient == null) return;
    final rows = await _dao.getUnsynced();
    for (final row in rows) {
      final child = _toDomain(row);
      if (!SyncService.isCloudSyncable(child.homeId)) continue;
      await _trySyncToSupabase(child);
    }
  }

  // ── Private helpers ────────────────────────────────────────────────────────

  Child _toDomain(ChildRow row) => Child(
        id: row.id,
        homeId: row.homeId,
        name: row.name,
        dateOfBirth: row.dateOfBirth,
        room: row.room,
        photoUrl: row.photoUrl,
        notes: row.notes,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        deletedAt: row.deletedAt,
        createdById: row.createdById,
        updatedById: row.updatedById,
        isSynced: row.isSynced,
      );

  ChildrenTableCompanion _toCompanion(Child child) => ChildrenTableCompanion(
        id: Value(child.id),
        homeId: Value(child.homeId),
        name: Value(child.name),
        dateOfBirth: Value(child.dateOfBirth),
        room: Value(child.room),
        photoUrl: Value(child.photoUrl),
        notes: Value(child.notes),
        createdAt: Value(child.createdAt.toUtc()),
        updatedAt: Value(child.updatedAt.toUtc()),
        deletedAt: Value(child.deletedAt?.toUtc()),
        createdById: Value(child.createdById),
        updatedById: Value(child.updatedById),
        isSynced: Value(child.isSynced),
      );

  Future<void> _trySyncToSupabase(Child child) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('children').upsert({
        'id': child.id,
        'home_id': child.homeId,
        'name': child.name,
        'date_of_birth': child.dateOfBirth,
        'room': child.room,
        'photo_url': child.photoUrl,
        'notes': child.notes,
        'created_at': child.createdAt.toUtc().toIso8601String(),
        'updated_at': child.updatedAt.toUtc().toIso8601String(),
        'created_by_id': child.createdById,
        'updated_by_id': child.updatedById,
        'deleted_at': child.deletedAt?.toUtc().toIso8601String(),
      });
      await _dao.upsert(_toCompanion(child.copyWith(isSynced: true)));
    } catch (e, st) {
      log(
        'Supabase sync failed for child ${child.id}',
        error: e,
        stackTrace: st,
        name: 'ChildrenRepository',
      );
    }
  }
}
