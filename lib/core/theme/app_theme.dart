import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';

/// Builds the light and dark ThemeData from TailorEd design tokens.
abstract final class AppTheme {
  static ThemeData get light => _build(dark: false);
  static ThemeData get dark => _build(dark: true);

  static ThemeData _build({required bool dark}) {
    final colorScheme = dark ? _darkScheme : _lightScheme;
    final textTheme = AppTextStyles.toTextTheme(dark: dark);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainerLow,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        margin: EdgeInsets.zero,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: AppColors.white,
          minimumSize: const Size(double.infinity, AppTapTarget.min),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.md,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.button),
          ),
          textStyle: AppTextStyles.button(AppColors.white),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          minimumSize: const Size(double.infinity, AppTapTarget.min),
          side: BorderSide(color: colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.button),
          ),
          textStyle: AppTextStyles.button(colorScheme.primary),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          minimumSize: const Size(AppTapTarget.min, AppTapTarget.min),
          textStyle: AppTextStyles.button(colorScheme.primary),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: dark ? AppColors.darkCard : AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(
            color: dark ? AppColors.darkBorder : AppColors.slate400,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(
            color: dark ? AppColors.darkBorder : const Color(0xFFDDDCD5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.input),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        labelStyle: AppTextStyles.label(colorScheme.onSurfaceVariant),
        hintStyle: AppTextStyles.body(colorScheme.onSurfaceVariant),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: AppTextStyles.h1(colorScheme.onSurface),
        iconTheme: IconThemeData(color: colorScheme.onSurface),
      ),
      dividerTheme: DividerThemeData(
        color: dark ? AppColors.darkBorder : const Color(0xFFE8E6DF),
        thickness: 1,
        space: 1,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  static const _lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.teal400,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.teal50,
    onPrimaryContainer: AppColors.teal600,
    secondary: AppColors.slate400,
    onSecondary: AppColors.white,
    secondaryContainer: Color(0xFFE8E6DF),
    onSecondaryContainer: AppColors.slate900,
    tertiary: AppColors.blue,
    onTertiary: AppColors.white,
    error: AppColors.red,
    onError: AppColors.white,
    surface: AppColors.slate50,
    onSurface: AppColors.slate900,
    surfaceContainerLow: AppColors.white,
    onSurfaceVariant: AppColors.slate400,
    outline: Color(0xFFDDDCD5),
    outlineVariant: Color(0xFFE8E6DF),
  );

  static const _darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.teal400,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.teal600,
    onPrimaryContainer: AppColors.teal50,
    secondary: AppColors.slate400,
    onSecondary: AppColors.darkBackground,
    secondaryContainer: AppColors.darkBorder,
    onSecondaryContainer: AppColors.white,
    tertiary: AppColors.darkBlue,
    onTertiary: AppColors.white,
    error: AppColors.darkRed,
    onError: AppColors.white,
    surface: AppColors.darkBackground,
    onSurface: AppColors.white,
    surfaceContainerLow: AppColors.darkCard,
    onSurfaceVariant: AppColors.slate400,
    outline: AppColors.darkBorder,
    outlineVariant: AppColors.darkSurface,
  );
}
