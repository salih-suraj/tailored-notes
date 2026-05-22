// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'behaviour_incident.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BehaviourIncidentImpl _$$BehaviourIncidentImplFromJson(
  Map<String, dynamic> json,
) => _$BehaviourIncidentImpl(
  id: json['id'] as String,
  homeId: json['homeId'] as String,
  childId: json['childId'] as String,
  shift: $enumDecode(_$ShiftTypeEnumMap, json['shift']),
  occurredAt: DateTime.parse(json['occurredAt'] as String),
  severity: $enumDecode(_$BehaviourSeverityEnumMap, json['severity']),
  antecedent: json['antecedent'] as String,
  behaviour: json['behaviour'] as String,
  consequence: json['consequence'] as String,
  durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
  location: json['location'] as String?,
  physicalIntervention: json['physicalIntervention'] as bool? ?? false,
  interventionDetails: json['interventionDetails'] as String?,
  injuryOccurred: json['injuryOccurred'] as bool? ?? false,
  injuryDetails: json['injuryDetails'] as String?,
  notes: json['notes'] as String?,
  recordedById: json['recordedById'] as String,
  recordedByName: json['recordedByName'] as String,
  createdById: json['createdById'] as String?,
  updatedById: json['updatedById'] as String?,
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isSynced: json['isSynced'] as bool? ?? false,
);

Map<String, dynamic> _$$BehaviourIncidentImplToJson(
  _$BehaviourIncidentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'homeId': instance.homeId,
  'childId': instance.childId,
  'shift': _$ShiftTypeEnumMap[instance.shift]!,
  'occurredAt': instance.occurredAt.toIso8601String(),
  'severity': _$BehaviourSeverityEnumMap[instance.severity]!,
  'antecedent': instance.antecedent,
  'behaviour': instance.behaviour,
  'consequence': instance.consequence,
  'durationMinutes': instance.durationMinutes,
  'location': instance.location,
  'physicalIntervention': instance.physicalIntervention,
  'interventionDetails': instance.interventionDetails,
  'injuryOccurred': instance.injuryOccurred,
  'injuryDetails': instance.injuryDetails,
  'notes': instance.notes,
  'recordedById': instance.recordedById,
  'recordedByName': instance.recordedByName,
  'createdById': instance.createdById,
  'updatedById': instance.updatedById,
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isSynced': instance.isSynced,
};

const _$ShiftTypeEnumMap = {
  ShiftType.morning: 'morning',
  ShiftType.afternoon: 'afternoon',
  ShiftType.night: 'night',
};

const _$BehaviourSeverityEnumMap = {
  BehaviourSeverity.mild: 'mild',
  BehaviourSeverity.moderate: 'moderate',
  BehaviourSeverity.severe: 'severe',
};
