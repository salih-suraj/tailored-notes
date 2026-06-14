import 'package:freezed_annotation/freezed_annotation.dart';

import '../../daily_notes/domain/daily_note.dart';

part 'med_administration.freezed.dart';
part 'med_administration.g.dart';

enum AdminOutcome {
  @JsonValue('administered')
  administered,
  @JsonValue('refused')
  refused,
  @JsonValue('held')
  held;

  String get displayName => switch (this) {
    AdminOutcome.administered => 'Administered',
    AdminOutcome.refused => 'Refused by child',
    AdminOutcome.held => 'Held / Withheld',
  };
}

/// A single medication administration event (or refusal/hold).
/// Written for every outcome — administered, refused, or held.
@freezed
class MedAdministration with _$MedAdministration {
  const factory MedAdministration({
    required String id,
    required String homeId,
    required String childId,
    required String prescribedMedId,
    required String medicationName, // denormalised for audit readability
    required String dose,
    required AdminOutcome outcome,
    required ShiftType shift,
    required DateTime administeredAt,
    required String administeredById,
    required String administeredByName,
    String? reason, // required for refused/held and PRN; optional otherwise
    String? notes,
    String? createdById,
    String? updatedById,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _MedAdministration;

  factory MedAdministration.fromJson(Map<String, dynamic> json) =>
      _$MedAdministrationFromJson(json);
}
