import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/offline/sync_provider.dart';
import '../core/routing/app_router.dart';
import '../core/theme/theme.dart';
import '../features/settings/presentation/settings_screen.dart';

/// Root widget — sets up theme, localisation, and router.
class TailorEdApp extends ConsumerWidget {
  const TailorEdApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    // Activate the offline→Supabase sync engine (sweeps while signed in).
    ref.watch(syncServiceProvider);

    return MaterialApp.router(
      title: 'TailorEd',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ref.watch(themeModeNotifierProvider),
      routerConfig: router,
      // I5: honour the system font-size setting up to 200% — beyond that,
      // layouts degrade without adding accessibility value.
      //
      // Only the MAX is clamped. Do NOT add `minScaleFactor: 1.0` here: on a
      // non-linear platform scaler (e.g. Android 14+) it builds a
      // _ClampedTextScaler whose min is 1.0, and any descendant that clamps its
      // own max down to 1.0 — the Material date picker header does exactly this
      // at default font size — collapses to min == max == 1.0, tripping the
      // `assert(maxScale > minScale)` in text_scaler.dart and crashing the picker.
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: mediaQuery.textScaler.clamp(maxScaleFactor: 2.0),
          ),
          child: child!,
        );
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', 'GB')],
      debugShowCheckedModeBanner: false,
    );
  }
}
