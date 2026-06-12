// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncServiceHash() => r'276ccd5d61bc3d2a65d14a90f07692f637d44cfb';

/// The Q2 sync engine, registered over every care-record repository plus
/// the audit log. Starts sweeping when a user is signed in (RLS requires
/// an authenticated session) and stops on sign-out. Rebuilds on auth
/// change, so each login gets a fresh sweep — which is also what backfills
/// rows written offline or before the backend fixes of 2026-06-12.
///
/// Copied from [syncService].
@ProviderFor(syncService)
final syncServiceProvider = Provider<SyncService>.internal(
  syncService,
  name: r'syncServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$syncServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SyncServiceRef = ProviderRef<SyncService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
