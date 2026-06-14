import 'package:freezed_annotation/freezed_annotation.dart';

part 'incident_report.freezed.dart';
part 'incident_report.g.dart';

enum IncidentType {
  @JsonValue('behaviour')
  behaviour,
  @JsonValue('medical')
  medical,
  @JsonValue('accident')
  accident,
  @JsonValue('property_damage')
  propertyDamage,
  @JsonValue('missing_person')
  missingPerson,
  @JsonValue('safeguarding')
  safeguarding;

  String get displayName => switch (this) {
    IncidentType.behaviour => 'Behaviour',
    IncidentType.medical => 'Medical',
    IncidentType.accident => 'Accident',
    IncidentType.propertyDamage => 'Property Damage',
    IncidentType.missingPerson => 'Missing Person',
    IncidentType.safeguarding => 'Safeguarding',
  };
}

enum IncidentSeverity {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('critical')
  critical;

  String get displayName => switch (this) {
    IncidentSeverity.low => 'Low',
    IncidentSeverity.medium => 'Medium',
    IncidentSeverity.high => 'High',
    IncidentSeverity.critical => 'Critical',
  };
}

@freezed
class IncidentReport with _$IncidentReport {
  const factory IncidentReport({
    required String id,
    required String homeId,
    required String childId,
    required IncidentType incidentType,
    required IncidentSeverity severity,
    required String title,
    required DateTime occurredAt,
    String? location,
    required String description,
    required String immediateAction,
    String? injuryDetails,
    @Default(false) bool policeNotified,
    @Default(false) bool parentNotified,
    @Default(false) bool managerNotified,
    @Default(false) bool followUpRequired,
    String? followUpDetails,
    required String reportedById,
    required String reportedByName,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _IncidentReport;

  factory IncidentReport.fromJson(Map<String, dynamic> json) =>
      _$IncidentReportFromJson(json);
}
