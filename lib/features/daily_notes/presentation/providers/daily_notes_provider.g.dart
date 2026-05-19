// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_notes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dailyNotesRepositoryHash() =>
    r'96391b4a07482ec8a58e4ff8f982adb1d3ca4b21';

/// Provides a [DailyNotesRepository] wired to the current DAO, client, user, and audit writer.
///
/// Copied from [dailyNotesRepository].
@ProviderFor(dailyNotesRepository)
final dailyNotesRepositoryProvider =
    AutoDisposeProvider<DailyNotesRepository>.internal(
      dailyNotesRepository,
      name: r'dailyNotesRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$dailyNotesRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DailyNotesRepositoryRef = AutoDisposeProviderRef<DailyNotesRepository>;
String _$dailyNotesHash() => r'27c43490537f589199534d3f86581beb85e72049';

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

/// Live stream of notes for [childId].
///
/// Copied from [dailyNotes].
@ProviderFor(dailyNotes)
const dailyNotesProvider = DailyNotesFamily();

/// Live stream of notes for [childId].
///
/// Copied from [dailyNotes].
class DailyNotesFamily extends Family<AsyncValue<List<DailyNote>>> {
  /// Live stream of notes for [childId].
  ///
  /// Copied from [dailyNotes].
  const DailyNotesFamily();

  /// Live stream of notes for [childId].
  ///
  /// Copied from [dailyNotes].
  DailyNotesProvider call(String childId) {
    return DailyNotesProvider(childId);
  }

  @override
  DailyNotesProvider getProviderOverride(
    covariant DailyNotesProvider provider,
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
  String? get name => r'dailyNotesProvider';
}

/// Live stream of notes for [childId].
///
/// Copied from [dailyNotes].
class DailyNotesProvider extends AutoDisposeStreamProvider<List<DailyNote>> {
  /// Live stream of notes for [childId].
  ///
  /// Copied from [dailyNotes].
  DailyNotesProvider(String childId)
    : this._internal(
        (ref) => dailyNotes(ref as DailyNotesRef, childId),
        from: dailyNotesProvider,
        name: r'dailyNotesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$dailyNotesHash,
        dependencies: DailyNotesFamily._dependencies,
        allTransitiveDependencies: DailyNotesFamily._allTransitiveDependencies,
        childId: childId,
      );

  DailyNotesProvider._internal(
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
    Stream<List<DailyNote>> Function(DailyNotesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DailyNotesProvider._internal(
        (ref) => create(ref as DailyNotesRef),
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
  AutoDisposeStreamProviderElement<List<DailyNote>> createElement() {
    return _DailyNotesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DailyNotesProvider && other.childId == childId;
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
mixin DailyNotesRef on AutoDisposeStreamProviderRef<List<DailyNote>> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _DailyNotesProviderElement
    extends AutoDisposeStreamProviderElement<List<DailyNote>>
    with DailyNotesRef {
  _DailyNotesProviderElement(super.provider);

  @override
  String get childId => (origin as DailyNotesProvider).childId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
