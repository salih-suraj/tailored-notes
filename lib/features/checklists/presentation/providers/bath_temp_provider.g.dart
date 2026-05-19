// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bath_temp_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bathTempRepositoryHash() =>
    r'b7df7a13c77c3fe388d8dc8b2ccfc4d05bc90432';

/// See also [bathTempRepository].
@ProviderFor(bathTempRepository)
final bathTempRepositoryProvider =
    AutoDisposeProvider<BathTempRepository>.internal(
      bathTempRepository,
      name: r'bathTempRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$bathTempRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BathTempRepositoryRef = AutoDisposeProviderRef<BathTempRepository>;
String _$bathTempTodayHash() => r'7af48d9c4ae0926d1c1e1f164987fc126ebe5dd6';

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

/// Live stream of today's bath temp records for [childId].
///
/// Copied from [bathTempToday].
@ProviderFor(bathTempToday)
const bathTempTodayProvider = BathTempTodayFamily();

/// Live stream of today's bath temp records for [childId].
///
/// Copied from [bathTempToday].
class BathTempTodayFamily extends Family<AsyncValue<List<BathTempRecord>>> {
  /// Live stream of today's bath temp records for [childId].
  ///
  /// Copied from [bathTempToday].
  const BathTempTodayFamily();

  /// Live stream of today's bath temp records for [childId].
  ///
  /// Copied from [bathTempToday].
  BathTempTodayProvider call(String childId) {
    return BathTempTodayProvider(childId);
  }

  @override
  BathTempTodayProvider getProviderOverride(
    covariant BathTempTodayProvider provider,
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
  String? get name => r'bathTempTodayProvider';
}

/// Live stream of today's bath temp records for [childId].
///
/// Copied from [bathTempToday].
class BathTempTodayProvider
    extends AutoDisposeStreamProvider<List<BathTempRecord>> {
  /// Live stream of today's bath temp records for [childId].
  ///
  /// Copied from [bathTempToday].
  BathTempTodayProvider(String childId)
    : this._internal(
        (ref) => bathTempToday(ref as BathTempTodayRef, childId),
        from: bathTempTodayProvider,
        name: r'bathTempTodayProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$bathTempTodayHash,
        dependencies: BathTempTodayFamily._dependencies,
        allTransitiveDependencies:
            BathTempTodayFamily._allTransitiveDependencies,
        childId: childId,
      );

  BathTempTodayProvider._internal(
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
    Stream<List<BathTempRecord>> Function(BathTempTodayRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BathTempTodayProvider._internal(
        (ref) => create(ref as BathTempTodayRef),
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
  AutoDisposeStreamProviderElement<List<BathTempRecord>> createElement() {
    return _BathTempTodayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BathTempTodayProvider && other.childId == childId;
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
mixin BathTempTodayRef on AutoDisposeStreamProviderRef<List<BathTempRecord>> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _BathTempTodayProviderElement
    extends AutoDisposeStreamProviderElement<List<BathTempRecord>>
    with BathTempTodayRef {
  _BathTempTodayProviderElement(super.provider);

  @override
  String get childId => (origin as BathTempTodayProvider).childId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
