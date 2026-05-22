import 'package:freezed_annotation/freezed_annotation.dart';

import '../../daily_notes/domain/daily_note.dart';

part 'sleep_entry.freezed.dart';
part 'sleep_entry.g.dart';

enum SleepQuality {
  @JsonValue('poor') poor,
  @JsonValue('fair') fair,
  @JsonValue('good') good;

  String get displayName => switch (this) {
        SleepQuality.poor => 'Poor',
        SleepQuality.fair => 'Fair',
        SleepQuality.good => 'Good',
      };
}

/// A single sleep record for a child covering one shift period.
@freezed
class SleepEntry with _$SleepEntry {
  const factory SleepEntry({
    required String id,
    required String homeId,
    required String childId,
    required String date, // 'YYYY-MM-DD'
    required ShiftType shift,
    String? bedTime, // 'HH:mm'
    String? settledTime, // 'HH:mm' — when child fell asleep
    String? wakeTime, // 'HH:mm'
    @Default(0) int numberOfWakings,
    required SleepQuality quality,
    String? notes,
    required String recordedById,
    required String recordedByName,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _SleepEntry;

  factory SleepEntry.fromJson(Map<String, dynamic> json) =>
      _$SleepEntryFromJson(json);
}
