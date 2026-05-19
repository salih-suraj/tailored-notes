// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescribed_med.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrescribedMedImpl _$$PrescribedMedImplFromJson(Map<String, dynamic> json) =>
    _$PrescribedMedImpl(
      id: json['id'] as String,
      homeId: json['homeId'] as String,
      childId: json['childId'] as String,
      medicationName: json['medicationName'] as String,
      dose: json['dose'] as String,
      route: $enumDecode(_$MedRouteEnumMap, json['route']),
      frequency: $enumDecode(_$MedFrequencyEnumMap, json['frequency']),
      instructions: json['instructions'] as String?,
      prescribedBy: json['prescribedBy'] as String?,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      createdById: json['createdById'] as String?,
      updatedById: json['updatedById'] as String?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$$PrescribedMedImplToJson(_$PrescribedMedImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'childId': instance.childId,
      'medicationName': instance.medicationName,
      'dose': instance.dose,
      'route': _$MedRouteEnumMap[instance.route]!,
      'frequency': _$MedFrequencyEnumMap[instance.frequency]!,
      'instructions': instance.instructions,
      'prescribedBy': instance.prescribedBy,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'isActive': instance.isActive,
      'createdById': instance.createdById,
      'updatedById': instance.updatedById,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isSynced': instance.isSynced,
    };

const _$MedRouteEnumMap = {
  MedRoute.oral: 'oral',
  MedRoute.topical: 'topical',
  MedRoute.inhaler: 'inhaler',
  MedRoute.subcutaneous: 'subcutaneous',
  MedRoute.transdermal: 'transdermal',
  MedRoute.rectal: 'rectal',
  MedRoute.other: 'other',
};

const _$MedFrequencyEnumMap = {
  MedFrequency.morning: 'morning',
  MedFrequency.evening: 'evening',
  MedFrequency.night: 'night',
  MedFrequency.morningEvening: 'morning_evening',
  MedFrequency.threeTimesDaily: 'three_times_daily',
  MedFrequency.fourTimesDaily: 'four_times_daily',
  MedFrequency.prn: 'prn',
  MedFrequency.other: 'other',
};
