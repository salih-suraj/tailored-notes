import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/activities/presentation/providers/activities_provider.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/behaviour/presentation/providers/behaviour_provider.dart';
import '../../features/care_plans/presentation/providers/care_plans_provider.dart';
import '../../features/checklists/presentation/providers/bath_temp_provider.dart';
import '../../features/checklists/presentation/providers/checklist_provider.dart';
import '../../features/checklists/presentation/providers/visitor_log_provider.dart';
import '../../features/children/presentation/providers/children_provider.dart';
import '../../features/daily_notes/presentation/providers/daily_notes_provider.dart';
import '../../features/food_diary/presentation/providers/food_diary_provider.dart';
import '../../features/incidents/presentation/providers/incidents_provider.dart';
import '../../features/medical_history/presentation/providers/medical_history_provider.dart';
import '../../features/medication/presentation/providers/medication_provider.dart';
import '../../features/sleep_diary/presentation/providers/sleep_diary_provider.dart';
import '../../features/smart_steps/presentation/providers/smart_steps_provider.dart';
import '../audit/audit_log_writer.dart';
import 'sync_service.dart';

part 'sync_provider.g.dart';

/// The Q2 sync engine, registered over every care-record repository plus
/// the audit log. Starts sweeping when a user is signed in (RLS requires
/// an authenticated session) and stops on sign-out. Rebuilds on auth
/// change, so each login gets a fresh sweep — which is also what backfills
/// rows written offline or before the backend fixes of 2026-06-12.
@Riverpod(keepAlive: true)
SyncService syncService(Ref ref) {
  final service = SyncService(targets: [
    ref.watch(childrenRepositoryProvider),
    ref.watch(dailyNotesRepositoryProvider),
    ref.watch(checklistItemsRepositoryProvider),
    ref.watch(bathTempRepositoryProvider),
    ref.watch(visitorLogRepositoryProvider),
    ref.watch(carePlansRepositoryProvider),
    ref.watch(medicationRepositoryProvider),
    ref.watch(medicalHistoryRepositoryProvider),
    ref.watch(behaviourRepositoryProvider),
    ref.watch(sleepEntriesRepositoryProvider),
    ref.watch(foodEntriesRepositoryProvider),
    ref.watch(activityEntriesRepositoryProvider),
    ref.watch(smartStepsRepositoryProvider),
    ref.watch(incidentReportsRepositoryProvider),
    ref.watch(auditLogWriterProvider),
  ]);
  if (ref.watch(isAuthenticatedProvider)) {
    service.start();
  }
  ref.onDispose(service.stop);
  return service;
}
