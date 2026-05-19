// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyNoteImpl _$$DailyNoteImplFromJson(Map<String, dynamic> json) =>
    _$DailyNoteImpl(
      id: json['id'] as String,
      homeId: json['homeId'] as String,
      childId: json['childId'] as String,
      authorId: json['authorId'] as String,
      authorName: json['authorName'] as String,
      shift: $enumDecode(_$ShiftTypeEnumMap, json['shift']),
      content: json['content'] as String,
      occurredAt: DateTime.parse(json['occurredAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      updatedById: json['updatedById'] as String?,
      updatedByName: json['updatedByName'] as String?,
      isSynced: json['isSynced'] as bool? ?? false,
    );

Map<String, dynamic> _$$DailyNoteImplToJson(_$DailyNoteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'childId': instance.childId,
      'authorId': instance.authorId,
      'authorName': instance.authorName,
      'shift': _$ShiftTypeEnumMap[instance.shift]!,
      'content': instance.content,
      'occurredAt': instance.occurredAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'updatedById': instance.updatedById,
      'updatedByName': instance.updatedByName,
      'isSynced': instance.isSynced,
    };

const _$ShiftTypeEnumMap = {
  ShiftType.morning: 'morning',
  ShiftType.afternoon: 'afternoon',
  ShiftType.night: 'night',
};
