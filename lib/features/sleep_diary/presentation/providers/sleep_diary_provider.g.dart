// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_diary_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sleepEntriesRepositoryHash() =>
    r'f764333d7cb9fbd5152d76b106f2ac6bb0330af4';

/// See also [sleepEntriesRepository].
@ProviderFor(sleepEntriesRepository)
final sleepEntriesRepositoryProvider =
    AutoDisposeProvider<SleepEntriesRepository>.internal(
      sleepEntriesRepository,
      name: r'sleepEntriesRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sleepEntriesRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SleepEntriesRepositoryRef =
    AutoDisposeProviderRef<SleepEntriesRepository>;
String _$sleepEntriesHash() => r'06ae9a3198f4527350fc346419b89773e11bd212';

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

/// Live stream of sleep entries for [childId], newest first.
///
/// Copied from [sleepEntries].
@ProviderFor(sleepEntries)
const sleepEntriesProvider = SleepEntriesFamily();

/// Live stream of sleep entries for [childId], newest first.
///
/// Copied from [sleepEntries].
class SleepEntriesFamily extends Family<AsyncValue<List<SleepEntry>>> {
  /// Live stream of sleep entries for [childId], newest first.
  ///
  /// Copied from [sleepEntries].
  const SleepEntriesFamily();

  /// Live stream of sleep entries for [childId], newest first.
  ///
  /// Copied from [sleepEntries].
  SleepEntriesProvider call(String childId) {
    return SleepEntriesProvider(childId);
  }

  @override
  SleepEntriesProvider getProviderOverride(
    covariant SleepEntriesProvider provider,
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
  String? get name => r'sleepEntriesProvider';
}

/// Live stream of sleep entries for [childId], newest first.
///
/// Copied from [sleepEntries].
class SleepEntriesProvider extends AutoDisposeStreamProvider<List<SleepEntry>> {
  /// Live stream of sleep entries for [childId], newest first.
  ///
  /// Copied from [sleepEntries].
  SleepEntriesProvider(String childId)
    : this._internal(
        (ref) => sleepEntries(ref as SleepEntriesRef, childId),
        from: sleepEntriesProvider,
        name: r'sleepEntriesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$sleepEntriesHash,
        dependencies: SleepEntriesFamily._dependencies,
        allTransitiveDependencies:
            SleepEntriesFamily._allTransitiveDependencies,
        childId: childId,
      );

  SleepEntriesProvider._internal(
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
    Stream<List<SleepEntry>> Function(SleepEntriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SleepEntriesProvider._internal(
        (ref) => create(ref as SleepEntriesRef),
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
  AutoDisposeStreamProviderElement<List<SleepEntry>> createElement() {
    return _SleepEntriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SleepEntriesProvider && other.childId == childId;
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
mixin SleepEntriesRef on AutoDisposeStreamProviderRef<List<SleepEntry>> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _SleepEntriesProviderElement
    extends AutoDisposeStreamProviderElement<List<SleepEntry>>
    with SleepEntriesRef {
  _SleepEntriesProviderElement(super.provider);

  @override
  String get childId => (origin as SleepEntriesProvider).childId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
