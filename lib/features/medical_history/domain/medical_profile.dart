import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_profile.freezed.dart';
part 'medical_profile.g.dart';

/// Core health information for a child.
/// Created once, updated as information changes. One per child.
@freezed
class MedicalProfile with _$MedicalProfile {
  const factory MedicalProfile({
    required String id,
    required String homeId,
    required String childId,
    String? nhsNumber,
    String? bloodType,

    /// Free-text list of diagnoses and conditions (e.g. "ASD, ADHD, Epilepsy")
    String? conditions,

    /// Free-text allergies and adverse reactions — treated as critical information
    String? allergies,
    String? immunisationNotes,
    String? notes,
    String? createdById,
    String? updatedById,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _MedicalProfile;

  factory MedicalProfile.fromJson(Map<String, dynamic> json) =>
      _$MedicalProfileFromJson(json);
}
