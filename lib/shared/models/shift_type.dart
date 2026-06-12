import 'package:json_annotation/json_annotation.dart';

import '../../core/time/uk_time.dart';

/// Shift period used across all care-record features.
/// 07:00–13:59 → morning, 14:00–21:59 → afternoon, 22:00–06:59 → night.
enum ShiftType {
  @JsonValue('morning') morning,
  @JsonValue('afternoon') afternoon,
  @JsonValue('night') night;

  String get displayName => switch (this) {
        ShiftType.morning => 'Morning',
        ShiftType.afternoon => 'Afternoon',
        ShiftType.night => 'Night',
      };

  /// Infers the shift from Europe/London wall-clock time — care home
  /// shifts follow UK time regardless of the device's timezone setting.
  static ShiftType forTime(DateTime time) {
    final hour = UkTime.fromUtc(time).hour;
    if (hour >= 7 && hour < 14) return ShiftType.morning;
    if (hour >= 14 && hour < 22) return ShiftType.afternoon;
    return ShiftType.night;
  }
}
