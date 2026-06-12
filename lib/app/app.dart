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
      title: 'TailorEd Notes',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ref.watch(themeModeNotifierProvider),
      routerConfig: router,
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
