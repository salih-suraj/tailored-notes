// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'care_plans_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$carePlansRepositoryHash() =>
    r'0cdce560d7740914f0ed473b3d3c0e45584bb805';

/// See also [carePlansRepository].
@ProviderFor(carePlansRepository)
final carePlansRepositoryProvider =
    AutoDisposeProvider<CarePlansRepository>.internal(
      carePlansRepository,
      name: r'carePlansRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$carePlansRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CarePlansRepositoryRef = AutoDisposeProviderRef<CarePlansRepository>;
String _$carePlansHash() => r'18dc3da034c1067d5f06fde8f1b24996879e50c3';

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

/// Live stream of care plans for [childId], newest first.
///
/// Copied from [carePlans].
@ProviderFor(carePlans)
const carePlansProvider = CarePlansFamily();

/// Live stream of care plans for [childId], newest first.
///
/// Copied from [carePlans].
class CarePlansFamily extends Family<AsyncValue<List<CarePlan>>> {
  /// Live stream of care plans for [childId], newest first.
  ///
  /// Copied from [carePlans].
  const CarePlansFamily();

  /// Live stream of care plans for [childId], newest first.
  ///
  /// Copied from [carePlans].
  CarePlansProvider call(String childId) {
    return CarePlansProvider(childId);
  }

  @override
  CarePlansProvider getProviderOverride(covariant CarePlansProvider provider) {
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
  String? get name => r'carePlansProvider';
}

/// Live stream of care plans for [childId], newest first.
///
/// Copied from [carePlans].
class CarePlansProvider extends AutoDisposeStreamProvider<List<CarePlan>> {
  /// Live stream of care plans for [childId], newest first.
  ///
  /// Copied from [carePlans].
  CarePlansProvider(String childId)
    : this._internal(
        (ref) => carePlans(ref as CarePlansRef, childId),
        from: carePlansProvider,
        name: r'carePlansProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$carePlansHash,
        dependencies: CarePlansFamily._dependencies,
        allTransitiveDependencies: CarePlansFamily._allTransitiveDependencies,
        childId: childId,
      );

  CarePlansProvider._internal(
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
    Stream<List<CarePlan>> Function(CarePlansRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CarePlansProvider._internal(
        (ref) => create(ref as CarePlansRef),
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
  AutoDisposeStreamProviderElement<List<CarePlan>> createElement() {
    return _CarePlansProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CarePlansProvider && other.childId == childId;
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
mixin CarePlansRef on AutoDisposeStreamProviderRef<List<CarePlan>> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _CarePlansProviderElement
    extends AutoDisposeStreamProviderElement<List<CarePlan>>
    with CarePlansRef {
  _CarePlansProviderElement(super.provider);

  @override
  String get childId => (origin as CarePlansProvider).childId;
}

String _$carePlanGoalsHash() => r'9e24169f28f5f63c9529cca8934eec7f687bfec1';

/// Live stream of goals for [carePlanId], sorted by order then created date.
///
/// Copied from [carePlanGoals].
@ProviderFor(carePlanGoals)
const carePlanGoalsProvider = CarePlanGoalsFamily();

/// Live stream of goals for [carePlanId], sorted by order then created date.
///
/// Copied from [carePlanGoals].
class CarePlanGoalsFamily extends Family<AsyncValue<List<CarePlanGoal>>> {
  /// Live stream of goals for [carePlanId], sorted by order then created date.
  ///
  /// Copied from [carePlanGoals].
  const CarePlanGoalsFamily();

  /// Live stream of goals for [carePlanId], sorted by order then created date.
  ///
  /// Copied from [carePlanGoals].
  CarePlanGoalsProvider call(String carePlanId) {
    return CarePlanGoalsProvider(carePlanId);
  }

  @override
  CarePlanGoalsProvider getProviderOverride(
    covariant CarePlanGoalsProvider provider,
  ) {
    return call(provider.carePlanId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'carePlanGoalsProvider';
}

/// Live stream of goals for [carePlanId], sorted by order then created date.
///
/// Copied from [carePlanGoals].
class CarePlanGoalsProvider
    extends AutoDisposeStreamProvider<List<CarePlanGoal>> {
  /// Live stream of goals for [carePlanId], sorted by order then created date.
  ///
  /// Copied from [carePlanGoals].
  CarePlanGoalsProvider(String carePlanId)
    : this._internal(
        (ref) => carePlanGoals(ref as CarePlanGoalsRef, carePlanId),
        from: carePlanGoalsProvider,
        name: r'carePlanGoalsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$carePlanGoalsHash,
        dependencies: CarePlanGoalsFamily._dependencies,
        allTransitiveDependencies:
            CarePlanGoalsFamily._allTransitiveDependencies,
        carePlanId: carePlanId,
      );

  CarePlanGoalsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.carePlanId,
  }) : super.internal();

  final String carePlanId;

  @override
  Override overrideWith(
    Stream<List<CarePlanGoal>> Function(CarePlanGoalsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CarePlanGoalsProvider._internal(
        (ref) => create(ref as CarePlanGoalsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        carePlanId: carePlanId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<CarePlanGoal>> createElement() {
    return _CarePlanGoalsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CarePlanGoalsProvider && other.carePlanId == carePlanId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, carePlanId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CarePlanGoalsRef on AutoDisposeStreamProviderRef<List<CarePlanGoal>> {
  /// The parameter `carePlanId` of this provider.
  String get carePlanId;
}

class _CarePlanGoalsProviderElement
    extends AutoDisposeStreamProviderElement<List<CarePlanGoal>>
    with CarePlanGoalsRef {
  _CarePlanGoalsProviderElement(super.provider);

  @override
  String get carePlanId => (origin as CarePlanGoalsProvider).carePlanId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
