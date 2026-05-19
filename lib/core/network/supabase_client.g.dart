// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supabaseClientHash() => r'6d24141b965221ca9b8afe6865d50e565a64e34b';

/// Returns the initialised Supabase client.
/// Call [SupabaseInit.initialize] once in main() before runApp().
/// Returns the initialised Supabase client, or null when running without credentials.
///
/// Copied from [supabaseClient].
@ProviderFor(supabaseClient)
final supabaseClientProvider = AutoDisposeProvider<SupabaseClient?>.internal(
  supabaseClient,
  name: r'supabaseClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supabaseClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SupabaseClientRef = AutoDisposeProviderRef<SupabaseClient?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
