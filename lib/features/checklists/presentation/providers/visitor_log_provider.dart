import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/network/supabase_client.dart';
import '../../../../core/offline/app_database.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/visitor_log_repository.dart';
import '../../domain/visitor_log_entry.dart';

part 'visitor_log_provider.g.dart';

@riverpod
VisitorLogRepository visitorLogRepository(Ref ref) => VisitorLogRepository(
      dao: ref.watch(appDatabaseProvider).visitorLogDao,
      supabaseClient: ref.watch(supabaseClientProvider),
      currentUser: ref.watch(currentUserProvider),
      auditWriter: ref.watch(auditLogWriterProvider),
    );

/// Live stream of today's visitor log entries for the home.
@riverpod
Stream<List<VisitorLogEntry>> visitorLogToday(Ref ref) =>
    ref.watch(visitorLogRepositoryProvider).watchToday();
