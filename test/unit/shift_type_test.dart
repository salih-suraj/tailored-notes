import 'package:flutter_test/flutter_test.dart';
import 'package:tailored_notes/core/time/uk_time.dart';
import 'package:tailored_notes/shared/models/shift_type.dart';

void main() {
  // forTime resolves the shift from Europe/London wall-clock time.
  setUpAll(UkTime.init);

  group('ShiftType.forTime — boundaries (winter / GMT, so UTC == London)', () {
    test('07:00–13:59 is morning', () {
      expect(
        ShiftType.forTime(DateTime.utc(2026, 1, 15, 7, 0)),
        ShiftType.morning,
      );
      expect(
        ShiftType.forTime(DateTime.utc(2026, 1, 15, 13, 59)),
        ShiftType.morning,
      );
    });

    test('14:00–21:59 is afternoon', () {
      expect(
        ShiftType.forTime(DateTime.utc(2026, 1, 15, 14, 0)),
        ShiftType.afternoon,
      );
      expect(
        ShiftType.forTime(DateTime.utc(2026, 1, 15, 21, 59)),
        ShiftType.afternoon,
      );
    });

    test('22:00–06:59 is night (wraps midnight)', () {
      expect(
        ShiftType.forTime(DateTime.utc(2026, 1, 15, 22, 0)),
        ShiftType.night,
      );
      expect(
        ShiftType.forTime(DateTime.utc(2026, 1, 15, 23, 59)),
        ShiftType.night,
      );
      expect(
        ShiftType.forTime(DateTime.utc(2026, 1, 15, 0, 0)),
        ShiftType.night,
      );
      expect(
        ShiftType.forTime(DateTime.utc(2026, 1, 15, 6, 59)),
        ShiftType.night,
      );
    });
  });

  group('ShiftType.forTime — uses London time, not the device/UTC hour', () {
    test('a 06:30 UTC summer instant is morning (07:30 BST), not night', () {
      // Naive .hour on the UTC value would be 6 → night. The London hour is
      // 7 → morning. This is the Q3 fix: shift follows UK wall-clock time.
      expect(
        ShiftType.forTime(DateTime.utc(2026, 6, 14, 6, 30)),
        ShiftType.morning,
      );
    });

    test('a 21:30 UTC summer instant is night (22:30 BST), not afternoon', () {
      expect(
        ShiftType.forTime(DateTime.utc(2026, 6, 14, 21, 30)),
        ShiftType.night,
      );
    });
  });

  group('ShiftType.displayName', () {
    test('every shift has a label', () {
      expect(ShiftType.morning.displayName, 'Morning');
      expect(ShiftType.afternoon.displayName, 'Afternoon');
      expect(ShiftType.night.displayName, 'Night');
    });
  });
}
