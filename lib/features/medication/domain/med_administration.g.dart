// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'med_administration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedAdministrationImpl _$$MedAdministrationImplFromJson(
  Map<String, dynamic> json,
) => _$MedAdministrationImpl(
  id: json['id'] as String,
  homeId: json['homeId'] as String,
  childId: json['childId'] as String,
  prescribedMedId: json['prescribedMedId'] as String,
  medicationName: json['medicationName'] as String,
  dose: json['dose'] as String,
  outcome: $enumDecode(_$AdminOutcomeEnumMap, json['outcome']),
  shift: $enumDecode(_$ShiftTypeEnumMap, json['shift']),
  administeredAt: DateTime.parse(json['administeredAt'] as String),
  administeredById: json['administeredById'] as String,
  administeredByName: json['administeredByName'] as String,
  reason: json['reason'] as String?,
  notes: json['notes'] as String?,
  createdById: json['createdById'] as String?,
  updatedById: json['updatedById'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isSynced: json['isSynced'] as bool? ?? false,
);

Map<String, dynamic> _$$MedAdministrationImplToJson(
  _$MedAdministrationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'homeId': instance.homeId,
  'childId': instance.childId,
  'prescribedMedId': instance.prescribedMedId,
  'medicationName': instance.medicationName,
  'dose': instance.dose,
  'outcome': _$AdminOutcomeEnumMap[instance.outcome]!,
  'shift': _$ShiftTypeEnumMap[instance.shift]!,
  'administeredAt': instance.administeredAt.toIso8601String(),
  'administeredById': instance.administeredById,
  'administeredByName': instance.administeredByName,
  'reason': instance.reason,
  'notes': instance.notes,
  'createdById': instance.createdById,
  'updatedById': instance.updatedById,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isSynced': instance.isSynced,
};

const _$AdminOutcomeEnumMap = {
  AdminOutcome.administered: 'administered',
  AdminOutcome.refused: 'refused',
  AdminOutcome.held: 'held',
};

const _$ShiftTypeEnumMap = {
  ShiftType.morning: 'morning',
  ShiftType.afternoon: 'afternoon',
  ShiftType.night: 'night',
};
