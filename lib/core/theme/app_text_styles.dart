import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// All text styles from the TailorEd type scale. Use these — never inline TextStyle.
abstract final class AppTextStyles {
  static TextStyle display(Color color) => GoogleFonts.dmSerifDisplay(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 1.2,
        color: color,
      );

  static TextStyle h1(Color color) => GoogleFonts.dmSans(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: color,
      );

  static TextStyle h2(Color color) => GoogleFonts.dmSans(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1.4,
        color: color,
      );

  static TextStyle h3(Color color) => GoogleFonts.dmSans(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.4,
        color: color,
      );

  static TextStyle body(Color color) => GoogleFonts.dmSans(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: color,
      );

  static TextStyle small(Color color) => GoogleFonts.dmSans(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: color,
      );

  static TextStyle label(Color color) => GoogleFonts.dmSans(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.06 * 11,
        color: color,
      );

  static TextStyle button(Color color) => GoogleFonts.dmSans(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.0,
        color: color,
      );

  static TextTheme toTextTheme({required bool dark}) {
    final base = dark ? AppColors.white : AppColors.slate900;
    final secondary = dark ? AppColors.slate400 : AppColors.slate400;
    return TextTheme(
      displayLarge: display(base),
      titleLarge: h1(base),
      titleMedium: h2(base),
      titleSmall: h3(base),
      bodyLarge: body(base),
      bodyMedium: body(base),
      bodySmall: small(secondary),
      labelLarge: button(base),
      labelSmall: label(secondary),
    );
  }
}
