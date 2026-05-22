import 'package:freezed_annotation/freezed_annotation.dart';

import '../../daily_notes/domain/daily_note.dart';

part 'food_entry.freezed.dart';
part 'food_entry.g.dart';

enum MealType {
  @JsonValue('breakfast') breakfast,
  @JsonValue('morning_snack') morningSnack,
  @JsonValue('lunch') lunch,
  @JsonValue('afternoon_snack') afternoonSnack,
  @JsonValue('dinner') dinner,
  @JsonValue('evening_snack') eveningSnack,
  @JsonValue('other') other;

  String get displayName => switch (this) {
        MealType.breakfast => 'Breakfast',
        MealType.morningSnack => 'Morning Snack',
        MealType.lunch => 'Lunch',
        MealType.afternoonSnack => 'Afternoon Snack',
        MealType.dinner => 'Dinner',
        MealType.eveningSnack => 'Evening Snack',
        MealType.other => 'Other',
      };
}

enum Appetite {
  @JsonValue('good') good,
  @JsonValue('fair') fair,
  @JsonValue('poor') poor;

  String get displayName => switch (this) {
        Appetite.good => 'Good',
        Appetite.fair => 'Fair',
        Appetite.poor => 'Poor',
      };
}

/// A single food / meal record for a child.
@freezed
class FoodEntry with _$FoodEntry {
  const factory FoodEntry({
    required String id,
    required String homeId,
    required String childId,
    required String date, // 'YYYY-MM-DD'
    required ShiftType shift,
    required MealType mealType,
    required String description,
    required Appetite appetite,
    String? concerns,
    String? notes,
    required String recordedById,
    required String recordedByName,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _FoodEntry;

  factory FoodEntry.fromJson(Map<String, dynamic> json) =>
      _$FoodEntryFromJson(json);
}
