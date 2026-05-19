/// Spacing scale from the TailorEd design system. Use these constants everywhere.
abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;
}

/// Border radius tokens.
abstract final class AppRadius {
  static const double button = 8;
  static const double input = 8;
  static const double card = 12;
  static const double modal = 16;
  static const double pill = 100;
}

/// Minimum tap target size (WCAG + design system requirement).
abstract final class AppTapTarget {
  static const double min = 48;
}

/// Animation durations — all transitions 200–300 ms ease-out, no spring.
abstract final class AppDuration {
  static const short = Duration(milliseconds: 200);
  static const standard = Duration(milliseconds: 300);
}
