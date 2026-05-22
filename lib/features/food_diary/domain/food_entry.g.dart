// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodEntryImpl _$$FoodEntryImplFromJson(Map<String, dynamic> json) =>
    _$FoodEntryImpl(
      id: json['id'] as String,
      homeId: json['homeId'] as String,
      childId: json['childId'] as String,
      date: json['date'] as String,
      shift: $enumDecode(_$ShiftTypeEnumMap, json['shift']),
      mealType: $enumDecode(_$MealTypeEnumMap, json['mealType']),
      description: json['description'] as String,
      appetite: $enumDecode(_$AppetiteEnumMap, json['appetite']),
      concerns: json['concerns'] as String?,
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

Map<String, dynamic> _$$FoodEntryImplToJson(_$FoodEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'homeId': instance.homeId,
      'childId': instance.childId,
      'date': instance.date,
      'shift': _$ShiftTypeEnumMap[instance.shift]!,
      'mealType': _$MealTypeEnumMap[instance.mealType]!,
      'description': instance.description,
      'appetite': _$AppetiteEnumMap[instance.appetite]!,
      'concerns': instance.concerns,
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

const _$MealTypeEnumMap = {
  MealType.breakfast: 'breakfast',
  MealType.morningSnack: 'morning_snack',
  MealType.lunch: 'lunch',
  MealType.afternoonSnack: 'afternoon_snack',
  MealType.dinner: 'dinner',
  MealType.eveningSnack: 'evening_snack',
  MealType.other: 'other',
};

const _$AppetiteEnumMap = {
  Appetite.good: 'good',
  Appetite.fair: 'fair',
  Appetite.poor: 'poor',
};
