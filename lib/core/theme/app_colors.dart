import 'package:flutter/material.dart';

/// Design-token colour constants. All values from the TailorEd design system.
abstract final class AppColors {
  // Primary — Brand Blue
  static const teal400 = Color(0xFF5271FF);
  static const teal600 = Color(0xFF3A58E0);
  static const teal50 = Color(0xFFEEF1FF);

  // Neutral — Slate
  static const slate900 = Color(0xFF2C2C2A);
  static const slate400 = Color(0xFF888780);
  static const slate50 = Color(0xFFF1EFE8);
  static const white = Color(0xFFFFFFFF);
  static const offWhite = Color(0xFFFAFAF8);

  // Semantic
  static const amber = Color(0xFFEF9F27);
  static const orange = Color(0xFFE87510);
  static const red = Color(0xFFE24B4A);
  static const blue = Color(0xFF378ADD);
  static const green = Color(0xFF639922);
  static const purple = Color(0xFF9C27B0);

  // Role indicators
  static const roleSupportWorker = teal400;
  static const roleTeamLeader = blue;
  static const roleManager = Color(0xFFBA7517);
  static const roleInspector = Color(0xFFA32D2D);

  // Dark-mode surfaces
  static const darkBackground = Color(0xFF1A1A18);
  static const darkSurface = Color(0xFF242422);
  static const darkCard = Color(0xFF2E2E2C);
  static const darkBorder = Color(0xFF3A3A38);

  // Dark-mode semantic (slightly desaturated for dark backgrounds)
  static const darkAmber = Color(0xFFD4892A);
  static const darkRed = Color(0xFFCF4443);
  static const darkBlue = Color(0xFF4A8FD4);
  static const darkGreen = Color(0xFF5A8A1F);
}
