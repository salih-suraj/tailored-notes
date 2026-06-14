import 'package:supabase_flutter/supabase_flutter.dart';

import '../../auth/domain/app_user.dart';
import '../domain/inspector_grant.dart';

/// A minimal inspector account, returned when a manager searches for an
/// inspector to grant access to.
class InspectorAccount {
  const InspectorAccount({required this.id, required this.email});

  final String id;
  final String email;
}

/// `inspector_grants` is cloud-only (not in local Drift) — every method here
/// talks to Supabase directly. RLS (B5) restricts inspectors to their own
/// grants and managers to grants for their own home.
class InspectorGrantsRepository {
  InspectorGrantsRepository({
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
  }) : _supabaseClient = supabaseClient,
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

  /// Active grants for the signed-in inspector.
  Future<List<InspectorGrant>> fetchMyActiveGrants() async {
    final user = _currentUser;
    if (user == null) return [];
    final client = _requireClient();
    final rows = await client
        .from('inspector_grants')
        .select('*')
        .eq('inspector_user_id', user.id)
        .gt('expires_at', DateTime.now().toUtc().toIso8601String())
        .order('expires_at', ascending: true);
    return (rows as List)
        .map((r) => InspectorGrant.fromJson(r as Map<String, dynamic>))
        .toList();
  }

  /// All grants (active and expired) for [homeId], newest first.
  /// Resolves inspector emails from `user_profiles` in a single follow-up
  /// query rather than relying on a PostgREST embed/relationship name.
  Future<List<InspectorGrant>> fetchGrantsForHome(String homeId) async {
    final client = _requireClient();
    final rows = await client
        .from('inspector_grants')
        .select('*')
        .eq('home_id', homeId)
        .order('created_at', ascending: false);
    final grants = (rows as List).cast<Map<String, dynamic>>();
    if (grants.isEmpty) return [];

    final inspectorIds = grants
        .map((g) => g['inspector_user_id'] as String)
        .toSet()
        .toList();
    final emailById = <String, String>{};
    try {
      final profiles = await client
          .from('user_profiles')
          .select('id, email')
          .inFilter('id', inspectorIds);
      for (final p in (profiles as List).cast<Map<String, dynamic>>()) {
        emailById[p['id'] as String] = p['email'] as String;
      }
    } catch (_) {
      // user_profiles lookup is best-effort for display only.
    }

    return grants
        .map(
          (g) => InspectorGrant.fromJson({
            ...g,
            'users': {'email': emailById[g['inspector_user_id']]},
          }),
        )
        .toList();
  }

  /// Searches inspector accounts by email for the grant-creation form.
  Future<List<InspectorAccount>> searchInspectors(String query) async {
    if (query.trim().isEmpty) return [];
    final client = _requireClient();
    final rows = await client
        .from('user_profiles')
        .select('id, email')
        .eq('role', 'inspector')
        .ilike('email', '%$query%')
        .limit(10);
    return (rows as List)
        .cast<Map<String, dynamic>>()
        .map(
          (r) => InspectorAccount(
            id: r['id'] as String,
            email: r['email'] as String,
          ),
        )
        .toList();
  }

  /// Grants [inspectorUserId] read access to [homeId] for the given [scope]
  /// (a list of [InspectorModule.scopeKey] values), expiring at [expiresAt].
  Future<void> createGrant({
    required String inspectorUserId,
    required String homeId,
    required DateTime expiresAt,
    required List<String> scope,
  }) async {
    final client = _requireClient();
    final user = _currentUser;
    await client.from('inspector_grants').insert({
      'inspector_user_id': inspectorUserId,
      'home_id': homeId,
      'granted_by': user?.id,
      'expires_at': expiresAt.toUtc().toIso8601String(),
      // 'children' is always included: the inspectors_read_children RLS
      // policy gates the home's child list on this scope key, and every
      // module view needs the child list to be readable.
      'scope': [...scope, 'children'],
    });
  }

  /// Revokes a grant immediately by expiring it now (keeps the row for audit
  /// history rather than deleting it).
  Future<void> revokeGrant(String id) async {
    final client = _requireClient();
    await client
        .from('inspector_grants')
        .update({'expires_at': DateTime.now().toUtc().toIso8601String()})
        .eq('id', id);
  }
}
