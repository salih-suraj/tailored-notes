// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activityEntriesRepositoryHash() =>
    r'2a9bb967a972f36ffdc6d13b8c177eaaa52074ec';

/// See also [activityEntriesRepository].
@ProviderFor(activityEntriesRepository)
final activityEntriesRepositoryProvider =
    AutoDisposeProvider<ActivityEntriesRepository>.internal(
      activityEntriesRepository,
      name: r'activityEntriesRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activityEntriesRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActivityEntriesRepositoryRef =
    AutoDisposeProviderRef<ActivityEntriesRepository>;
String _$activityEntriesHash() => r'856ac0c31a1ab7949728c4dacd3338b573844649';

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

/// Live stream of activity entries for [childId], newest first.
///
/// Copied from [activityEntries].
@ProviderFor(activityEntries)
const activityEntriesProvider = ActivityEntriesFamily();

/// Live stream of activity entries for [childId], newest first.
///
/// Copied from [activityEntries].
class ActivityEntriesFamily extends Family<AsyncValue<List<ActivityEntry>>> {
  /// Live stream of activity entries for [childId], newest first.
  ///
  /// Copied from [activityEntries].
  const ActivityEntriesFamily();

  /// Live stream of activity entries for [childId], newest first.
  ///
  /// Copied from [activityEntries].
  ActivityEntriesProvider call(String childId) {
    return ActivityEntriesProvider(childId);
  }

  @override
  ActivityEntriesProvider getProviderOverride(
    covariant ActivityEntriesProvider provider,
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
  String? get name => r'activityEntriesProvider';
}

/// Live stream of activity entries for [childId], newest first.
///
/// Copied from [activityEntries].
class ActivityEntriesProvider
    extends AutoDisposeStreamProvider<List<ActivityEntry>> {
  /// Live stream of activity entries for [childId], newest first.
  ///
  /// Copied from [activityEntries].
  ActivityEntriesProvider(String childId)
    : this._internal(
        (ref) => activityEntries(ref as ActivityEntriesRef, childId),
        from: activityEntriesProvider,
        name: r'activityEntriesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$activityEntriesHash,
        dependencies: ActivityEntriesFamily._dependencies,
        allTransitiveDependencies:
            ActivityEntriesFamily._allTransitiveDependencies,
        childId: childId,
      );

  ActivityEntriesProvider._internal(
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
    Stream<List<ActivityEntry>> Function(ActivityEntriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ActivityEntriesProvider._internal(
        (ref) => create(ref as ActivityEntriesRef),
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
  AutoDisposeStreamProviderElement<List<ActivityEntry>> createElement() {
    return _ActivityEntriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActivityEntriesProvider && other.childId == childId;
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
mixin ActivityEntriesRef on AutoDisposeStreamProviderRef<List<ActivityEntry>> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _ActivityEntriesProviderElement
    extends AutoDisposeStreamProviderElement<List<ActivityEntry>>
    with ActivityEntriesRef {
  _ActivityEntriesProviderElement(super.provider);

  @override
  String get childId => (origin as ActivityEntriesProvider).childId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
