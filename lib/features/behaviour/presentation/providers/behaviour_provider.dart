import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/network/supabase_client.dart';
import '../../../../core/offline/app_database.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/behaviour_incidents_repository.dart';
import '../../domain/behaviour_incident.dart';

part 'behaviour_provider.g.dart';

@riverpod
BehaviourIncidentsRepository behaviourRepository(Ref ref) =>
    BehaviourIncidentsRepository(
      dao: ref.watch(appDatabaseProvider).behaviourIncidentsDao,
      supabaseClient: ref.watch(supabaseClientProvider),
      currentUser: ref.watch(currentUserProvider),
      auditWriter: ref.watch(auditLogWriterProvider),
    );

/// Live stream of behaviour incidents for [childId], newest first.
@riverpod
Stream<List<BehaviourIncident>> behaviourIncidents(
        Ref ref, String childId) =>
    ref.watch(behaviourRepositoryProvider).watchByChild(childId);
