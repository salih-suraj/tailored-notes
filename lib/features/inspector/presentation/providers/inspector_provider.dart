import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/supabase_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/inspector_audit_service.dart';
import '../../data/inspector_feedback_repository.dart';
import '../../data/inspector_grants_repository.dart';
import '../../data/inspector_records_repository.dart';
import '../../domain/inspector_feedback.dart';
import '../../domain/inspector_grant.dart';
import '../../domain/inspector_module.dart';

part 'inspector_provider.g.dart';

@riverpod
InspectorGrantsRepository inspectorGrantsRepository(Ref ref) =>
    InspectorGrantsRepository(
      supabaseClient: ref.watch(supabaseClientProvider),
      currentUser: ref.watch(currentUserProvider),
    );

@riverpod
InspectorRecordsRepository inspectorRecordsRepository(Ref ref) =>
    InspectorRecordsRepository(
      supabaseClient: ref.watch(supabaseClientProvider),
    );

@riverpod
InspectorFeedbackRepository inspectorFeedbackRepository(Ref ref) =>
    InspectorFeedbackRepository(
      supabaseClient: ref.watch(supabaseClientProvider),
      currentUser: ref.watch(currentUserProvider),
    );

@riverpod
InspectorAuditService inspectorAuditService(Ref ref) => InspectorAuditService(
  supabaseClient: ref.watch(supabaseClientProvider),
  currentUser: ref.watch(currentUserProvider),
);

/// Active grants for the signed-in inspector.
@riverpod
Future<List<InspectorGrant>> myActiveGrants(Ref ref) =>
    ref.watch(inspectorGrantsRepositoryProvider).fetchMyActiveGrants();

/// A single active grant by id, for the home-access screen.
@riverpod
Future<InspectorGrant?> grantById(Ref ref, String grantId) async {
  final grants = await ref.watch(myActiveGrantsProvider.future);
  for (final grant in grants) {
    if (grant.id == grantId) return grant;
  }
  return null;
}

/// All grants (active + expired) for [homeId]. Manager view.
@riverpod
Future<List<InspectorGrant>> grantsForHome(Ref ref, String homeId) =>
    ref.watch(inspectorGrantsRepositoryProvider).fetchGrantsForHome(homeId);

/// Inspector accounts matching [query], for the grant-creation form.
@riverpod
Future<List<InspectorAccount>> inspectorSearch(Ref ref, String query) =>
    ref.watch(inspectorGrantsRepositoryProvider).searchInspectors(query);

/// Inspector accounts this home has created. Manager "Inspectors" tab.
@riverpod
Future<List<InspectorAccount>> inspectorAccountsForHome(
  Ref ref,
  String homeId,
) =>
    ref.watch(inspectorGrantsRepositoryProvider).fetchInspectorAccounts(homeId);

/// Children belonging to a granted home.
@riverpod
Future<List<Map<String, dynamic>>> inspectorChildren(Ref ref, String homeId) =>
    ref.watch(inspectorRecordsRepositoryProvider).fetchChildren(homeId);

/// Records for [module] in [homeId], optionally narrowed to [childId].
@riverpod
Future<List<Map<String, dynamic>>> inspectorRecords(
  Ref ref,
  String homeId,
  InspectorModule module,
  String? childId,
) => ref
    .watch(inspectorRecordsRepositoryProvider)
    .fetchRecords(module: module, homeId: homeId, childId: childId);

/// All feedback submitted for [homeId]. Manager view.
@riverpod
Future<List<InspectorFeedback>> feedbackForHome(Ref ref, String homeId) =>
    ref.watch(inspectorFeedbackRepositoryProvider).fetchFeedbackForHome(homeId);
