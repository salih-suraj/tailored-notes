// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SmartStepImpl _$$SmartStepImplFromJson(Map<String, dynamic> json) =>
    _$SmartStepImpl(
      id: json['id'] as String,
      homeId: json['homeId'] as String,
      childId: json['childId'] as String,
      category: $enumDecode(_$StepCategoryEnumMap, json['category']),
      title: json['title'] as String,
      description: json['description'] as String?,
      targetDate: json['targetDate'] as String?,
      status: $enumDecode(_$StepStatusEnumMap, json['status']),
      achievedDate: json['achievedDate'] as String?,
      createdById: json['createdById'] as String?,
      updatedById: json['updatedById'] as String?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$$SmartStepImplToJson(_$SmartStepImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'childId': instance.childId,
      'category': _$StepCategoryEnumMap[instance.category]!,
      'title': instance.title,
      'description': instance.description,
      'targetDate': instance.targetDate,
      'status': _$StepStatusEnumMap[instance.status]!,
      'achievedDate': instance.achievedDate,
      'createdById': instance.createdById,
      'updatedById': instance.updatedById,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isSynced': instance.isSynced,
    };

const _$StepCategoryEnumMap = {
  StepCategory.communication: 'communication',
  StepCategory.selfCare: 'self_care',
  StepCategory.independence: 'independence',
  StepCategory.social: 'social',
  StepCategory.emotional: 'emotional',
  StepCategory.learning: 'learning',
  StepCategory.physical: 'physical',
  StepCategory.other: 'other',
};

const _$StepStatusEnumMap = {
  StepStatus.notStarted: 'not_started',
  StepStatus.inProgress: 'in_progress',
  StepStatus.achieved: 'achieved',
};
