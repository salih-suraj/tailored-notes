import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/network/supabase_client.dart';
import '../../../../core/offline/app_database.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/care_plans_repository.dart';
import '../../domain/care_plan.dart';
import '../../domain/care_plan_goal.dart';

part 'care_plans_provider.g.dart';

@riverpod
CarePlansRepository carePlansRepository(Ref ref) => CarePlansRepository(
  dao: ref.watch(appDatabaseProvider).carePlansDao,
  supabaseClient: ref.watch(supabaseClientProvider),
  currentUser: ref.watch(currentUserProvider),
  auditWriter: ref.watch(auditLogWriterProvider),
);

/// Live stream of care plans for [childId], newest first.
@riverpod
Stream<List<CarePlan>> carePlans(Ref ref, String childId) =>
    ref.watch(carePlansRepositoryProvider).watchByChild(childId);

/// Live stream of goals for [carePlanId], sorted by order then created date.
@riverpod
Stream<List<CarePlanGoal>> carePlanGoals(Ref ref, String carePlanId) =>
    ref.watch(carePlansRepositoryProvider).watchGoals(carePlanId);
