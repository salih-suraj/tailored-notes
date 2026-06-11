// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspector_feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InspectorFeedbackImpl _$$InspectorFeedbackImplFromJson(
  Map<String, dynamic> json,
) => _$InspectorFeedbackImpl(
  id: json['id'] as String,
  homeId: json['home_id'] as String,
  inspectorUserId: json['inspector_user_id'] as String,
  inspectorEmail: json['inspector_email'] as String,
  childId: json['child_id'] as String?,
  childName: json['child_name'] as String?,
  module: json['module'] as String,
  severity: $enumDecode(_$FeedbackSeverityEnumMap, json['severity']),
  content: json['content'] as String,
  status:
      $enumDecodeNullable(_$FeedbackStatusEnumMap, json['status']) ??
      FeedbackStatus.open,
  createdAt: DateTime.parse(json['created_at'] as String),
  resolvedAt: json['resolved_at'] == null
      ? null
      : DateTime.parse(json['resolved_at'] as String),
  resolvedBy: json['resolved_by'] as String?,
  resolutionNotes: json['resolution_notes'] as String?,
);

Map<String, dynamic> _$$InspectorFeedbackImplToJson(
  _$InspectorFeedbackImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'home_id': instance.homeId,
  'inspector_user_id': instance.inspectorUserId,
  'inspector_email': instance.inspectorEmail,
  'child_id': instance.childId,
  'child_name': instance.childName,
  'module': instance.module,
  'severity': _$FeedbackSeverityEnumMap[instance.severity]!,
  'content': instance.content,
  'status': _$FeedbackStatusEnumMap[instance.status]!,
  'created_at': instance.createdAt.toIso8601String(),
  'resolved_at': instance.resolvedAt?.toIso8601String(),
  'resolved_by': instance.resolvedBy,
  'resolution_notes': instance.resolutionNotes,
};

const _$FeedbackSeverityEnumMap = {
  FeedbackSeverity.compliment: 'compliment',
  FeedbackSeverity.recommendation: 'recommendation',
  FeedbackSeverity.requirement: 'requirement',
};

const _$FeedbackStatusEnumMap = {
  FeedbackStatus.open: 'open',
  FeedbackStatus.acknowledged: 'acknowledged',
  FeedbackStatus.resolved: 'resolved',
};
