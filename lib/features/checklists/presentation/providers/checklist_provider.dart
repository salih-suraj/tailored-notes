import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/network/supabase_client.dart';
import '../../../../core/offline/app_database.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/checklist_items_repository.dart';
import '../../domain/checklist_item.dart';

part 'checklist_provider.g.dart';

@riverpod
ChecklistItemsRepository checklistItemsRepository(Ref ref) =>
    ChecklistItemsRepository(
      dao: ref.watch(appDatabaseProvider).checklistItemsDao,
      supabaseClient: ref.watch(supabaseClientProvider),
      currentUser: ref.watch(currentUserProvider),
      auditWriter: ref.watch(auditLogWriterProvider),
    );

/// Live stream of bedroom cleaning tasks for [childId] on today's current shift.
@riverpod
Stream<List<ChecklistItem>> roomChecklist(Ref ref, String childId) =>
    ref.watch(checklistItemsRepositoryProvider).watchRoomItems(childId);

/// Live stream of communal cleaning tasks for the home on today's current shift.
@riverpod
Stream<List<ChecklistItem>> communalChecklist(Ref ref) =>
    ref.watch(checklistItemsRepositoryProvider).watchCommunalItems();
