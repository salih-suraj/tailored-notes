// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bath_temp_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BathTempRecordImpl _$$BathTempRecordImplFromJson(Map<String, dynamic> json) =>
    _$BathTempRecordImpl(
      id: json['id'] as String,
      homeId: json['homeId'] as String,
      childId: json['childId'] as String,
      temperatureCelsius: (json['temperatureCelsius'] as num).toDouble(),
      shift: $enumDecode(_$ShiftTypeEnumMap, json['shift']),
      recordedAt: DateTime.parse(json['recordedAt'] as String),
      recordedById: json['recordedById'] as String,
      recordedByName: json['recordedByName'] as String,
      notes: json['notes'] as String?,
      createdById: json['createdById'] as String?,
      updatedById: json['updatedById'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$$BathTempRecordImplToJson(
  _$BathTempRecordImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'homeId': instance.homeId,
  'childId': instance.childId,
  'temperatureCelsius': instance.temperatureCelsius,
  'shift': _$ShiftTypeEnumMap[instance.shift]!,
  'recordedAt': instance.recordedAt.toIso8601String(),
  'recordedById': instance.recordedById,
  'recordedByName': instance.recordedByName,
  'notes': instance.notes,
  'createdById': instance.createdById,
  'updatedById': instance.updatedById,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isSynced': instance.isSynced,
};

const _$ShiftTypeEnumMap = {
  ShiftType.morning: 'morning',
  ShiftType.afternoon: 'afternoon',
  ShiftType.night: 'night',
};
