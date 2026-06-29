// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_portal_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$parentLinksRepositoryHash() =>
    r'88e9aca978de8c2c8ac5133396bbfcf11f30118b';

/// See also [parentLinksRepository].
@ProviderFor(parentLinksRepository)
final parentLinksRepositoryProvider =
    AutoDisposeProvider<ParentLinksRepository>.internal(
      parentLinksRepository,
      name: r'parentLinksRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$parentLinksRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ParentLinksRepositoryRef =
    AutoDisposeProviderRef<ParentLinksRepository>;
String _$parentRecordsRepositoryHash() =>
    r'1eb031322eb8bd771fc4e3a6e443f965f72f5d2f';

/// See also [parentRecordsRepository].
@ProviderFor(parentRecordsRepository)
final parentRecordsRepositoryProvider =
    AutoDisposeProvider<ParentRecordsRepository>.internal(
      parentRecordsRepository,
      name: r'parentRecordsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$parentRecordsRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ParentRecordsRepositoryRef =
    AutoDisposeProviderRef<ParentRecordsRepository>;
String _$myParentLinksHash() => r'fec99a7e196a6ca0039bc75b5be238d4cc18bae3';

/// Active child links for the signed-in parent.
///
/// Copied from [myParentLinks].
@ProviderFor(myParentLinks)
final myParentLinksProvider =
    AutoDisposeFutureProvider<List<ParentLink>>.internal(
      myParentLinks,
      name: r'myParentLinksProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$myParentLinksHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MyParentLinksRef = AutoDisposeFutureProviderRef<List<ParentLink>>;
String _$parentLinkByIdHash() => r'e3b51e49279fe8e714376f9a72e4ea6b43a422ec';

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

/// A single active link by id, for the child feed screen.
///
/// Copied from [parentLinkById].
@ProviderFor(parentLinkById)
const parentLinkByIdProvider = ParentLinkByIdFamily();

/// A single active link by id, for the child feed screen.
///
/// Copied from [parentLinkById].
class ParentLinkByIdFamily extends Family<AsyncValue<ParentLink?>> {
  /// A single active link by id, for the child feed screen.
  ///
  /// Copied from [parentLinkById].
  const ParentLinkByIdFamily();

  /// A single active link by id, for the child feed screen.
  ///
  /// Copied from [parentLinkById].
  ParentLinkByIdProvider call(String linkId) {
    return ParentLinkByIdProvider(linkId);
  }

  @override
  ParentLinkByIdProvider getProviderOverride(
    covariant ParentLinkByIdProvider provider,
  ) {
    return call(provider.linkId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'parentLinkByIdProvider';
}

/// A single active link by id, for the child feed screen.
///
/// Copied from [parentLinkById].
class ParentLinkByIdProvider extends AutoDisposeFutureProvider<ParentLink?> {
  /// A single active link by id, for the child feed screen.
  ///
  /// Copied from [parentLinkById].
  ParentLinkByIdProvider(String linkId)
    : this._internal(
        (ref) => parentLinkById(ref as ParentLinkByIdRef, linkId),
        from: parentLinkByIdProvider,
        name: r'parentLinkByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$parentLinkByIdHash,
        dependencies: ParentLinkByIdFamily._dependencies,
        allTransitiveDependencies:
            ParentLinkByIdFamily._allTransitiveDependencies,
        linkId: linkId,
      );

  ParentLinkByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.linkId,
  }) : super.internal();

  final String linkId;

  @override
  Override overrideWith(
    FutureOr<ParentLink?> Function(ParentLinkByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ParentLinkByIdProvider._internal(
        (ref) => create(ref as ParentLinkByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        linkId: linkId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ParentLink?> createElement() {
    return _ParentLinkByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ParentLinkByIdProvider && other.linkId == linkId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, linkId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ParentLinkByIdRef on AutoDisposeFutureProviderRef<ParentLink?> {
  /// The parameter `linkId` of this provider.
  String get linkId;
}

class _ParentLinkByIdProviderElement
    extends AutoDisposeFutureProviderElement<ParentLink?>
    with ParentLinkByIdRef {
  _ParentLinkByIdProviderElement(super.provider);

  @override
  String get linkId => (origin as ParentLinkByIdProvider).linkId;
}

String _$parentLinksForHomeHash() =>
    r'339849fd68bcef84484954baade1129fc0c6a3a0';

/// All links (active + revoked) for [homeId]. Manager view.
///
/// Copied from [parentLinksForHome].
@ProviderFor(parentLinksForHome)
const parentLinksForHomeProvider = ParentLinksForHomeFamily();

/// All links (active + revoked) for [homeId]. Manager view.
///
/// Copied from [parentLinksForHome].
class ParentLinksForHomeFamily extends Family<AsyncValue<List<ParentLink>>> {
  /// All links (active + revoked) for [homeId]. Manager view.
  ///
  /// Copied from [parentLinksForHome].
  const ParentLinksForHomeFamily();

  /// All links (active + revoked) for [homeId]. Manager view.
  ///
  /// Copied from [parentLinksForHome].
  ParentLinksForHomeProvider call(String homeId) {
    return ParentLinksForHomeProvider(homeId);
  }

  @override
  ParentLinksForHomeProvider getProviderOverride(
    covariant ParentLinksForHomeProvider provider,
  ) {
    return call(provider.homeId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'parentLinksForHomeProvider';
}

/// All links (active + revoked) for [homeId]. Manager view.
///
/// Copied from [parentLinksForHome].
class ParentLinksForHomeProvider
    extends AutoDisposeFutureProvider<List<ParentLink>> {
  /// All links (active + revoked) for [homeId]. Manager view.
  ///
  /// Copied from [parentLinksForHome].
  ParentLinksForHomeProvider(String homeId)
    : this._internal(
        (ref) => parentLinksForHome(ref as ParentLinksForHomeRef, homeId),
        from: parentLinksForHomeProvider,
        name: r'parentLinksForHomeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$parentLinksForHomeHash,
        dependencies: ParentLinksForHomeFamily._dependencies,
        allTransitiveDependencies:
            ParentLinksForHomeFamily._allTransitiveDependencies,
        homeId: homeId,
      );

  ParentLinksForHomeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.homeId,
  }) : super.internal();

  final String homeId;

  @override
  Override overrideWith(
    FutureOr<List<ParentLink>> Function(ParentLinksForHomeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ParentLinksForHomeProvider._internal(
        (ref) => create(ref as ParentLinksForHomeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        homeId: homeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ParentLink>> createElement() {
    return _ParentLinksForHomeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ParentLinksForHomeProvider && other.homeId == homeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, homeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ParentLinksForHomeRef on AutoDisposeFutureProviderRef<List<ParentLink>> {
  /// The parameter `homeId` of this provider.
  String get homeId;
}

class _ParentLinksForHomeProviderElement
    extends AutoDisposeFutureProviderElement<List<ParentLink>>
    with ParentLinksForHomeRef {
  _ParentLinksForHomeProviderElement(super.provider);

  @override
  String get homeId => (origin as ParentLinksForHomeProvider).homeId;
}

String _$parentSearchHash() => r'fb66e26f9fd8959164d67ba2ae7519785fbf9f48';

/// Parent accounts matching [query], for the link-creation form.
///
/// Copied from [parentSearch].
@ProviderFor(parentSearch)
const parentSearchProvider = ParentSearchFamily();

/// Parent accounts matching [query], for the link-creation form.
///
/// Copied from [parentSearch].
class ParentSearchFamily extends Family<AsyncValue<List<ParentAccount>>> {
  /// Parent accounts matching [query], for the link-creation form.
  ///
  /// Copied from [parentSearch].
  const ParentSearchFamily();

  /// Parent accounts matching [query], for the link-creation form.
  ///
  /// Copied from [parentSearch].
  ParentSearchProvider call(String query) {
    return ParentSearchProvider(query);
  }

  @override
  ParentSearchProvider getProviderOverride(
    covariant ParentSearchProvider provider,
  ) {
    return call(provider.query);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'parentSearchProvider';
}

/// Parent accounts matching [query], for the link-creation form.
///
/// Copied from [parentSearch].
class ParentSearchProvider
    extends AutoDisposeFutureProvider<List<ParentAccount>> {
  /// Parent accounts matching [query], for the link-creation form.
  ///
  /// Copied from [parentSearch].
  ParentSearchProvider(String query)
    : this._internal(
        (ref) => parentSearch(ref as ParentSearchRef, query),
        from: parentSearchProvider,
        name: r'parentSearchProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$parentSearchHash,
        dependencies: ParentSearchFamily._dependencies,
        allTransitiveDependencies:
            ParentSearchFamily._allTransitiveDependencies,
        query: query,
      );

  ParentSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<ParentAccount>> Function(ParentSearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ParentSearchProvider._internal(
        (ref) => create(ref as ParentSearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ParentAccount>> createElement() {
    return _ParentSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ParentSearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ParentSearchRef on AutoDisposeFutureProviderRef<List<ParentAccount>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _ParentSearchProviderElement
    extends AutoDisposeFutureProviderElement<List<ParentAccount>>
    with ParentSearchRef {
  _ParentSearchProviderElement(super.provider);

  @override
  String get query => (origin as ParentSearchProvider).query;
}

String _$parentAccountsForHomeHash() =>
    r'841f487c48445540cf90c00effaa89a589aca436';

/// All parent accounts in [homeId]. Manager "Accounts" tab.
///
/// Copied from [parentAccountsForHome].
@ProviderFor(parentAccountsForHome)
const parentAccountsForHomeProvider = ParentAccountsForHomeFamily();

/// All parent accounts in [homeId]. Manager "Accounts" tab.
///
/// Copied from [parentAccountsForHome].
class ParentAccountsForHomeFamily
    extends Family<AsyncValue<List<ParentAccount>>> {
  /// All parent accounts in [homeId]. Manager "Accounts" tab.
  ///
  /// Copied from [parentAccountsForHome].
  const ParentAccountsForHomeFamily();

  /// All parent accounts in [homeId]. Manager "Accounts" tab.
  ///
  /// Copied from [parentAccountsForHome].
  ParentAccountsForHomeProvider call(String homeId) {
    return ParentAccountsForHomeProvider(homeId);
  }

  @override
  ParentAccountsForHomeProvider getProviderOverride(
    covariant ParentAccountsForHomeProvider provider,
  ) {
    return call(provider.homeId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'parentAccountsForHomeProvider';
}

/// All parent accounts in [homeId]. Manager "Accounts" tab.
///
/// Copied from [parentAccountsForHome].
class ParentAccountsForHomeProvider
    extends AutoDisposeFutureProvider<List<ParentAccount>> {
  /// All parent accounts in [homeId]. Manager "Accounts" tab.
  ///
  /// Copied from [parentAccountsForHome].
  ParentAccountsForHomeProvider(String homeId)
    : this._internal(
        (ref) => parentAccountsForHome(ref as ParentAccountsForHomeRef, homeId),
        from: parentAccountsForHomeProvider,
        name: r'parentAccountsForHomeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$parentAccountsForHomeHash,
        dependencies: ParentAccountsForHomeFamily._dependencies,
        allTransitiveDependencies:
            ParentAccountsForHomeFamily._allTransitiveDependencies,
        homeId: homeId,
      );

  ParentAccountsForHomeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.homeId,
  }) : super.internal();

  final String homeId;

  @override
  Override overrideWith(
    FutureOr<List<ParentAccount>> Function(ParentAccountsForHomeRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ParentAccountsForHomeProvider._internal(
        (ref) => create(ref as ParentAccountsForHomeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        homeId: homeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ParentAccount>> createElement() {
    return _ParentAccountsForHomeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ParentAccountsForHomeProvider && other.homeId == homeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, homeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ParentAccountsForHomeRef
    on AutoDisposeFutureProviderRef<List<ParentAccount>> {
  /// The parameter `homeId` of this provider.
  String get homeId;
}

class _ParentAccountsForHomeProviderElement
    extends AutoDisposeFutureProviderElement<List<ParentAccount>>
    with ParentAccountsForHomeRef {
  _ParentAccountsForHomeProviderElement(super.provider);

  @override
  String get homeId => (origin as ParentAccountsForHomeProvider).homeId;
}

String _$parentChildActivitiesHash() =>
    r'e163f343c1f92ff9fa8ef9396a91a3467cb5f917';

/// Activity/achievement records for a linked child.
///
/// Copied from [parentChildActivities].
@ProviderFor(parentChildActivities)
const parentChildActivitiesProvider = ParentChildActivitiesFamily();

/// Activity/achievement records for a linked child.
///
/// Copied from [parentChildActivities].
class ParentChildActivitiesFamily
    extends Family<AsyncValue<List<Map<String, dynamic>>>> {
  /// Activity/achievement records for a linked child.
  ///
  /// Copied from [parentChildActivities].
  const ParentChildActivitiesFamily();

  /// Activity/achievement records for a linked child.
  ///
  /// Copied from [parentChildActivities].
  ParentChildActivitiesProvider call(String childId) {
    return ParentChildActivitiesProvider(childId);
  }

  @override
  ParentChildActivitiesProvider getProviderOverride(
    covariant ParentChildActivitiesProvider provider,
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
  String? get name => r'parentChildActivitiesProvider';
}

/// Activity/achievement records for a linked child.
///
/// Copied from [parentChildActivities].
class ParentChildActivitiesProvider
    extends AutoDisposeFutureProvider<List<Map<String, dynamic>>> {
  /// Activity/achievement records for a linked child.
  ///
  /// Copied from [parentChildActivities].
  ParentChildActivitiesProvider(String childId)
    : this._internal(
        (ref) =>
            parentChildActivities(ref as ParentChildActivitiesRef, childId),
        from: parentChildActivitiesProvider,
        name: r'parentChildActivitiesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$parentChildActivitiesHash,
        dependencies: ParentChildActivitiesFamily._dependencies,
        allTransitiveDependencies:
            ParentChildActivitiesFamily._allTransitiveDependencies,
        childId: childId,
      );

  ParentChildActivitiesProvider._internal(
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
    FutureOr<List<Map<String, dynamic>>> Function(
      ParentChildActivitiesRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ParentChildActivitiesProvider._internal(
        (ref) => create(ref as ParentChildActivitiesRef),
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
  AutoDisposeFutureProviderElement<List<Map<String, dynamic>>> createElement() {
    return _ParentChildActivitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ParentChildActivitiesProvider && other.childId == childId;
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
mixin ParentChildActivitiesRef
    on AutoDisposeFutureProviderRef<List<Map<String, dynamic>>> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _ParentChildActivitiesProviderElement
    extends AutoDisposeFutureProviderElement<List<Map<String, dynamic>>>
    with ParentChildActivitiesRef {
  _ParentChildActivitiesProviderElement(super.provider);

  @override
  String get childId => (origin as ParentChildActivitiesProvider).childId;
}

String _$parentFormChildrenHash() =>
    r'782fdaab66c1c0ae723cd4bcad898ae2fc2cd633';

/// Children of [homeId] for the manager's link form.
///
/// Copied from [parentFormChildren].
@ProviderFor(parentFormChildren)
const parentFormChildrenProvider = ParentFormChildrenFamily();

/// Children of [homeId] for the manager's link form.
///
/// Copied from [parentFormChildren].
class ParentFormChildrenFamily
    extends Family<AsyncValue<List<Map<String, dynamic>>>> {
  /// Children of [homeId] for the manager's link form.
  ///
  /// Copied from [parentFormChildren].
  const ParentFormChildrenFamily();

  /// Children of [homeId] for the manager's link form.
  ///
  /// Copied from [parentFormChildren].
  ParentFormChildrenProvider call(String homeId) {
    return ParentFormChildrenProvider(homeId);
  }

  @override
  ParentFormChildrenProvider getProviderOverride(
    covariant ParentFormChildrenProvider provider,
  ) {
    return call(provider.homeId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'parentFormChildrenProvider';
}

/// Children of [homeId] for the manager's link form.
///
/// Copied from [parentFormChildren].
class ParentFormChildrenProvider
    extends AutoDisposeFutureProvider<List<Map<String, dynamic>>> {
  /// Children of [homeId] for the manager's link form.
  ///
  /// Copied from [parentFormChildren].
  ParentFormChildrenProvider(String homeId)
    : this._internal(
        (ref) => parentFormChildren(ref as ParentFormChildrenRef, homeId),
        from: parentFormChildrenProvider,
        name: r'parentFormChildrenProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$parentFormChildrenHash,
        dependencies: ParentFormChildrenFamily._dependencies,
        allTransitiveDependencies:
            ParentFormChildrenFamily._allTransitiveDependencies,
        homeId: homeId,
      );

  ParentFormChildrenProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.homeId,
  }) : super.internal();

  final String homeId;

  @override
  Override overrideWith(
    FutureOr<List<Map<String, dynamic>>> Function(
      ParentFormChildrenRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ParentFormChildrenProvider._internal(
        (ref) => create(ref as ParentFormChildrenRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        homeId: homeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Map<String, dynamic>>> createElement() {
    return _ParentFormChildrenProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ParentFormChildrenProvider && other.homeId == homeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, homeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ParentFormChildrenRef
    on AutoDisposeFutureProviderRef<List<Map<String, dynamic>>> {
  /// The parameter `homeId` of this provider.
  String get homeId;
}

class _ParentFormChildrenProviderElement
    extends AutoDisposeFutureProviderElement<List<Map<String, dynamic>>>
    with ParentFormChildrenRef {
  _ParentFormChildrenProviderElement(super.provider);

  @override
  String get homeId => (origin as ParentFormChildrenProvider).homeId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
