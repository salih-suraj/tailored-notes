import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/dev_mode.dart';
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
Stream<MedicalProfile?> medicalProfile(Ref ref, String childId) {
  // Dev mode: seed one child with allergies + conditions so the profile's
  // safety banners are visible without a backend. Never runs in production.
  if (kDevMode) return Stream.value(_devMedicalProfile(childId));
  return ref.watch(medicalHistoryRepositoryProvider).watchProfile(childId);
}

MedicalProfile? _devMedicalProfile(String childId) {
  if (childId != 'child-001') return null;
  final now = DateTime.now();
  return MedicalProfile(
    id: 'dev-med-001',
    homeId: 'dev-home-001',
    childId: childId,
    allergies:
        'Peanuts & tree nuts — anaphylaxis risk. EpiPen in med cabinet '
        '(kitchen) + day bag.',
    conditions:
        'Epilepsy — buccal midazolam (care plan §4). Time seizures, call '
        '999 if longer than 5 minutes.',
    createdAt: now,
    updatedAt: now,
  );
}

/// Live stream of healthcare contacts for [childId].
@riverpod
Stream<List<HealthcareContact>> healthcareContacts(Ref ref, String childId) =>
    ref.watch(medicalHistoryRepositoryProvider).watchContacts(childId);
