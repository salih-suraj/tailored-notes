// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checklistItemsRepositoryHash() =>
    r'65b90dd6afc88f52196adad887ce2784e055c027';

/// See also [checklistItemsRepository].
@ProviderFor(checklistItemsRepository)
final checklistItemsRepositoryProvider =
    AutoDisposeProvider<ChecklistItemsRepository>.internal(
      checklistItemsRepository,
      name: r'checklistItemsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$checklistItemsRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ChecklistItemsRepositoryRef =
    AutoDisposeProviderRef<ChecklistItemsRepository>;
String _$roomChecklistHash() => r'4edc7fb570431c18ea9ed61d7089be79436d5c0d';

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

/// Live stream of bedroom cleaning tasks for [childId] on today's current shift.
///
/// Copied from [roomChecklist].
@ProviderFor(roomChecklist)
const roomChecklistProvider = RoomChecklistFamily();

/// Live stream of bedroom cleaning tasks for [childId] on today's current shift.
///
/// Copied from [roomChecklist].
class RoomChecklistFamily extends Family<AsyncValue<List<ChecklistItem>>> {
  /// Live stream of bedroom cleaning tasks for [childId] on today's current shift.
  ///
  /// Copied from [roomChecklist].
  const RoomChecklistFamily();

  /// Live stream of bedroom cleaning tasks for [childId] on today's current shift.
  ///
  /// Copied from [roomChecklist].
  RoomChecklistProvider call(String childId) {
    return RoomChecklistProvider(childId);
  }

  @override
  RoomChecklistProvider getProviderOverride(
    covariant RoomChecklistProvider provider,
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
  String? get name => r'roomChecklistProvider';
}

/// Live stream of bedroom cleaning tasks for [childId] on today's current shift.
///
/// Copied from [roomChecklist].
class RoomChecklistProvider
    extends AutoDisposeStreamProvider<List<ChecklistItem>> {
  /// Live stream of bedroom cleaning tasks for [childId] on today's current shift.
  ///
  /// Copied from [roomChecklist].
  RoomChecklistProvider(String childId)
    : this._internal(
        (ref) => roomChecklist(ref as RoomChecklistRef, childId),
        from: roomChecklistProvider,
        name: r'roomChecklistProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$roomChecklistHash,
        dependencies: RoomChecklistFamily._dependencies,
        allTransitiveDependencies:
            RoomChecklistFamily._allTransitiveDependencies,
        childId: childId,
      );

  RoomChecklistProvider._internal(
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
    Stream<List<ChecklistItem>> Function(RoomChecklistRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomChecklistProvider._internal(
        (ref) => create(ref as RoomChecklistRef),
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
  AutoDisposeStreamProviderElement<List<ChecklistItem>> createElement() {
    return _RoomChecklistProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomChecklistProvider && other.childId == childId;
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
mixin RoomChecklistRef on AutoDisposeStreamProviderRef<List<ChecklistItem>> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _RoomChecklistProviderElement
    extends AutoDisposeStreamProviderElement<List<ChecklistItem>>
    with RoomChecklistRef {
  _RoomChecklistProviderElement(super.provider);

  @override
  String get childId => (origin as RoomChecklistProvider).childId;
}

String _$communalChecklistHash() => r'87489bfae156efbcd5d44097c597308902a3bca1';

/// Live stream of communal cleaning tasks for the home on today's current shift.
///
/// Copied from [communalChecklist].
@ProviderFor(communalChecklist)
final communalChecklistProvider =
    AutoDisposeStreamProvider<List<ChecklistItem>>.internal(
      communalChecklist,
      name: r'communalChecklistProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$communalChecklistHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CommunalChecklistRef =
    AutoDisposeStreamProviderRef<List<ChecklistItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
