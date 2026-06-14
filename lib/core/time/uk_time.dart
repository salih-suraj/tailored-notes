import 'package:timezone/data/latest_10y.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

/// Q3 — all wall-clock logic and display rendering uses Europe/London,
/// regardless of the device's timezone setting. Storage stays UTC.
///
/// Why not `.toLocal()`: a device set to the wrong timezone (or a staff
/// member abroad) would otherwise file records under the wrong care-home
/// date and shift — e.g. a 23:30 BST note landing on the previous day.
abstract final class UkTime {
  static late final tz.Location _london;
  static bool _initialized = false;

  /// Call once at app startup, before runApp.
  static void init() {
    if (_initialized) return;
    tzdata.initializeTimeZones();
    _london = tz.getLocation('Europe/London');
    _initialized = true;
  }

  /// The current moment as Europe/London wall-clock time.
  /// TZDateTime extends DateTime, so this drops into DateFormat directly.
  static tz.TZDateTime now() => tz.TZDateTime.now(_london);

  /// Converts any instant to Europe/London wall-clock time for display.
  static tz.TZDateTime fromUtc(DateTime time) =>
      tz.TZDateTime.from(time, _london);

  /// Today's date in London as 'YYYY-MM-DD' (the format care records key on).
  static String todayStr() => dateStr(now());

  /// [time]'s London date as 'YYYY-MM-DD'.
  static String dateStr(DateTime time) {
    final uk = time is tz.TZDateTime ? time : fromUtc(time);
    return '${uk.year}'
        '-${uk.month.toString().padLeft(2, '0')}'
        '-${uk.day.toString().padLeft(2, '0')}';
  }

  /// Start of today (London midnight) as a UTC instant, for range queries.
  static DateTime startOfTodayUtc() {
    final uk = now();
    return tz.TZDateTime(_london, uk.year, uk.month, uk.day).toUtc();
  }

  /// End of today (London 23:59:59) as a UTC instant, for range queries.
  static DateTime endOfTodayUtc() {
    final uk = now();
    return tz.TZDateTime(
      _london,
      uk.year,
      uk.month,
      uk.day,
      23,
      59,
      59,
    ).toUtc();
  }

  /// Start of the London day [date] ('YYYY-MM-DD') as a UTC instant.
  static DateTime dayStartUtc(String date) {
    final p = date.split('-');
    return tz.TZDateTime(
      _london,
      int.parse(p[0]),
      int.parse(p[1]),
      int.parse(p[2]),
    ).toUtc();
  }

  /// End of the London day [date] ('YYYY-MM-DD') as a UTC instant.
  static DateTime dayEndUtc(String date) {
    final p = date.split('-');
    return tz.TZDateTime(
      _london,
      int.parse(p[0]),
      int.parse(p[1]),
      int.parse(p[2]),
      23,
      59,
      59,
    ).toUtc();
  }
}

/// Display-conversion shorthand: `timestamp.toUk()` instead of `.toLocal()`.
extension UkDateTime on DateTime {
  DateTime toUk() => UkTime.fromUtc(this);
}
