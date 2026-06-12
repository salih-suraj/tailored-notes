import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/supabase_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/parent_links_repository.dart';
import '../../data/parent_records_repository.dart';
import '../../domain/parent_link.dart';

part 'parent_portal_provider.g.dart';

@riverpod
ParentLinksRepository parentLinksRepository(Ref ref) => ParentLinksRepository(
      supabaseClient: ref.watch(supabaseClientProvider),
      currentUser: ref.watch(currentUserProvider),
    );

@riverpod
ParentRecordsRepository parentRecordsRepository(Ref ref) =>
    ParentRecordsRepository(
      supabaseClient: ref.watch(supabaseClientProvider),
    );

/// Active child links for the signed-in parent.
@riverpod
Future<List<ParentLink>> myParentLinks(Ref ref) =>
    ref.watch(parentLinksRepositoryProvider).fetchMyActiveLinks();

/// A single active link by id, for the child feed screen.
@riverpod
Future<ParentLink?> parentLinkById(Ref ref, String linkId) async {
  final links = await ref.watch(myParentLinksProvider.future);
  for (final link in links) {
    if (link.id == linkId) return link;
  }
  return null;
}

/// All links (active + revoked) for [homeId]. Manager view.
@riverpod
Future<List<ParentLink>> parentLinksForHome(Ref ref, String homeId) =>
    ref.watch(parentLinksRepositoryProvider).fetchLinksForHome(homeId);

/// Parent accounts matching [query], for the link-creation form.
@riverpod
Future<List<ParentAccount>> parentSearch(Ref ref, String query) =>
    ref.watch(parentLinksRepositoryProvider).searchParents(query);

/// Activity/achievement records for a linked child.
@riverpod
Future<List<Map<String, dynamic>>> parentChildActivities(
  Ref ref,
  String childId,
) =>
    ref.watch(parentRecordsRepositoryProvider).fetchActivities(childId);

/// Children of [homeId] for the manager's link form.
@riverpod
Future<List<Map<String, dynamic>>> parentFormChildren(Ref ref, String homeId) =>
    ref.watch(parentRecordsRepositoryProvider).fetchChildren(homeId);
