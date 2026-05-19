import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'supabase_client.g.dart';

/// Returns the initialised Supabase client.
/// Call [SupabaseInit.initialize] once in main() before runApp().
/// Returns the initialised Supabase client, or null when running without credentials.
@riverpod
SupabaseClient? supabaseClient(Ref ref) {
  try {
    return Supabase.instance.client;
  } catch (_) {
    return null;
  }
}

/// Initialises Supabase. Must be called before [runApp].
///
/// Project must be hosted in eu-west-2 or eu-central-1 (UK GDPR requirement).
/// Set SUPABASE_URL and SUPABASE_ANON_KEY before building (via --dart-define or .env tooling).
abstract final class SupabaseInit {
  static Future<void> initialize({
    required String url,
    required String anonKey,
  }) async {
    await Supabase.initialize(
      url: url,
      anonKey: anonKey,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
    );
  }
}
