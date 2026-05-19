// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicalProfileImpl _$$MedicalProfileImplFromJson(Map<String, dynamic> json) =>
    _$MedicalProfileImpl(
      id: json['id'] as String,
      homeId: json['homeId'] as String,
      childId: json['childId'] as String,
      nhsNumber: json['nhsNumber'] as String?,
      bloodType: json['bloodType'] as String?,
      conditions: json['conditions'] as String?,
      allergies: json['allergies'] as String?,
      immunisationNotes: json['immunisationNotes'] as String?,
      notes: json['notes'] as String?,
      createdById: json['createdById'] as String?,
      updatedById: json['updatedById'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$$MedicalProfileImplToJson(
  _$MedicalProfileImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'homeId': instance.homeId,
  'childId': instance.childId,
  'nhsNumber': instance.nhsNumber,
  'bloodType': instance.bloodType,
  'conditions': instance.conditions,
  'allergies': instance.allergies,
  'immunisationNotes': instance.immunisationNotes,
  'notes': instance.notes,
  'createdById': instance.createdById,
  'updatedById': instance.updatedById,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isSynced': instance.isSynced,
};
