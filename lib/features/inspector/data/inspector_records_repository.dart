import 'package:supabase_flutter/supabase_flutter.dart';

import '../domain/inspector_module.dart';

/// Read-only, cross-home record access for the Inspector Portal.
///
/// Inspectors don't have this data in their local Drift database (Drift is
/// scoped to the device's own home), so every read goes straight to Supabase.
/// RLS on each table is expected to gate access via
/// `inspector_has_grant(home_id, scope_key)` (see B5 / supabase_inspector_feedback.sql).
///
/// Records are returned as raw `Map<String, dynamic>` with Supabase's native
/// snake_case keys — the presentation layer formats each module's fields
/// directly rather than mapping through the full domain models (which are
/// wired to local Drift + camelCase JSON).
class InspectorRecordsRepository {
  InspectorRecordsRepository({required SupabaseClient? supabaseClient})
      : _supabaseClient = supabaseClient;

  final SupabaseClient? _supabaseClient;

  static const _recordLimit = 50;

  SupabaseClient _requireClient() {
    final client = _supabaseClient;
    if (client == null) {
      throw StateError('Supabase client is not available');
    }
    return client;
  }

  /// Children belonging to [homeId], for the inspector to pick from.
  Future<List<Map<String, dynamic>>> fetchChildren(String homeId) async {
    final rows = await _requireClient()
        .from('children')
        .select('*')
        .eq('home_id', homeId)
        .filter('deleted_at', 'is', null)
        .order('name');
    return (rows as List).cast<Map<String, dynamic>>();
  }

  /// Records for [module] within [homeId], optionally narrowed to [childId].
  /// Each map carries a `_kind` key for modules that combine more than one
  /// underlying table (medication, medical history) so the viewer can pick
  /// the right card layout.
  Future<List<Map<String, dynamic>>> fetchRecords({
    required InspectorModule module,
    required String homeId,
    String? childId,
  }) async {
    switch (module) {
      case InspectorModule.dailyNotes:
        return _fetchTable('daily_notes', homeId, childId);
      case InspectorModule.carePlans:
        return _fetchTable(
          'care_plans',
          homeId,
          childId,
          embed: 'care_plan_goals(*)',
        );
      case InspectorModule.incidents:
        return _fetchTable('incident_reports', homeId, childId);
      case InspectorModule.behaviour:
        return _fetchTable('behaviour_incidents', homeId, childId);
      case InspectorModule.medication:
        final prescribed = await _fetchTable(
          'prescribed_medications',
          homeId,
          childId,
        );
        // med_administrations has no deleted_at column (append-only record).
        final administrations = await _fetchTable(
          'med_administrations',
          homeId,
          childId,
          limit: 20,
          hasDeletedAt: false,
        );
        return [
          for (final m in prescribed) {...m, '_kind': 'prescribed'},
          for (final m in administrations) {...m, '_kind': 'administration'},
        ];
      case InspectorModule.medicalHistory:
        // medical_profiles has no deleted_at column (one row per child).
        final profiles = await _fetchTable(
          'medical_profiles',
          homeId,
          childId,
          limit: 1,
          hasDeletedAt: false,
        );
        final contacts = await _fetchTable(
          'healthcare_contacts',
          homeId,
          childId,
        );
        return [
          for (final m in profiles) {...m, '_kind': 'profile'},
          for (final m in contacts) {...m, '_kind': 'contact'},
        ];
    }
  }

  Future<List<Map<String, dynamic>>> _fetchTable(
    String table,
    String homeId,
    String? childId, {
    String? embed,
    int limit = _recordLimit,
    bool hasDeletedAt = true,
  }) async {
    final select = embed == null ? '*' : '*, $embed';
    PostgrestFilterBuilder query = _requireClient()
        .from(table)
        .select(select)
        .eq('home_id', homeId);
    if (hasDeletedAt) {
      query = query.filter('deleted_at', 'is', null);
    }
    if (childId != null) {
      query = query.eq('child_id', childId);
    }
    final rows = await query.order('created_at', ascending: false).limit(limit);
    return (rows as List).cast<Map<String, dynamic>>();
  }
}
