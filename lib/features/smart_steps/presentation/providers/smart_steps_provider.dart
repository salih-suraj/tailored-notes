import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/network/supabase_client.dart';
import '../../../../core/offline/app_database.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/smart_steps_repository.dart';
import '../../domain/smart_step.dart';
import '../../domain/step_progress.dart';

part 'smart_steps_provider.g.dart';

@riverpod
SmartStepsRepository smartStepsRepository(Ref ref) => SmartStepsRepository(
      dao: ref.watch(appDatabaseProvider).smartStepsDao,
      supabaseClient: ref.watch(supabaseClientProvider),
      currentUser: ref.watch(currentUserProvider),
      auditWriter: ref.watch(auditLogWriterProvider),
    );

/// Live stream of Smart Steps for [childId].
@riverpod
Stream<List<SmartStep>> smartSteps(Ref ref, String childId) =>
    ref.watch(smartStepsRepositoryProvider).watchByChild(childId);

/// Live stream of progress notes for [stepId].
@riverpod
Stream<List<StepProgress>> stepProgressNotes(Ref ref, String stepId) =>
    ref.watch(smartStepsRepositoryProvider).watchProgress(stepId);
