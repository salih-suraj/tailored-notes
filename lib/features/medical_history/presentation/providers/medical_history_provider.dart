import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/network/supabase_client.dart';
import '../../../../core/offline/app_database.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/medical_history_repository.dart';
import '../../domain/healthcare_contact.dart';
import '../../domain/medical_profile.dart';

part 'medical_history_provider.g.dart';

@riverpod
MedicalHistoryRepository medicalHistoryRepository(Ref ref) =>
    MedicalHistoryRepository(
      dao: ref.watch(appDatabaseProvider).medicalHistoryDao,
      supabaseClient: ref.watch(supabaseClientProvider),
      currentUser: ref.watch(currentUserProvider),
      auditWriter: ref.watch(auditLogWriterProvider),
    );

/// Live stream of the medical profile for [childId]. Null if not yet created.
@riverpod
Stream<MedicalProfile?> medicalProfile(Ref ref, String childId) =>
    ref.watch(medicalHistoryRepositoryProvider).watchProfile(childId);

/// Live stream of healthcare contacts for [childId].
@riverpod
Stream<List<HealthcareContact>> healthcareContacts(Ref ref, String childId) =>
    ref.watch(medicalHistoryRepositoryProvider).watchContacts(childId);
