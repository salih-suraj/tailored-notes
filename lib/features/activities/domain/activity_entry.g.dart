// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityEntryImpl _$$ActivityEntryImplFromJson(Map<String, dynamic> json) =>
    _$ActivityEntryImpl(
      id: json['id'] as String,
      homeId: json['homeId'] as String,
      childId: json['childId'] as String,
      date: json['date'] as String,
      shift: $enumDecode(_$ShiftTypeEnumMap, json['shift']),
      category: $enumDecode(_$ActivityCategoryEnumMap, json['category']),
      title: json['title'] as String,
      description: json['description'] as String?,
      durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
      rewardEarned: json['rewardEarned'] as bool? ?? false,
      achievement: json['achievement'] as String?,
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

Map<String, dynamic> _$$ActivityEntryImplToJson(_$ActivityEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'childId': instance.childId,
      'date': instance.date,
      'shift': _$ShiftTypeEnumMap[instance.shift]!,
      'category': _$ActivityCategoryEnumMap[instance.category]!,
      'title': instance.title,
      'description': instance.description,
      'durationMinutes': instance.durationMinutes,
      'rewardEarned': instance.rewardEarned,
      'achievement': instance.achievement,
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

const _$ActivityCategoryEnumMap = {
  ActivityCategory.physical: 'physical',
  ActivityCategory.creative: 'creative',
  ActivityCategory.educational: 'educational',
  ActivityCategory.social: 'social',
  ActivityCategory.community: 'community',
  ActivityCategory.lifeSkills: 'life_skills',
  ActivityCategory.other: 'other',
};
