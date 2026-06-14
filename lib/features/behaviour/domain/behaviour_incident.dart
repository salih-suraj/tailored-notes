import 'package:freezed_annotation/freezed_annotation.dart';

import '../../daily_notes/domain/daily_note.dart';

part 'behaviour_incident.freezed.dart';
part 'behaviour_incident.g.dart';

enum BehaviourSeverity {
  @JsonValue('mild')
  mild,
  @JsonValue('moderate')
  moderate,
  @JsonValue('severe')
  severe;

  String get displayName => switch (this) {
    BehaviourSeverity.mild => 'Mild',
    BehaviourSeverity.moderate => 'Moderate',
    BehaviourSeverity.severe => 'Severe',
  };
}

/// A single behavioural incident recorded using the ABC model:
/// Antecedent → Behaviour → Consequence.
/// Physical intervention and injury flags are safeguarding-critical.
@freezed
class BehaviourIncident with _$BehaviourIncident {
  const factory BehaviourIncident({
    required String id,
    required String homeId,
    required String childId,
    required ShiftType shift,
    required DateTime occurredAt,
    required BehaviourSeverity severity,

    /// What happened immediately before — triggers, environment, context.
    required String antecedent,

    /// Description of the behaviour itself.
    required String behaviour,

    /// Staff response and what happened as a result.
    required String consequence,
    int? durationMinutes,
    String? location,
    @Default(false) bool physicalIntervention,
    String? interventionDetails,
    @Default(false) bool injuryOccurred,
    String? injuryDetails,
    String? notes,
    required String recordedById,
    required String recordedByName,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _BehaviourIncident;

  factory BehaviourIncident.fromJson(Map<String, dynamic> json) =>
      _$BehaviourIncidentFromJson(json);
}
