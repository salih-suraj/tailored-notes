import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/network/supabase_client.dart';
import '../../../../core/offline/app_database.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/daily_notes_repository.dart';
import '../../domain/daily_note.dart';

part 'daily_notes_provider.g.dart';

/// Provides a [DailyNotesRepository] wired to the current DAO, client, user, and audit writer.
@riverpod
DailyNotesRepository dailyNotesRepository(Ref ref) => DailyNotesRepository(
      dao: ref.watch(appDatabaseProvider).dailyNotesDao,
      supabaseClient: ref.watch(supabaseClientProvider),
      currentUser: ref.watch(currentUserProvider),
      auditWriter: ref.watch(auditLogWriterProvider),
    );

/// Live stream of notes for [childId].
@riverpod
Stream<List<DailyNote>> dailyNotes(Ref ref, String childId) =>
    ref.watch(dailyNotesRepositoryProvider).watchByChild(childId);
