import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/network/supabase_client.dart';
import '../../../../core/offline/app_database.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/food_entries_repository.dart';
import '../../domain/food_entry.dart';

part 'food_diary_provider.g.dart';

@riverpod
FoodEntriesRepository foodEntriesRepository(Ref ref) => FoodEntriesRepository(
  dao: ref.watch(appDatabaseProvider).foodEntriesDao,
  supabaseClient: ref.watch(supabaseClientProvider),
  currentUser: ref.watch(currentUserProvider),
  auditWriter: ref.watch(auditLogWriterProvider),
);

/// Live stream of food entries for [childId], newest first.
@riverpod
Stream<List<FoodEntry>> foodEntries(Ref ref, String childId) =>
    ref.watch(foodEntriesRepositoryProvider).watchByChild(childId);
