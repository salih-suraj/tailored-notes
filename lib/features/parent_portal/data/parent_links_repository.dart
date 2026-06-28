import 'package:supabase_flutter/supabase_flutter.dart';

import '../../auth/domain/app_user.dart';
import '../domain/parent_link.dart';

/// A minimal parent/guardian account, returned when a manager searches for a
/// parent to link to a child.
class ParentAccount {
  const ParentAccount({required this.id, required this.email});

  final String id;
  final String email;
}

/// `parent_links` is cloud-only (not in local Drift) — every method here
/// talks to Supabase directly. RLS restricts parents to their own links and
/// managers to links for their own home (see supabase_parent_portal.sql).
class ParentLinksRepository {
  ParentLinksRepository({
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

  /// Active links for the signed-in parent, with the child's name/photo
  /// embedded (readable via the parents_read_linked_children policy).
  Future<List<ParentLink>> fetchMyActiveLinks() async {
    final user = _currentUser;
    if (user == null) return [];
    final client = _requireClient();
    final rows = await client
        .from('parent_links')
        .select('*, children(name, photo_url)')
        .eq('parent_user_id', user.id)
        .filter('revoked_at', 'is', null)
        .order('created_at', ascending: true);
    return (rows as List)
        .map((r) => ParentLink.fromJson(r as Map<String, dynamic>))
        .toList();
  }

  /// All links (active and revoked) for [homeId], newest first. Manager view.
  /// Parent emails come from `user_profiles` in a follow-up query, same
  /// pattern as InspectorGrantsRepository.fetchGrantsForHome.
  Future<List<ParentLink>> fetchLinksForHome(String homeId) async {
    final client = _requireClient();
    final rows = await client
        .from('parent_links')
        .select('*, children(name, photo_url)')
        .eq('home_id', homeId)
        .order('created_at', ascending: false);
    final links = (rows as List).cast<Map<String, dynamic>>();
    if (links.isEmpty) return [];

    final parentIds = links
        .map((l) => l['parent_user_id'] as String)
        .toSet()
        .toList();
    final emailById = <String, String>{};
    try {
      final profiles = await client
          .from('user_profiles')
          .select('id, email')
          .inFilter('id', parentIds);
      for (final p in (profiles as List).cast<Map<String, dynamic>>()) {
        emailById[p['id'] as String] = p['email'] as String;
      }
    } catch (_) {
      // user_profiles lookup is best-effort for display only.
    }

    return links
        .map(
          (l) => ParentLink.fromJson({
            ...l,
            'users': {'email': emailById[l['parent_user_id']]},
          }),
        )
        .toList();
  }

  /// Creates a parent/guardian account in the manager's home, separate from
  /// linking them to a child. Goes through the `manage-staff` Edge Function
  /// (service-role: creates the auth user + user_profiles row, forces the home
  /// from the manager's JWT, and stamps must_change_password). Once created the
  /// parent is findable via [searchParents] for the link form.
  Future<void> createParentAccount({
    required String email,
    required String password,
    required String displayName,
  }) async {
    final client = _requireClient();
    try {
      await client.functions.invoke(
        'manage-staff',
        body: {
          'action': 'create',
          'email': email,
          'password': password,
          'displayName': displayName,
          'role': 'parent_guardian',
        },
      );
    } on FunctionException catch (e) {
      final details = e.details;
      final message = details is Map ? details['error'] as String? : null;
      throw StateError(message ?? 'Could not create the parent account.');
    }
  }

  /// Searches parent/guardian accounts by email for the link-creation form.
  Future<List<ParentAccount>> searchParents(String query) async {
    if (query.trim().isEmpty) return [];
    final client = _requireClient();
    final rows = await client
        .from('user_profiles')
        .select('id, email')
        .eq('role', 'parent_guardian')
        .ilike('email', '%$query%')
        .limit(10);
    return (rows as List)
        .cast<Map<String, dynamic>>()
        .map(
          (r) =>
              ParentAccount(id: r['id'] as String, email: r['email'] as String),
        )
        .toList();
  }

  /// Links [parentUserId] to [childId] in [homeId].
  Future<void> createLink({
    required String parentUserId,
    required String childId,
    required String homeId,
    required bool canViewPhotos,
  }) async {
    final client = _requireClient();
    final user = _currentUser;
    await client.from('parent_links').insert({
      'parent_user_id': parentUserId,
      'child_id': childId,
      'home_id': homeId,
      'can_view_photos': canViewPhotos,
      'granted_by': user?.id,
    });
  }

  /// Revokes a link immediately (keeps the row for audit history).
  Future<void> revokeLink(String id) async {
    final client = _requireClient();
    await client
        .from('parent_links')
        .update({'revoked_at': DateTime.now().toUtc().toIso8601String()})
        .eq('id', id);
  }
}
