import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/network/supabase_client.dart';
import '../../../../core/offline/app_database.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/medication_repository.dart';
import '../../domain/med_administration.dart';
import '../../domain/prescribed_med.dart';

part 'medication_provider.g.dart';

@riverpod
MedicationRepository medicationRepository(Ref ref) => MedicationRepository(
  dao: ref.watch(appDatabaseProvider).medicationDao,
  supabaseClient: ref.watch(supabaseClientProvider),
  currentUser: ref.watch(currentUserProvider),
  auditWriter: ref.watch(auditLogWriterProvider),
);

/// Active prescribed meds for [childId].
@riverpod
Stream<List<PrescribedMed>> prescribedMeds(Ref ref, String childId) =>
    ref.watch(medicationRepositoryProvider).watchActiveMeds(childId);

/// Today's administration records for [childId].
@riverpod
Stream<List<MedAdministration>> todayAdmins(Ref ref, String childId) =>
    ref.watch(medicationRepositoryProvider).watchTodayAdmins(childId);
