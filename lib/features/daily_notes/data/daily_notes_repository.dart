import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/audit/audit_log_writer.dart';
import '../../../core/offline/app_database.dart';
import '../../../features/auth/domain/app_user.dart';
import '../domain/daily_note.dart';
import 'daily_notes_dao.dart';

/// Coordinates local Drift persistence and background Supabase sync.
/// All writes go to Drift first — the app is fully functional offline.
/// Every mutation is recorded in the audit log.
class DailyNotesRepository {
  DailyNotesRepository({
    required DailyNotesDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
    required AuditLogWriter auditWriter,
  })  : _dao = dao,
        _supabaseClient = supabaseClient,
        _currentUser = currentUser,
        _audit = auditWriter;

  final DailyNotesDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;
  final AuditLogWriter _audit;

  /// Live stream of notes for [childId], newest first.
  Stream<List<DailyNote>> watchByChild(String childId) =>
      _dao.watchByChild(childId).map((rows) => rows.map(_toDomain).toList());

  /// Persists [note] locally, writes to audit log, then attempts background sync.
  Future<void> save(DailyNote note) async {
    final existing = await _dao.findById(note.id);
    final isNew = existing == null;

    final withUpdater = note.copyWith(
      updatedById: _currentUser?.id,
      updatedByName: _currentUser?.displayName ?? _currentUser?.email,
    );

    await _dao.upsert(_toCompanion(withUpdater));

    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'daily_notes',
      recordId: note.id,
      before: isNew ? null : _toDomain(existing).toJson(),
      after: withUpdater.toJson(),
    );

    _trySyncToSupabase(withUpdater);
  }

  /// Soft-deletes the note locally, logs the deletion, and marks it for sync.
  Future<void> delete(String id) async {
    final existing = await _dao.findById(id);
    await _dao.softDelete(id);

    await _audit.record(
      action: 'delete',
      table: 'daily_notes',
      recordId: id,
      before: existing != null ? _toDomain(existing).toJson() : null,
    );
  }

  // ── Private helpers ────────────────────────────────────────────────────────

  DailyNote _toDomain(DailyNoteRow row) => DailyNote(
        id: row.id,
        homeId: row.homeId,
        childId: row.childId,
        authorId: row.authorId,
        authorName: row.authorName,
        shift: ShiftType.values.byName(row.shift),
        content: row.content,
        occurredAt: row.occurredAt,
        createdAt: row.createdAt,
        updatedAt: row.updatedAt,
        deletedAt: row.deletedAt,
        updatedById: row.updatedById,
        updatedByName: row.updatedByName,
        isSynced: row.isSynced,
      );

  DailyNotesTableCompanion _toCompanion(DailyNote note) =>
      DailyNotesTableCompanion(
        id: Value(note.id),
        homeId: Value(note.homeId),
        childId: Value(note.childId),
        authorId: Value(note.authorId),
        authorName: Value(note.authorName),
        shift: Value(note.shift.name),
        content: Value(note.content),
        occurredAt: Value(note.occurredAt.toUtc()),
        createdAt: Value(note.createdAt.toUtc()),
        updatedAt: Value(note.updatedAt.toUtc()),
        deletedAt: Value(note.deletedAt?.toUtc()),
        updatedById: Value(note.updatedById),
        updatedByName: Value(note.updatedByName),
        isSynced: Value(note.isSynced),
      );

  void _trySyncToSupabase(DailyNote note) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('daily_notes').upsert({
        'id': note.id,
        'home_id': note.homeId,
        'child_id': note.childId,
        'author_id': note.authorId,
        'author_name': note.authorName,
        'shift': note.shift.name,
        'content': note.content,
        'occurred_at': note.occurredAt.toUtc().toIso8601String(),
        'created_at': note.createdAt.toUtc().toIso8601String(),
        'updated_at': note.updatedAt.toUtc().toIso8601String(),
        'updated_by_id': note.updatedById,
        'updated_by_name': note.updatedByName,
      });
      await _dao.upsert(_toCompanion(note.copyWith(isSynced: true)));
    } catch (e, st) {
      log(
        'Supabase sync failed for note ${note.id}',
        error: e,
        stackTrace: st,
        name: 'DailyNotesRepository',
      );
    }
  }
}
