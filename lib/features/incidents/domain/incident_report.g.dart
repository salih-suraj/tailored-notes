// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IncidentReportImpl _$$IncidentReportImplFromJson(Map<String, dynamic> json) =>
    _$IncidentReportImpl(
      id: json['id'] as String,
      homeId: json['homeId'] as String,
      childId: json['childId'] as String,
      incidentType: $enumDecode(_$IncidentTypeEnumMap, json['incidentType']),
      severity: $enumDecode(_$IncidentSeverityEnumMap, json['severity']),
      title: json['title'] as String,
      occurredAt: DateTime.parse(json['occurredAt'] as String),
      location: json['location'] as String?,
      description: json['description'] as String,
      immediateAction: json['immediateAction'] as String,
      injuryDetails: json['injuryDetails'] as String?,
      policeNotified: json['policeNotified'] as bool? ?? false,
      parentNotified: json['parentNotified'] as bool? ?? false,
      managerNotified: json['managerNotified'] as bool? ?? false,
      followUpRequired: json['followUpRequired'] as bool? ?? false,
      followUpDetails: json['followUpDetails'] as String?,
      reportedById: json['reportedById'] as String,
      reportedByName: json['reportedByName'] as String,
      createdById: json['createdById'] as String?,
      updatedById: json['updatedById'] as String?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$$IncidentReportImplToJson(
  _$IncidentReportImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'homeId': instance.homeId,
  'childId': instance.childId,
  'incidentType': _$IncidentTypeEnumMap[instance.incidentType]!,
  'severity': _$IncidentSeverityEnumMap[instance.severity]!,
  'title': instance.title,
  'occurredAt': instance.occurredAt.toIso8601String(),
  'location': instance.location,
  'description': instance.description,
  'immediateAction': instance.immediateAction,
  'injuryDetails': instance.injuryDetails,
  'policeNotified': instance.policeNotified,
  'parentNotified': instance.parentNotified,
  'managerNotified': instance.managerNotified,
  'followUpRequired': instance.followUpRequired,
  'followUpDetails': instance.followUpDetails,
  'reportedById': instance.reportedById,
  'reportedByName': instance.reportedByName,
  'createdById': instance.createdById,
  'updatedById': instance.updatedById,
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isSynced': instance.isSynced,
};

const _$IncidentTypeEnumMap = {
  IncidentType.behaviour: 'behaviour',
  IncidentType.medical: 'medical',
  IncidentType.accident: 'accident',
  IncidentType.propertyDamage: 'property_damage',
  IncidentType.missingPerson: 'missing_person',
  IncidentType.safeguarding: 'safeguarding',
};

const _$IncidentSeverityEnumMap = {
  IncidentSeverity.low: 'low',
  IncidentSeverity.medium: 'medium',
  IncidentSeverity.high: 'high',
  IncidentSeverity.critical: 'critical',
};
