import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/network/supabase_client.dart';
import '../../../../core/offline/app_database.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/activity_entries_repository.dart';
import '../../domain/activity_entry.dart';

part 'activities_provider.g.dart';

@riverpod
ActivityEntriesRepository activityEntriesRepository(Ref ref) =>
    ActivityEntriesRepository(
      dao: ref.watch(appDatabaseProvider).activityEntriesDao,
      supabaseClient: ref.watch(supabaseClientProvider),
      currentUser: ref.watch(currentUserProvider),
      auditWriter: ref.watch(auditLogWriterProvider),
    );

/// Live stream of activity entries for [childId], newest first.
@riverpod
Stream<List<ActivityEntry>> activityEntries(Ref ref, String childId) =>
    ref.watch(activityEntriesRepositoryProvider).watchByChild(childId);
