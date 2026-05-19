// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectivityHash() => r'59a63c90973f1e1b35f3d22e08aa91406cbfa045';

/// Streams the current network connectivity state.
///
/// Copied from [connectivity].
@ProviderFor(connectivity)
final connectivityProvider =
    AutoDisposeStreamProvider<List<ConnectivityResult>>.internal(
      connectivity,
      name: r'connectivityProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$connectivityHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConnectivityRef =
    AutoDisposeStreamProviderRef<List<ConnectivityResult>>;
String _$isOnlineHash() => r'07e0f4650dc373832ceac643b20a52e712a47dd2';

/// True when any network interface is available.
///
/// Copied from [isOnline].
@ProviderFor(isOnline)
final isOnlineProvider = AutoDisposeProvider<bool>.internal(
  isOnline,
  name: r'isOnlineProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isOnlineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsOnlineRef = AutoDisposeProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
