import 'package:freezed_annotation/freezed_annotation.dart';

part 'healthcare_contact.freezed.dart';
part 'healthcare_contact.g.dart';

enum ContactType {
  @JsonValue('gp') gp,
  @JsonValue('specialist') specialist,
  @JsonValue('camhs') camhs,
  @JsonValue('dentist') dentist,
  @JsonValue('optician') optician,
  @JsonValue('physiotherapist') physiotherapist,
  @JsonValue('speech_therapy') speechTherapy,
  @JsonValue('other') other;

  String get displayName => switch (this) {
        ContactType.gp => 'GP / Doctor',
        ContactType.specialist => 'Specialist',
        ContactType.camhs => 'CAMHS',
        ContactType.dentist => 'Dentist',
        ContactType.optician => 'Optician',
        ContactType.physiotherapist => 'Physiotherapist',
        ContactType.speechTherapy => 'Speech Therapy',
        ContactType.other => 'Other',
      };
}

/// A single healthcare professional or service linked to a child.
@freezed
class HealthcareContact with _$HealthcareContact {
  const factory HealthcareContact({
    required String id,
    required String homeId,
    required String childId,
    required ContactType contactType,
    required String name,
    String? role,
    String? phone,
    String? email,
    String? address,
    String? notes,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _HealthcareContact;

  factory HealthcareContact.fromJson(Map<String, dynamic> json) =>
      _$HealthcareContactFromJson(json);
}
