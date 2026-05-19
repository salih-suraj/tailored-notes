import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/network/supabase_client.dart';
import '../../../../core/offline/app_database.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/bath_temp_repository.dart';
import '../../domain/bath_temp_record.dart';

part 'bath_temp_provider.g.dart';

@riverpod
BathTempRepository bathTempRepository(Ref ref) => BathTempRepository(
      dao: ref.watch(appDatabaseProvider).bathTempRecordsDao,
      supabaseClient: ref.watch(supabaseClientProvider),
      currentUser: ref.watch(currentUserProvider),
      auditWriter: ref.watch(auditLogWriterProvider),
    );

/// Live stream of today's bath temp records for [childId].
@riverpod
Stream<List<BathTempRecord>> bathTempToday(Ref ref, String childId) =>
    ref.watch(bathTempRepositoryProvider).watchToday(childId);
