// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'children_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$childrenRepositoryHash() =>
    r'd3e5a903768272ed9d6396983fba0b79be05b420';

/// See also [childrenRepository].
@ProviderFor(childrenRepository)
final childrenRepositoryProvider =
    AutoDisposeProvider<ChildrenRepository>.internal(
      childrenRepository,
      name: r'childrenRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$childrenRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ChildrenRepositoryRef = AutoDisposeProviderRef<ChildrenRepository>;
String _$childrenHash() => r'2fb380a89cdfc4226e6f4af0cf04e9fa989e8c8c';

/// See also [children].
@ProviderFor(children)
final childrenProvider = AutoDisposeStreamProvider<List<Child>>.internal(
  children,
  name: r'childrenProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$childrenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ChildrenRef = AutoDisposeStreamProviderRef<List<Child>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
