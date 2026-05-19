// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'care_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarePlanImpl _$$CarePlanImplFromJson(Map<String, dynamic> json) =>
    _$CarePlanImpl(
      id: json['id'] as String,
      homeId: json['homeId'] as String,
      childId: json['childId'] as String,
      title: json['title'] as String,
      status: $enumDecode(_$CarePlanStatusEnumMap, json['status']),
      reviewDate: json['reviewDate'] as String?,
      notes: json['notes'] as String?,
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String,
      approvedById: json['approvedById'] as String?,
      approvedByName: json['approvedByName'] as String?,
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
      createdById: json['createdById'] as String?,
      updatedById: json['updatedById'] as String?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$$CarePlanImplToJson(_$CarePlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'childId': instance.childId,
      'title': instance.title,
      'status': _$CarePlanStatusEnumMap[instance.status]!,
      'reviewDate': instance.reviewDate,
      'notes': instance.notes,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'approvedById': instance.approvedById,
      'approvedByName': instance.approvedByName,
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'createdById': instance.createdById,
      'updatedById': instance.updatedById,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isSynced': instance.isSynced,
    };

const _$CarePlanStatusEnumMap = {
  CarePlanStatus.draft: 'draft',
  CarePlanStatus.active: 'active',
  CarePlanStatus.underReview: 'under_review',
  CarePlanStatus.archived: 'archived',
};
