// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'behaviour_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$behaviourRepositoryHash() =>
    r'd29828535e82171d7dbded9a46a5dc0bbface296';

/// See also [behaviourRepository].
@ProviderFor(behaviourRepository)
final behaviourRepositoryProvider =
    AutoDisposeProvider<BehaviourIncidentsRepository>.internal(
      behaviourRepository,
      name: r'behaviourRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$behaviourRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BehaviourRepositoryRef =
    AutoDisposeProviderRef<BehaviourIncidentsRepository>;
String _$behaviourIncidentsHash() =>
    r'75d77e4f89d73965501495dadb6bef47a6ba6cca';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Live stream of behaviour incidents for [childId], newest first.
///
/// Copied from [behaviourIncidents].
@ProviderFor(behaviourIncidents)
const behaviourIncidentsProvider = BehaviourIncidentsFamily();

/// Live stream of behaviour incidents for [childId], newest first.
///
/// Copied from [behaviourIncidents].
class BehaviourIncidentsFamily
    extends Family<AsyncValue<List<BehaviourIncident>>> {
  /// Live stream of behaviour incidents for [childId], newest first.
  ///
  /// Copied from [behaviourIncidents].
  const BehaviourIncidentsFamily();

  /// Live stream of behaviour incidents for [childId], newest first.
  ///
  /// Copied from [behaviourIncidents].
  BehaviourIncidentsProvider call(String childId) {
    return BehaviourIncidentsProvider(childId);
  }

  @override
  BehaviourIncidentsProvider getProviderOverride(
    covariant BehaviourIncidentsProvider provider,
  ) {
    return call(provider.childId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'behaviourIncidentsProvider';
}

/// Live stream of behaviour incidents for [childId], newest first.
///
/// Copied from [behaviourIncidents].
class BehaviourIncidentsProvider
    extends AutoDisposeStreamProvider<List<BehaviourIncident>> {
  /// Live stream of behaviour incidents for [childId], newest first.
  ///
  /// Copied from [behaviourIncidents].
  BehaviourIncidentsProvider(String childId)
    : this._internal(
        (ref) => behaviourIncidents(ref as BehaviourIncidentsRef, childId),
        from: behaviourIncidentsProvider,
        name: r'behaviourIncidentsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$behaviourIncidentsHash,
        dependencies: BehaviourIncidentsFamily._dependencies,
        allTransitiveDependencies:
            BehaviourIncidentsFamily._allTransitiveDependencies,
        childId: childId,
      );

  BehaviourIncidentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.childId,
  }) : super.internal();

  final String childId;

  @override
  Override overrideWith(
    Stream<List<BehaviourIncident>> Function(BehaviourIncidentsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BehaviourIncidentsProvider._internal(
        (ref) => create(ref as BehaviourIncidentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        childId: childId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<BehaviourIncident>> createElement() {
    return _BehaviourIncidentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BehaviourIncidentsProvider && other.childId == childId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, childId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BehaviourIncidentsRef
    on AutoDisposeStreamProviderRef<List<BehaviourIncident>> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _BehaviourIncidentsProviderElement
    extends AutoDisposeStreamProviderElement<List<BehaviourIncident>>
    with BehaviourIncidentsRef {
  _BehaviourIncidentsProviderElement(super.provider);

  @override
  String get childId => (origin as BehaviourIncidentsProvider).childId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
