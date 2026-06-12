import 'dart:convert';
import 'dart:developer' as dev;

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../features/auth/domain/app_user.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../network/supabase_client.dart';
import '../offline/app_database.dart';
import '../offline/sync_service.dart';
import 'audit_log_dao.dart';

part 'audit_log_writer.g.dart';

/// Writes a timestamped entry to the local audit log on every mutation.
/// Syncs to Supabase in the background when online.
///
/// Call [record] from every repository save / update / delete method.
class AuditLogWriter implements SyncTarget {
  AuditLogWriter({
    required AuditLogDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
  })  : _dao = dao,
        _supabaseClient = supabaseClient,
        _currentUser = currentUser;

  final AuditLogDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;

  /// Records a mutation in the local audit log.
  ///
  /// [action] must be one of: `'insert'`, `'update'`, `'delete'`.
  /// [table] is the SQL table name (e.g. `'daily_notes'`).
  /// [recordId] is the primary key of the affected row.
  /// [before] / [after] are the domain model's `.toJson()` maps — may be null.
  Future<void> record({
    required String action,
    required String table,
    required String recordId,
    Map<String, dynamic>? before,
    Map<String, dynamic>? after,
  }) async {
    final user = _currentUser;
    final entry = AuditLogTableCompanion(
      id: Value(const Uuid().v4()),
      userId: Value(user?.id ?? 'unknown'),
      userDisplayName: Value(user?.displayName ?? user?.email ?? 'unknown'),
      homeId: Value(user?.homeId ?? 'unknown'),
      action: Value(action),
      entityTable: Value(table),
      recordId: Value(recordId),
      before: Value(before != null ? jsonEncode(before) : null),
      after: Value(after != null ? jsonEncode(after) : null),
      timestamp: Value(DateTime.now().toUtc()),
      isSynced: const Value(false),
    );
    try {
      await _dao.insert(entry);
      _trySyncToSupabase(entry);
    } catch (e, st) {
      dev.log(
        'Audit log write failed for $action on $table/$recordId',
        error: e,
        stackTrace: st,
        name: 'AuditLogWriter',
      );
    }
  }

  void _trySyncToSupabase(AuditLogTableCompanion entry) async {
    await _pushEntry(
      id: entry.id.value,
      userId: entry.userId.value,
      userDisplayName: entry.userDisplayName.value,
      homeId: entry.homeId.value,
      action: entry.action.value,
      entityTable: entry.entityTable.value,
      recordId: entry.recordId.value,
      before: entry.before.value,
      after: entry.after.value,
      timestamp: entry.timestamp.value,
    );
  }

  @override
  String get syncLabel => 'audit_log';

  /// Re-pushes audit entries that never reached Supabase (closes the Q1
  /// gap: local audit rows now reach the cloud audit_log eventually).
  @override
  Future<void> syncPending() async {
    if (_supabaseClient == null) return;
    final rows = await _dao.getUnsynced();
    for (final row in rows) {
      // Rows written while logged out or in dev mode carry a non-uuid
      // home_id ('unknown' / 'dev-home-001') and can never sync.
      if (!SyncService.isCloudSyncable(row.homeId)) continue;
      await _pushEntry(
        id: row.id,
        userId: row.userId,
        userDisplayName: row.userDisplayName,
        homeId: row.homeId,
        action: row.action,
        entityTable: row.entityTable,
        recordId: row.recordId,
        before: row.before,
        after: row.after,
        timestamp: row.timestamp,
      );
    }
  }

  Future<void> _pushEntry({
    required String id,
    required String userId,
    required String userDisplayName,
    required String homeId,
    required String action,
    required String entityTable,
    required String recordId,
    required String? before,
    required String? after,
    required DateTime timestamp,
  }) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('audit_log').insert({
        'id': id,
        'user_id': userId,
        'user_display_name': userDisplayName,
        'home_id': homeId,
        'action': action,
        'entity_table': entityTable,
        'record_id': recordId,
        'before': before,
        'after': after,
        'timestamp': timestamp.toIso8601String(),
      });
      await _dao.markSynced(id);
    } on PostgrestException catch (e, st) {
      // 23505 = duplicate key: the row reached the cloud on an earlier
      // attempt but markSynced never ran — reconcile instead of failing
      // forever (audit_log is insert-only by RLS, so no upsert).
      if (e.code == '23505') {
        await _dao.markSynced(id);
        return;
      }
      dev.log(
        'Audit log Supabase sync failed for $id',
        error: e,
        stackTrace: st,
        name: 'AuditLogWriter',
      );
    } catch (e, st) {
      dev.log(
        'Audit log Supabase sync failed for $id',
        error: e,
        stackTrace: st,
        name: 'AuditLogWriter',
      );
    }
  }
}

@Riverpod(keepAlive: true)
AuditLogWriter auditLogWriter(Ref ref) => AuditLogWriter(
      dao: ref.watch(appDatabaseProvider).auditLogDao,
      supabaseClient: ref.watch(supabaseClientProvider),
      currentUser: ref.watch(currentUserProvider),
    );
