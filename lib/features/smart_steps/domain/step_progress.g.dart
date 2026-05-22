// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StepProgressImpl _$$StepProgressImplFromJson(Map<String, dynamic> json) =>
    _$StepProgressImpl(
      id: json['id'] as String,
      homeId: json['homeId'] as String,
      childId: json['childId'] as String,
      stepId: json['stepId'] as String,
      date: json['date'] as String,
      shift: $enumDecode(_$ShiftTypeEnumMap, json['shift']),
      outcome: $enumDecode(_$ProgressOutcomeEnumMap, json['outcome']),
      note: json['note'] as String,
      recordedById: json['recordedById'] as String,
      recordedByName: json['recordedByName'] as String,
      createdById: json['createdById'] as String?,
      updatedById: json['updatedById'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$$StepProgressImplToJson(_$StepProgressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'childId': instance.childId,
      'stepId': instance.stepId,
      'date': instance.date,
      'shift': _$ShiftTypeEnumMap[instance.shift]!,
      'outcome': _$ProgressOutcomeEnumMap[instance.outcome]!,
      'note': instance.note,
      'recordedById': instance.recordedById,
      'recordedByName': instance.recordedByName,
      'createdById': instance.createdById,
      'updatedById': instance.updatedById,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isSynced': instance.isSynced,
    };

const _$ShiftTypeEnumMap = {
  ShiftType.morning: 'morning',
  ShiftType.afternoon: 'afternoon',
  ShiftType.night: 'night',
};

const _$ProgressOutcomeEnumMap = {
  ProgressOutcome.attempted: 'attempted',
  ProgressOutcome.progressed: 'progressed',
  ProgressOutcome.achieved: 'achieved',
};
