import 'package:flutter_test/flutter_test.dart';
import 'package:tailored_notes/core/time/uk_time.dart';

void main() {
  setUpAll(UkTime.init);

  group('UkTime.fromUtc — Europe/London conversion', () {
    test('applies the +1 BST offset in summer', () {
      // 22:30 UTC on a summer day is 23:30 the same day in London (BST).
      final uk = UkTime.fromUtc(DateTime.utc(2026, 6, 14, 22, 30));
      expect(uk.hour, 23);
      expect(uk.day, 14);
    });

    test('applies no offset in winter (GMT == UTC)', () {
      final uk = UkTime.fromUtc(DateTime.utc(2026, 1, 15, 22, 30));
      expect(uk.hour, 22);
      expect(uk.day, 15);
    });

    test('a late-evening BST instant rolls into the next London day', () {
      // 23:30 UTC in summer = 00:30 the NEXT day in London. This is the Q3
      // bug: rendering in UTC would file it under the wrong calendar date.
      final uk = UkTime.fromUtc(DateTime.utc(2026, 6, 14, 23, 30));
      expect(uk.day, 15);
      expect(uk.hour, 0);
    });
  });

  group('UkTime.dateStr', () {
    test('formats as zero-padded YYYY-MM-DD in London time', () {
      expect(UkTime.dateStr(DateTime.utc(2026, 6, 14, 23, 30)), '2026-06-15');
      expect(UkTime.dateStr(DateTime.utc(2026, 1, 15, 23, 30)), '2026-01-15');
      expect(UkTime.dateStr(DateTime.utc(2026, 3, 9, 12, 0)), '2026-03-09');
    });
  });

  group('UkTime day windows (London midnight as a UTC instant)', () {
    test('dayStartUtc backs off one hour for a BST date', () {
      // London midnight 2026-06-14 (BST) == 23:00 UTC the previous day.
      expect(UkTime.dayStartUtc('2026-06-14'), DateTime.utc(2026, 6, 13, 23));
    });

    test('dayStartUtc is true UTC midnight for a GMT date', () {
      expect(UkTime.dayStartUtc('2026-01-15'), DateTime.utc(2026, 1, 15, 0));
    });

    test('dayEndUtc is the last second of the London day', () {
      // London 23:59:59 on 2026-06-14 (BST) == 22:59:59 UTC.
      expect(UkTime.dayEndUtc('2026-06-14'),
          DateTime.utc(2026, 6, 14, 22, 59, 59));
    });

    test('start is strictly before end', () {
      expect(
        UkTime.dayStartUtc('2026-06-14')
            .isBefore(UkTime.dayEndUtc('2026-06-14')),
        isTrue,
      );
    });
  });

  group('DateTime.toUk extension', () {
    test('matches UkTime.fromUtc', () {
      final instant = DateTime.utc(2026, 6, 14, 22, 30);
      expect(instant.toUk(), UkTime.fromUtc(instant));
    });
  });
}
