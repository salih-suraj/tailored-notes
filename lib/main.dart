import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'core/network/supabase_client.dart';

/// Entry point. Supabase credentials are injected at build time via --dart-define.
/// Example:
///   flutter run \
///     --dart-define=SUPABASE_URL=https://xxx.supabase.co \
///     --dart-define=SUPABASE_ANON_KEY=your_anon_key
const _supabaseUrl = String.fromEnvironment('SUPABASE_URL');
const _supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  if (_supabaseUrl.isNotEmpty && _supabaseAnonKey.isNotEmpty) {
    await SupabaseInit.initialize(
      url: _supabaseUrl,
      anonKey: _supabaseAnonKey,
    );
  }

  FlutterNativeSplash.remove();

  runApp(
    const ProviderScope(
      child: TailorEdApp(),
    ),
  );
}
