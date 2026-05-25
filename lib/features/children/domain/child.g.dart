// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChildImpl _$$ChildImplFromJson(Map<String, dynamic> json) => _$ChildImpl(
  id: json['id'] as String,
  homeId: json['homeId'] as String,
  name: json['name'] as String,
  dateOfBirth: json['dateOfBirth'] as String,
  room: json['room'] as String,
  photoUrl: json['photoUrl'] as String?,
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  createdById: json['createdById'] as String?,
  updatedById: json['updatedById'] as String?,
  isSynced: json['isSynced'] as bool? ?? false,
);

Map<String, dynamic> _$$ChildImplToJson(_$ChildImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'name': instance.name,
      'dateOfBirth': instance.dateOfBirth,
      'room': instance.room,
      'photoUrl': instance.photoUrl,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'createdById': instance.createdById,
      'updatedById': instance.updatedById,
      'isSynced': instance.isSynced,
    };
