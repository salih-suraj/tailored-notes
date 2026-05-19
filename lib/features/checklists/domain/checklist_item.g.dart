// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChecklistItemImpl _$$ChecklistItemImplFromJson(Map<String, dynamic> json) =>
    _$ChecklistItemImpl(
      id: json['id'] as String,
      homeId: json['homeId'] as String,
      childId: json['childId'] as String?,
      areaKey: json['areaKey'] as String,
      areaLabel: json['areaLabel'] as String,
      taskKey: json['taskKey'] as String,
      taskLabel: json['taskLabel'] as String,
      shift: $enumDecode(_$ShiftTypeEnumMap, json['shift']),
      date: json['date'] as String,
      isComplete: json['isComplete'] as bool? ?? false,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      completedByName: json['completedByName'] as String?,
      createdById: json['createdById'] as String?,
      updatedById: json['updatedById'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChecklistItemImplToJson(_$ChecklistItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'childId': instance.childId,
      'areaKey': instance.areaKey,
      'areaLabel': instance.areaLabel,
      'taskKey': instance.taskKey,
      'taskLabel': instance.taskLabel,
      'shift': _$ShiftTypeEnumMap[instance.shift]!,
      'date': instance.date,
      'isComplete': instance.isComplete,
      'completedAt': instance.completedAt?.toIso8601String(),
      'completedByName': instance.completedByName,
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
