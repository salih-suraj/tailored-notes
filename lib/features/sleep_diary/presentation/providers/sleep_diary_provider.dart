import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/network/supabase_client.dart';
import '../../../../core/offline/app_database.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/sleep_entries_repository.dart';
import '../../domain/sleep_entry.dart';

part 'sleep_diary_provider.g.dart';

@riverpod
SleepEntriesRepository sleepEntriesRepository(Ref ref) =>
    SleepEntriesRepository(
      dao: ref.watch(appDatabaseProvider).sleepEntriesDao,
      supabaseClient: ref.watch(supabaseClientProvider),
      currentUser: ref.watch(currentUserProvider),
      auditWriter: ref.watch(auditLogWriterProvider),
    );

/// Live stream of sleep entries for [childId], newest first.
@riverpod
Stream<List<SleepEntry>> sleepEntries(Ref ref, String childId) =>
    ref.watch(sleepEntriesRepositoryProvider).watchByChild(childId);
