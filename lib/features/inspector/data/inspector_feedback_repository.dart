import 'package:supabase_flutter/supabase_flutter.dart';

import '../../auth/domain/app_user.dart';
import '../domain/inspector_feedback.dart';
import '../domain/inspector_module.dart';

/// `inspector_feedback` is cloud-only — see supabase_inspector_feedback.sql
/// for the table definition and RLS policies.
class InspectorFeedbackRepository {
  InspectorFeedbackRepository({
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
  })  : _supabaseClient = supabaseClient,
        _currentUser = currentUser;

  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;

  SupabaseClient _requireClient() {
    final client = _supabaseClient;
    if (client == null) {
      throw StateError('Supabase client is not available');
    }
    return client;
  }

  /// Submits feedback for [homeId] as the signed-in inspector. Returns the
  /// stored row so it can be referenced by the audit log.
  Future<InspectorFeedback> submitFeedback({
    required String homeId,
    required InspectorModule module,
    required FeedbackSeverity severity,
    required String content,
    String? childId,
    String? childName,
  }) async {
    final user = _currentUser;
    if (user == null) {
      throw StateError('No signed-in user');
    }
    final row = await _requireClient()
        .from('inspector_feedback')
        .insert({
          'home_id': homeId,
          'inspector_user_id': user.id,
          'inspector_email': user.email,
          'child_id': childId,
          'child_name': childName,
          'module': module.scopeKey,
          'severity': severity.name,
          'content': content,
        })
        .select()
        .single();
    return InspectorFeedback.fromJson(row);
  }

  /// All feedback submitted for [homeId], newest first. Manager view.
  Future<List<InspectorFeedback>> fetchFeedbackForHome(String homeId) async {
    final rows = await _requireClient()
        .from('inspector_feedback')
        .select('*')
        .eq('home_id', homeId)
        .order('created_at', ascending: false);
    return (rows as List)
        .cast<Map<String, dynamic>>()
        .map(InspectorFeedback.fromJson)
        .toList();
  }

  /// Feedback the signed-in inspector has submitted for [homeId].
  Future<List<InspectorFeedback>> fetchMyFeedback(String homeId) async {
    final user = _currentUser;
    if (user == null) return [];
    final rows = await _requireClient()
        .from('inspector_feedback')
        .select('*')
        .eq('home_id', homeId)
        .eq('inspector_user_id', user.id)
        .order('created_at', ascending: false);
    return (rows as List)
        .cast<Map<String, dynamic>>()
        .map(InspectorFeedback.fromJson)
        .toList();
  }

  /// Manager acknowledges or resolves a feedback entry.
  Future<void> updateStatus(
    String id,
    FeedbackStatus status, {
    String? resolutionNotes,
  }) async {
    final user = _currentUser;
    final update = <String, dynamic>{'status': status.name};
    if (status == FeedbackStatus.resolved) {
      update['resolved_at'] = DateTime.now().toUtc().toIso8601String();
      update['resolved_by'] = user?.id;
    }
    if (resolutionNotes != null) {
      update['resolution_notes'] = resolutionNotes;
    }
    await _requireClient().from('inspector_feedback').update(update).eq('id', id);
  }
}
