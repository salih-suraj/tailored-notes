import 'package:supabase_flutter/supabase_flutter.dart';

import '../../auth/domain/user_role.dart';
import '../domain/staff_member.dart';

/// Staff accounts are stored as `user_profiles` rows (cloud-only, no Drift).
///
/// Reads go straight to Supabase under the manager's RLS (the
/// `managers_read_home_profiles` JWT-claim policy). Writes — creating an
/// account or enabling/disabling one — need admin privileges, so they go
/// through the `manage-staff` Edge Function, which holds the service-role key
/// server-side and re-checks the manager role + AAL2 + home.
class StaffRepository {
  StaffRepository({required SupabaseClient? supabaseClient})
    : _supabaseClient = supabaseClient;

  final SupabaseClient? _supabaseClient;

  /// Internal staff roles shown on the Staff screen. Inspectors and parents
  /// are external (provisioned via access grants) and never listed here.
  static const _staffRoles = ['support_worker', 'team_leader', 'manager'];

  SupabaseClient _requireClient() {
    final client = _supabaseClient;
    if (client == null) {
      throw StateError('No connection — sign in and try again.');
    }
    return client;
  }

  /// All staff in [homeId], ordered by email (stable, and `user_profiles`
  /// always has an email — it mirrors the auth user).
  Future<List<StaffMember>> fetchStaff(String homeId) async {
    final client = _requireClient();
    final rows = await client
        .from('user_profiles')
        .select('id, email, role, display_name, is_active')
        .eq('home_id', homeId)
        .inFilter('role', _staffRoles)
        .order('email', ascending: true);
    return (rows as List)
        .cast<Map<String, dynamic>>()
        .map(StaffMember.fromJson)
        .toList();
  }

  /// Creates a staff account in the manager's home (the function forces the
  /// home from the JWT — [role] and the rest come from the form).
  Future<void> createStaff({
    required String email,
    required String password,
    required String displayName,
    required UserRole role,
  }) async {
    await _invoke({
      'action': 'create',
      'email': email,
      'password': password,
      'displayName': displayName,
      'role': role.toJson(),
    });
  }

  /// Enables or disables a staff account (auth ban + is_active flag).
  Future<void> setActive({required String userId, required bool active}) async {
    await _invoke({'action': 'setActive', 'userId': userId, 'active': active});
  }

  Future<void> _invoke(Map<String, dynamic> body) async {
    final client = _requireClient();
    try {
      await client.functions.invoke('manage-staff', body: body);
    } on FunctionException catch (e) {
      final details = e.details;
      final message = details is Map ? details['error'] as String? : null;
      throw StateError(message ?? 'Staff action failed (${e.status}).');
    }
  }
}
