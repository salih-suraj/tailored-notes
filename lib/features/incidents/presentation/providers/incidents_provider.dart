import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/network/supabase_client.dart';
import '../../../../core/offline/app_database.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/incident_reports_repository.dart';
import '../../domain/incident_report.dart';

part 'incidents_provider.g.dart';

@riverpod
IncidentReportsRepository incidentReportsRepository(Ref ref) =>
    IncidentReportsRepository(
      dao: ref.watch(appDatabaseProvider).incidentReportsDao,
      supabaseClient: ref.watch(supabaseClientProvider),
      currentUser: ref.watch(currentUserProvider),
      auditWriter: ref.watch(auditLogWriterProvider),
    );

@riverpod
Stream<List<IncidentReport>> incidentReports(Ref ref, String childId) =>
    ref.watch(incidentReportsRepositoryProvider).watchByChild(childId);
