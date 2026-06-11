import 'dart:developer' as dev;

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../auth/domain/app_user.dart';
import '../domain/inspector_feedback.dart';

/// Records inspector activity to `audit_log`.
///
/// Unlike [AuditLogWriter], this writes straight to Supabase rather than the
/// local Drift `audit_log` table: the home being viewed is a different home
/// to the inspector's own (`AppUser.homeId`), so a local write would either
/// be mis-scoped or invisible to that home's manager. Inspector activity is
/// read-only and cross-home, so there's nothing useful to keep offline.
class InspectorAuditService {
  InspectorAuditService({
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
  })  : _supabaseClient = supabaseClient,
        _currentUser = currentUser;

  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;

  /// Logs that the signed-in inspector viewed [entityTable] (and optionally
  /// a specific [recordId]) for [homeId].
  Future<void> recordView({
    required String homeId,
    required String entityTable,
    String? recordId,
  }) =>
      _write(
        homeId: homeId,
        action: 'inspector_view',
        entityTable: entityTable,
        recordId: recordId ?? homeId,
      );

  /// Logs that the signed-in inspector submitted [feedback].
  Future<void> recordFeedbackSubmitted(InspectorFeedback feedback) => _write(
        homeId: feedback.homeId,
        action: 'inspector_feedback',
        entityTable: 'inspector_feedback',
        recordId: feedback.id,
      );

  Future<void> _write({
    required String homeId,
    required String action,
    required String entityTable,
    required String recordId,
  }) async {
    final client = _supabaseClient;
    final user = _currentUser;
    if (client == null || user == null) return;
    try {
      await client.from('audit_log').insert({
        'id': const Uuid().v4(),
        'user_id': user.id,
        'user_display_name': user.displayName ?? user.email,
        'home_id': homeId,
        'action': action,
        'entity_table': entityTable,
        'record_id': recordId,
        'before': null,
        'after': null,
        'timestamp': DateTime.now().toUtc().toIso8601String(),
      });
    } catch (e, st) {
      dev.log(
        'Inspector audit log write failed for $action on $entityTable',
        error: e,
        stackTrace: st,
        name: 'InspectorAuditService',
      );
    }
  }
}
