// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'healthcare_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthcareContactImpl _$$HealthcareContactImplFromJson(
  Map<String, dynamic> json,
) => _$HealthcareContactImpl(
  id: json['id'] as String,
  homeId: json['homeId'] as String,
  childId: json['childId'] as String,
  contactType: $enumDecode(_$ContactTypeEnumMap, json['contactType']),
  name: json['name'] as String,
  role: json['role'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  address: json['address'] as String?,
  notes: json['notes'] as String?,
  createdById: json['createdById'] as String?,
  updatedById: json['updatedById'] as String?,
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isSynced: json['isSynced'] as bool? ?? false,
);

Map<String, dynamic> _$$HealthcareContactImplToJson(
  _$HealthcareContactImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'homeId': instance.homeId,
  'childId': instance.childId,
  'contactType': _$ContactTypeEnumMap[instance.contactType]!,
  'name': instance.name,
  'role': instance.role,
  'phone': instance.phone,
  'email': instance.email,
  'address': instance.address,
  'notes': instance.notes,
  'createdById': instance.createdById,
  'updatedById': instance.updatedById,
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isSynced': instance.isSynced,
};

const _$ContactTypeEnumMap = {
  ContactType.gp: 'gp',
  ContactType.specialist: 'specialist',
  ContactType.camhs: 'camhs',
  ContactType.dentist: 'dentist',
  ContactType.optician: 'optician',
  ContactType.physiotherapist: 'physiotherapist',
  ContactType.speechTherapy: 'speech_therapy',
  ContactType.other: 'other',
};
