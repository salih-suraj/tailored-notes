// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_diary_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$foodEntriesRepositoryHash() =>
    r'1c3ba8d6bfeb22b803aa456a66678556952c5a69';

/// See also [foodEntriesRepository].
@ProviderFor(foodEntriesRepository)
final foodEntriesRepositoryProvider =
    AutoDisposeProvider<FoodEntriesRepository>.internal(
      foodEntriesRepository,
      name: r'foodEntriesRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$foodEntriesRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FoodEntriesRepositoryRef =
    AutoDisposeProviderRef<FoodEntriesRepository>;
String _$foodEntriesHash() => r'7b0ebe714fa59e78bf69d95b6fbea91c27497d00';

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

/// Live stream of food entries for [childId], newest first.
///
/// Copied from [foodEntries].
@ProviderFor(foodEntries)
const foodEntriesProvider = FoodEntriesFamily();

/// Live stream of food entries for [childId], newest first.
///
/// Copied from [foodEntries].
class FoodEntriesFamily extends Family<AsyncValue<List<FoodEntry>>> {
  /// Live stream of food entries for [childId], newest first.
  ///
  /// Copied from [foodEntries].
  const FoodEntriesFamily();

  /// Live stream of food entries for [childId], newest first.
  ///
  /// Copied from [foodEntries].
  FoodEntriesProvider call(String childId) {
    return FoodEntriesProvider(childId);
  }

  @override
  FoodEntriesProvider getProviderOverride(
    covariant FoodEntriesProvider provider,
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
  String? get name => r'foodEntriesProvider';
}

/// Live stream of food entries for [childId], newest first.
///
/// Copied from [foodEntries].
class FoodEntriesProvider extends AutoDisposeStreamProvider<List<FoodEntry>> {
  /// Live stream of food entries for [childId], newest first.
  ///
  /// Copied from [foodEntries].
  FoodEntriesProvider(String childId)
    : this._internal(
        (ref) => foodEntries(ref as FoodEntriesRef, childId),
        from: foodEntriesProvider,
        name: r'foodEntriesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$foodEntriesHash,
        dependencies: FoodEntriesFamily._dependencies,
        allTransitiveDependencies: FoodEntriesFamily._allTransitiveDependencies,
        childId: childId,
      );

  FoodEntriesProvider._internal(
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
    Stream<List<FoodEntry>> Function(FoodEntriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FoodEntriesProvider._internal(
        (ref) => create(ref as FoodEntriesRef),
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
  AutoDisposeStreamProviderElement<List<FoodEntry>> createElement() {
    return _FoodEntriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FoodEntriesProvider && other.childId == childId;
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
mixin FoodEntriesRef on AutoDisposeStreamProviderRef<List<FoodEntry>> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _FoodEntriesProviderElement
    extends AutoDisposeStreamProviderElement<List<FoodEntry>>
    with FoodEntriesRef {
  _FoodEntriesProviderElement(super.provider);

  @override
  String get childId => (origin as FoodEntriesProvider).childId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
