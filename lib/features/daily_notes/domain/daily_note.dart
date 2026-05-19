import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_note.freezed.dart';
part 'daily_note.g.dart';

/// Which shift the observation belongs to.
enum ShiftType {
  @JsonValue('morning') morning,
  @JsonValue('afternoon') afternoon,
  @JsonValue('night') night;

  String get displayName => switch (this) {
        ShiftType.morning => 'Morning',
        ShiftType.afternoon => 'Afternoon',
        ShiftType.night => 'Night',
      };

  /// Infers the shift from wall-clock time (London time).
  /// 07:00–13:59 → morning, 14:00–21:59 → afternoon, 22:00–06:59 → night.
  static ShiftType forTime(DateTime time) {
    final hour = time.toLocal().hour;
    if (hour >= 7 && hour < 14) return ShiftType.morning;
    if (hour >= 14 && hour < 22) return ShiftType.afternoon;
    return ShiftType.night;
  }
}

/// A single staff observation for a child during a shift.
/// Written to local Drift first; synced to Supabase when online.
@freezed
class DailyNote with _$DailyNote {
  const factory DailyNote({
    required String id,
    required String homeId,
    required String childId,
    required String authorId,
    required String authorName,
    required ShiftType shift,
    required String content,
    required DateTime occurredAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    String? updatedById,
    String? updatedByName,
    @Default(false) bool isSynced,
  }) = _DailyNote;

  factory DailyNote.fromJson(Map<String, dynamic> json) =>
      _$DailyNoteFromJson(json);
}
