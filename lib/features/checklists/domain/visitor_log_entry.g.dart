// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_log_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisitorLogEntryImpl _$$VisitorLogEntryImplFromJson(
  Map<String, dynamic> json,
) => _$VisitorLogEntryImpl(
  id: json['id'] as String,
  homeId: json['homeId'] as String,
  visitorName: json['visitorName'] as String,
  relation: json['relation'] as String?,
  purpose: json['purpose'] as String,
  authorisedBy: json['authorisedBy'] as String,
  arrivedAt: DateTime.parse(json['arrivedAt'] as String),
  departedAt: json['departedAt'] == null
      ? null
      : DateTime.parse(json['departedAt'] as String),
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

Map<String, dynamic> _$$VisitorLogEntryImplToJson(
  _$VisitorLogEntryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'homeId': instance.homeId,
  'visitorName': instance.visitorName,
  'relation': instance.relation,
  'purpose': instance.purpose,
  'authorisedBy': instance.authorisedBy,
  'arrivedAt': instance.arrivedAt.toIso8601String(),
  'departedAt': instance.departedAt?.toIso8601String(),
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
