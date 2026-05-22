// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SleepEntryImpl _$$SleepEntryImplFromJson(Map<String, dynamic> json) =>
    _$SleepEntryImpl(
      id: json['id'] as String,
      homeId: json['homeId'] as String,
      childId: json['childId'] as String,
      date: json['date'] as String,
      shift: $enumDecode(_$ShiftTypeEnumMap, json['shift']),
      bedTime: json['bedTime'] as String?,
      settledTime: json['settledTime'] as String?,
      wakeTime: json['wakeTime'] as String?,
      numberOfWakings: (json['numberOfWakings'] as num?)?.toInt() ?? 0,
      quality: $enumDecode(_$SleepQualityEnumMap, json['quality']),
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

Map<String, dynamic> _$$SleepEntryImplToJson(_$SleepEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'childId': instance.childId,
      'date': instance.date,
      'shift': _$ShiftTypeEnumMap[instance.shift]!,
      'bedTime': instance.bedTime,
      'settledTime': instance.settledTime,
      'wakeTime': instance.wakeTime,
      'numberOfWakings': instance.numberOfWakings,
      'quality': _$SleepQualityEnumMap[instance.quality]!,
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

const _$ShiftTypeEnumMap = {
  ShiftType.morning: 'morning',
  ShiftType.afternoon: 'afternoon',
  ShiftType.night: 'night',
};

const _$SleepQualityEnumMap = {
  SleepQuality.poor: 'poor',
  SleepQuality.fair: 'fair',
  SleepQuality.good: 'good',
};
