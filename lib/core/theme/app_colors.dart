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

  // Care-module accents — a curated, professionally-balanced palette so each
  // module reads as its own colour without the screen turning into confetti.
  // Mid-saturation hues, evenly spaced around the wheel, all legible on both
  // the cream (light) and charcoal (dark) card surfaces.
  static const moduleDailyNotes = Color(0xFF5271FF); // indigo (brand)
  static const moduleBathTemp = Color(0xFF2E8BC0); // sky blue
  static const moduleCarePlans = Color(0xFF7C5CFC); // violet
  static const moduleMedication = Color(0xFF119A8E); // teal
  static const moduleMedicalHistory = Color(0xFFDB4A7E); // rose
  static const moduleBehaviour = Color(0xFFE8941A); // amber
  static const moduleSleep = Color(0xFF4C57B5); // deep indigo / night
  static const moduleFood = Color(0xFF5BA32B); // green
  static const moduleActivities = Color(0xFFE87510); // orange
  static const moduleSmartSteps = Color(0xFF0CA4B5); // cyan
  static const moduleIncidents = Color(0xFFE24B4A); // red

  /// Distinct, gentle hues used to colour person avatars by a stable seed so
  /// the children list/profiles feel alive instead of a wall of identical dots.
  /// Led by the logo's cornflower-indigo (#5271FF) and its cool neighbours, so
  /// avatars stay on-brand; warm tones appear only as occasional accents.
  static const avatarPalette = <Color>[
    Color(0xFF5271FF), // indigo — the logo blue
    Color(0xFF7C5CFC), // violet
    Color(0xFF2E8BC0), // sky
    Color(0xFF119A8E), // teal
    Color(0xFF0CA4B5), // cyan
    Color(0xFF4C57B5), // deep indigo
    Color(0xFFDB4A7E), // rose accent
    Color(0xFFE8941A), // amber accent
  ];

  /// Picks a stable avatar colour for [seed] (e.g. a child id or name).
  static Color avatarColorFor(String seed) {
    if (seed.isEmpty) return avatarPalette.first;
    final hash = seed.codeUnits.fold<int>(
      0,
      (acc, c) => (acc * 31 + c) & 0x7fffffff,
    );
    return avatarPalette[hash % avatarPalette.length];
  }

  // Role indicators
  static const roleSupportWorker = teal400;
  static const roleTeamLeader = blue;
  static const roleManager = Color(0xFFBA7517);
  static const roleInspector = Color(0xFFA32D2D);
  static const roleParent = purple;

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
