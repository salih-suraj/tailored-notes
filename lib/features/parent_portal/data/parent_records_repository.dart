import 'package:supabase_flutter/supabase_flutter.dart';

/// Read-only cloud access for the Parent Portal.
///
/// Parents don't have local Drift data (Drift is scoped to staff devices),
/// so every read goes straight to Supabase. RLS limits parents to
/// activity_entries rows for children they hold an active link to
/// (parents_read_activities / parent_has_link — see
/// supabase_parent_portal.sql).
///
/// Rows come back as raw `Map<String, dynamic>` with Supabase's snake_case
/// keys — the presentation layer formats fields directly, same pattern as
/// InspectorRecordsRepository.
class ParentRecordsRepository {
  ParentRecordsRepository({required SupabaseClient? supabaseClient})
      : _supabaseClient = supabaseClient;

  final SupabaseClient? _supabaseClient;

  static const _recordLimit = 100;

  SupabaseClient _requireClient() {
    final client = _supabaseClient;
    if (client == null) {
      throw StateError('Supabase client is not available');
    }
    return client;
  }

  /// Activities, rewards, and achievements for [childId], newest first.
  Future<List<Map<String, dynamic>>> fetchActivities(String childId) async {
    final rows = await _requireClient()
        .from('activity_entries')
        .select('*')
        .eq('child_id', childId)
        .filter('deleted_at', 'is', null)
        .order('date', ascending: false)
        .order('created_at', ascending: false)
        .limit(_recordLimit);
    return (rows as List).cast<Map<String, dynamic>>();
  }

  /// Children belonging to [homeId] — used by the manager's link form.
  /// (Managers read these via the home-member RLS policy, not parent RLS.)
  Future<List<Map<String, dynamic>>> fetchChildren(String homeId) async {
    final rows = await _requireClient()
        .from('children')
        .select('id, name')
        .eq('home_id', homeId)
        .filter('deleted_at', 'is', null)
        .order('name');
    return (rows as List).cast<Map<String, dynamic>>();
  }
}
