// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'care_plan_goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarePlanGoalImpl _$$CarePlanGoalImplFromJson(Map<String, dynamic> json) =>
    _$CarePlanGoalImpl(
      id: json['id'] as String,
      carePlanId: json['carePlanId'] as String,
      homeId: json['homeId'] as String,
      childId: json['childId'] as String,
      category: $enumDecode(_$GoalCategoryEnumMap, json['category']),
      title: json['title'] as String,
      description: json['description'] as String?,
      strategy: json['strategy'] as String?,
      targetDate: json['targetDate'] as String?,
      status: $enumDecode(_$GoalStatusEnumMap, json['status']),
      progressNotes: json['progressNotes'] as String?,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      createdById: json['createdById'] as String?,
      updatedById: json['updatedById'] as String?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$$CarePlanGoalImplToJson(_$CarePlanGoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'carePlanId': instance.carePlanId,
      'homeId': instance.homeId,
      'childId': instance.childId,
      'category': _$GoalCategoryEnumMap[instance.category]!,
      'title': instance.title,
      'description': instance.description,
      'strategy': instance.strategy,
      'targetDate': instance.targetDate,
      'status': _$GoalStatusEnumMap[instance.status]!,
      'progressNotes': instance.progressNotes,
      'sortOrder': instance.sortOrder,
      'createdById': instance.createdById,
      'updatedById': instance.updatedById,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isSynced': instance.isSynced,
    };

const _$GoalCategoryEnumMap = {
  GoalCategory.communication: 'communication',
  GoalCategory.independence: 'independence',
  GoalCategory.behaviour: 'behaviour',
  GoalCategory.health: 'health',
  GoalCategory.education: 'education',
  GoalCategory.social: 'social',
  GoalCategory.other: 'other',
};

const _$GoalStatusEnumMap = {
  GoalStatus.notStarted: 'not_started',
  GoalStatus.inProgress: 'in_progress',
  GoalStatus.achieved: 'achieved',
  GoalStatus.discontinued: 'discontinued',
};
