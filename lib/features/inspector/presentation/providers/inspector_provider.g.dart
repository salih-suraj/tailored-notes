// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspector_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$inspectorGrantsRepositoryHash() =>
    r'93ea0e0c9808ce73af071cb320323de03a98f024';

/// See also [inspectorGrantsRepository].
@ProviderFor(inspectorGrantsRepository)
final inspectorGrantsRepositoryProvider =
    AutoDisposeProvider<InspectorGrantsRepository>.internal(
      inspectorGrantsRepository,
      name: r'inspectorGrantsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$inspectorGrantsRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InspectorGrantsRepositoryRef =
    AutoDisposeProviderRef<InspectorGrantsRepository>;
String _$inspectorRecordsRepositoryHash() =>
    r'c32fc73337252577b603f3ea94413d2e6fe4b1f7';

/// See also [inspectorRecordsRepository].
@ProviderFor(inspectorRecordsRepository)
final inspectorRecordsRepositoryProvider =
    AutoDisposeProvider<InspectorRecordsRepository>.internal(
      inspectorRecordsRepository,
      name: r'inspectorRecordsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$inspectorRecordsRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InspectorRecordsRepositoryRef =
    AutoDisposeProviderRef<InspectorRecordsRepository>;
String _$inspectorFeedbackRepositoryHash() =>
    r'1be9c6576264a804b96565b4f05fda0cc6ae2b3c';

/// See also [inspectorFeedbackRepository].
@ProviderFor(inspectorFeedbackRepository)
final inspectorFeedbackRepositoryProvider =
    AutoDisposeProvider<InspectorFeedbackRepository>.internal(
      inspectorFeedbackRepository,
      name: r'inspectorFeedbackRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$inspectorFeedbackRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InspectorFeedbackRepositoryRef =
    AutoDisposeProviderRef<InspectorFeedbackRepository>;
String _$inspectorAuditServiceHash() =>
    r'c8c7821088127da67778e1e3e3232fef662612dd';

/// See also [inspectorAuditService].
@ProviderFor(inspectorAuditService)
final inspectorAuditServiceProvider =
    AutoDisposeProvider<InspectorAuditService>.internal(
      inspectorAuditService,
      name: r'inspectorAuditServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$inspectorAuditServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InspectorAuditServiceRef =
    AutoDisposeProviderRef<InspectorAuditService>;
String _$myActiveGrantsHash() => r'79a77cf20c8ccf7ce6eecaef3972f1bb2be6b1ef';

/// Active grants for the signed-in inspector.
///
/// Copied from [myActiveGrants].
@ProviderFor(myActiveGrants)
final myActiveGrantsProvider =
    AutoDisposeFutureProvider<List<InspectorGrant>>.internal(
      myActiveGrants,
      name: r'myActiveGrantsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$myActiveGrantsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MyActiveGrantsRef = AutoDisposeFutureProviderRef<List<InspectorGrant>>;
String _$grantByIdHash() => r'53b787c6aebba6a2b6c3f2c33dcbea669ef6da69';

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

/// A single active grant by id, for the home-access screen.
///
/// Copied from [grantById].
@ProviderFor(grantById)
const grantByIdProvider = GrantByIdFamily();

/// A single active grant by id, for the home-access screen.
///
/// Copied from [grantById].
class GrantByIdFamily extends Family<AsyncValue<InspectorGrant?>> {
  /// A single active grant by id, for the home-access screen.
  ///
  /// Copied from [grantById].
  const GrantByIdFamily();

  /// A single active grant by id, for the home-access screen.
  ///
  /// Copied from [grantById].
  GrantByIdProvider call(String grantId) {
    return GrantByIdProvider(grantId);
  }

  @override
  GrantByIdProvider getProviderOverride(covariant GrantByIdProvider provider) {
    return call(provider.grantId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'grantByIdProvider';
}

/// A single active grant by id, for the home-access screen.
///
/// Copied from [grantById].
class GrantByIdProvider extends AutoDisposeFutureProvider<InspectorGrant?> {
  /// A single active grant by id, for the home-access screen.
  ///
  /// Copied from [grantById].
  GrantByIdProvider(String grantId)
    : this._internal(
        (ref) => grantById(ref as GrantByIdRef, grantId),
        from: grantByIdProvider,
        name: r'grantByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$grantByIdHash,
        dependencies: GrantByIdFamily._dependencies,
        allTransitiveDependencies: GrantByIdFamily._allTransitiveDependencies,
        grantId: grantId,
      );

  GrantByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.grantId,
  }) : super.internal();

  final String grantId;

  @override
  Override overrideWith(
    FutureOr<InspectorGrant?> Function(GrantByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GrantByIdProvider._internal(
        (ref) => create(ref as GrantByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        grantId: grantId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<InspectorGrant?> createElement() {
    return _GrantByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GrantByIdProvider && other.grantId == grantId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, grantId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GrantByIdRef on AutoDisposeFutureProviderRef<InspectorGrant?> {
  /// The parameter `grantId` of this provider.
  String get grantId;
}

class _GrantByIdProviderElement
    extends AutoDisposeFutureProviderElement<InspectorGrant?>
    with GrantByIdRef {
  _GrantByIdProviderElement(super.provider);

  @override
  String get grantId => (origin as GrantByIdProvider).grantId;
}

String _$grantsForHomeHash() => r'e4f0d90dd0022a98c96dfbc1c6e527e99609dbc3';

/// All grants (active + expired) for [homeId]. Manager view.
///
/// Copied from [grantsForHome].
@ProviderFor(grantsForHome)
const grantsForHomeProvider = GrantsForHomeFamily();

/// All grants (active + expired) for [homeId]. Manager view.
///
/// Copied from [grantsForHome].
class GrantsForHomeFamily extends Family<AsyncValue<List<InspectorGrant>>> {
  /// All grants (active + expired) for [homeId]. Manager view.
  ///
  /// Copied from [grantsForHome].
  const GrantsForHomeFamily();

  /// All grants (active + expired) for [homeId]. Manager view.
  ///
  /// Copied from [grantsForHome].
  GrantsForHomeProvider call(String homeId) {
    return GrantsForHomeProvider(homeId);
  }

  @override
  GrantsForHomeProvider getProviderOverride(
    covariant GrantsForHomeProvider provider,
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
  String? get name => r'grantsForHomeProvider';
}

/// All grants (active + expired) for [homeId]. Manager view.
///
/// Copied from [grantsForHome].
class GrantsForHomeProvider
    extends AutoDisposeFutureProvider<List<InspectorGrant>> {
  /// All grants (active + expired) for [homeId]. Manager view.
  ///
  /// Copied from [grantsForHome].
  GrantsForHomeProvider(String homeId)
    : this._internal(
        (ref) => grantsForHome(ref as GrantsForHomeRef, homeId),
        from: grantsForHomeProvider,
        name: r'grantsForHomeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$grantsForHomeHash,
        dependencies: GrantsForHomeFamily._dependencies,
        allTransitiveDependencies:
            GrantsForHomeFamily._allTransitiveDependencies,
        homeId: homeId,
      );

  GrantsForHomeProvider._internal(
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
    FutureOr<List<InspectorGrant>> Function(GrantsForHomeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GrantsForHomeProvider._internal(
        (ref) => create(ref as GrantsForHomeRef),
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
  AutoDisposeFutureProviderElement<List<InspectorGrant>> createElement() {
    return _GrantsForHomeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GrantsForHomeProvider && other.homeId == homeId;
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
mixin GrantsForHomeRef on AutoDisposeFutureProviderRef<List<InspectorGrant>> {
  /// The parameter `homeId` of this provider.
  String get homeId;
}

class _GrantsForHomeProviderElement
    extends AutoDisposeFutureProviderElement<List<InspectorGrant>>
    with GrantsForHomeRef {
  _GrantsForHomeProviderElement(super.provider);

  @override
  String get homeId => (origin as GrantsForHomeProvider).homeId;
}

String _$inspectorSearchHash() => r'1c5dbccc098c02b660a244b9e5bce4d60014bb0e';

/// Inspector accounts matching [query], for the grant-creation form.
///
/// Copied from [inspectorSearch].
@ProviderFor(inspectorSearch)
const inspectorSearchProvider = InspectorSearchFamily();

/// Inspector accounts matching [query], for the grant-creation form.
///
/// Copied from [inspectorSearch].
class InspectorSearchFamily extends Family<AsyncValue<List<InspectorAccount>>> {
  /// Inspector accounts matching [query], for the grant-creation form.
  ///
  /// Copied from [inspectorSearch].
  const InspectorSearchFamily();

  /// Inspector accounts matching [query], for the grant-creation form.
  ///
  /// Copied from [inspectorSearch].
  InspectorSearchProvider call(String query) {
    return InspectorSearchProvider(query);
  }

  @override
  InspectorSearchProvider getProviderOverride(
    covariant InspectorSearchProvider provider,
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
  String? get name => r'inspectorSearchProvider';
}

/// Inspector accounts matching [query], for the grant-creation form.
///
/// Copied from [inspectorSearch].
class InspectorSearchProvider
    extends AutoDisposeFutureProvider<List<InspectorAccount>> {
  /// Inspector accounts matching [query], for the grant-creation form.
  ///
  /// Copied from [inspectorSearch].
  InspectorSearchProvider(String query)
    : this._internal(
        (ref) => inspectorSearch(ref as InspectorSearchRef, query),
        from: inspectorSearchProvider,
        name: r'inspectorSearchProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$inspectorSearchHash,
        dependencies: InspectorSearchFamily._dependencies,
        allTransitiveDependencies:
            InspectorSearchFamily._allTransitiveDependencies,
        query: query,
      );

  InspectorSearchProvider._internal(
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
    FutureOr<List<InspectorAccount>> Function(InspectorSearchRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InspectorSearchProvider._internal(
        (ref) => create(ref as InspectorSearchRef),
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
  AutoDisposeFutureProviderElement<List<InspectorAccount>> createElement() {
    return _InspectorSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectorSearchProvider && other.query == query;
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
mixin InspectorSearchRef
    on AutoDisposeFutureProviderRef<List<InspectorAccount>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _InspectorSearchProviderElement
    extends AutoDisposeFutureProviderElement<List<InspectorAccount>>
    with InspectorSearchRef {
  _InspectorSearchProviderElement(super.provider);

  @override
  String get query => (origin as InspectorSearchProvider).query;
}

String _$inspectorChildrenHash() => r'11b054f6d1fa061554d0cbf0cc4ee270e358795f';

/// Children belonging to a granted home.
///
/// Copied from [inspectorChildren].
@ProviderFor(inspectorChildren)
const inspectorChildrenProvider = InspectorChildrenFamily();

/// Children belonging to a granted home.
///
/// Copied from [inspectorChildren].
class InspectorChildrenFamily
    extends Family<AsyncValue<List<Map<String, dynamic>>>> {
  /// Children belonging to a granted home.
  ///
  /// Copied from [inspectorChildren].
  const InspectorChildrenFamily();

  /// Children belonging to a granted home.
  ///
  /// Copied from [inspectorChildren].
  InspectorChildrenProvider call(String homeId) {
    return InspectorChildrenProvider(homeId);
  }

  @override
  InspectorChildrenProvider getProviderOverride(
    covariant InspectorChildrenProvider provider,
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
  String? get name => r'inspectorChildrenProvider';
}

/// Children belonging to a granted home.
///
/// Copied from [inspectorChildren].
class InspectorChildrenProvider
    extends AutoDisposeFutureProvider<List<Map<String, dynamic>>> {
  /// Children belonging to a granted home.
  ///
  /// Copied from [inspectorChildren].
  InspectorChildrenProvider(String homeId)
    : this._internal(
        (ref) => inspectorChildren(ref as InspectorChildrenRef, homeId),
        from: inspectorChildrenProvider,
        name: r'inspectorChildrenProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$inspectorChildrenHash,
        dependencies: InspectorChildrenFamily._dependencies,
        allTransitiveDependencies:
            InspectorChildrenFamily._allTransitiveDependencies,
        homeId: homeId,
      );

  InspectorChildrenProvider._internal(
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
    FutureOr<List<Map<String, dynamic>>> Function(InspectorChildrenRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InspectorChildrenProvider._internal(
        (ref) => create(ref as InspectorChildrenRef),
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
    return _InspectorChildrenProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectorChildrenProvider && other.homeId == homeId;
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
mixin InspectorChildrenRef
    on AutoDisposeFutureProviderRef<List<Map<String, dynamic>>> {
  /// The parameter `homeId` of this provider.
  String get homeId;
}

class _InspectorChildrenProviderElement
    extends AutoDisposeFutureProviderElement<List<Map<String, dynamic>>>
    with InspectorChildrenRef {
  _InspectorChildrenProviderElement(super.provider);

  @override
  String get homeId => (origin as InspectorChildrenProvider).homeId;
}

String _$inspectorRecordsHash() => r'2ab1d3763ad687e390289658346225d778630601';

/// Records for [module] in [homeId], optionally narrowed to [childId].
///
/// Copied from [inspectorRecords].
@ProviderFor(inspectorRecords)
const inspectorRecordsProvider = InspectorRecordsFamily();

/// Records for [module] in [homeId], optionally narrowed to [childId].
///
/// Copied from [inspectorRecords].
class InspectorRecordsFamily
    extends Family<AsyncValue<List<Map<String, dynamic>>>> {
  /// Records for [module] in [homeId], optionally narrowed to [childId].
  ///
  /// Copied from [inspectorRecords].
  const InspectorRecordsFamily();

  /// Records for [module] in [homeId], optionally narrowed to [childId].
  ///
  /// Copied from [inspectorRecords].
  InspectorRecordsProvider call(
    String homeId,
    InspectorModule module,
    String? childId,
  ) {
    return InspectorRecordsProvider(homeId, module, childId);
  }

  @override
  InspectorRecordsProvider getProviderOverride(
    covariant InspectorRecordsProvider provider,
  ) {
    return call(provider.homeId, provider.module, provider.childId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'inspectorRecordsProvider';
}

/// Records for [module] in [homeId], optionally narrowed to [childId].
///
/// Copied from [inspectorRecords].
class InspectorRecordsProvider
    extends AutoDisposeFutureProvider<List<Map<String, dynamic>>> {
  /// Records for [module] in [homeId], optionally narrowed to [childId].
  ///
  /// Copied from [inspectorRecords].
  InspectorRecordsProvider(
    String homeId,
    InspectorModule module,
    String? childId,
  ) : this._internal(
        (ref) => inspectorRecords(
          ref as InspectorRecordsRef,
          homeId,
          module,
          childId,
        ),
        from: inspectorRecordsProvider,
        name: r'inspectorRecordsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$inspectorRecordsHash,
        dependencies: InspectorRecordsFamily._dependencies,
        allTransitiveDependencies:
            InspectorRecordsFamily._allTransitiveDependencies,
        homeId: homeId,
        module: module,
        childId: childId,
      );

  InspectorRecordsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.homeId,
    required this.module,
    required this.childId,
  }) : super.internal();

  final String homeId;
  final InspectorModule module;
  final String? childId;

  @override
  Override overrideWith(
    FutureOr<List<Map<String, dynamic>>> Function(InspectorRecordsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InspectorRecordsProvider._internal(
        (ref) => create(ref as InspectorRecordsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        homeId: homeId,
        module: module,
        childId: childId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Map<String, dynamic>>> createElement() {
    return _InspectorRecordsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectorRecordsProvider &&
        other.homeId == homeId &&
        other.module == module &&
        other.childId == childId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, homeId.hashCode);
    hash = _SystemHash.combine(hash, module.hashCode);
    hash = _SystemHash.combine(hash, childId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InspectorRecordsRef
    on AutoDisposeFutureProviderRef<List<Map<String, dynamic>>> {
  /// The parameter `homeId` of this provider.
  String get homeId;

  /// The parameter `module` of this provider.
  InspectorModule get module;

  /// The parameter `childId` of this provider.
  String? get childId;
}

class _InspectorRecordsProviderElement
    extends AutoDisposeFutureProviderElement<List<Map<String, dynamic>>>
    with InspectorRecordsRef {
  _InspectorRecordsProviderElement(super.provider);

  @override
  String get homeId => (origin as InspectorRecordsProvider).homeId;
  @override
  InspectorModule get module => (origin as InspectorRecordsProvider).module;
  @override
  String? get childId => (origin as InspectorRecordsProvider).childId;
}

String _$feedbackForHomeHash() => r'1f4c4d9a6be06cc776d7a4a911b4ca5d89aa84e1';

/// All feedback submitted for [homeId]. Manager view.
///
/// Copied from [feedbackForHome].
@ProviderFor(feedbackForHome)
const feedbackForHomeProvider = FeedbackForHomeFamily();

/// All feedback submitted for [homeId]. Manager view.
///
/// Copied from [feedbackForHome].
class FeedbackForHomeFamily
    extends Family<AsyncValue<List<InspectorFeedback>>> {
  /// All feedback submitted for [homeId]. Manager view.
  ///
  /// Copied from [feedbackForHome].
  const FeedbackForHomeFamily();

  /// All feedback submitted for [homeId]. Manager view.
  ///
  /// Copied from [feedbackForHome].
  FeedbackForHomeProvider call(String homeId) {
    return FeedbackForHomeProvider(homeId);
  }

  @override
  FeedbackForHomeProvider getProviderOverride(
    covariant FeedbackForHomeProvider provider,
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
  String? get name => r'feedbackForHomeProvider';
}

/// All feedback submitted for [homeId]. Manager view.
///
/// Copied from [feedbackForHome].
class FeedbackForHomeProvider
    extends AutoDisposeFutureProvider<List<InspectorFeedback>> {
  /// All feedback submitted for [homeId]. Manager view.
  ///
  /// Copied from [feedbackForHome].
  FeedbackForHomeProvider(String homeId)
    : this._internal(
        (ref) => feedbackForHome(ref as FeedbackForHomeRef, homeId),
        from: feedbackForHomeProvider,
        name: r'feedbackForHomeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$feedbackForHomeHash,
        dependencies: FeedbackForHomeFamily._dependencies,
        allTransitiveDependencies:
            FeedbackForHomeFamily._allTransitiveDependencies,
        homeId: homeId,
      );

  FeedbackForHomeProvider._internal(
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
    FutureOr<List<InspectorFeedback>> Function(FeedbackForHomeRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FeedbackForHomeProvider._internal(
        (ref) => create(ref as FeedbackForHomeRef),
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
  AutoDisposeFutureProviderElement<List<InspectorFeedback>> createElement() {
    return _FeedbackForHomeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedbackForHomeProvider && other.homeId == homeId;
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
mixin FeedbackForHomeRef
    on AutoDisposeFutureProviderRef<List<InspectorFeedback>> {
  /// The parameter `homeId` of this provider.
  String get homeId;
}

class _FeedbackForHomeProviderElement
    extends AutoDisposeFutureProviderElement<List<InspectorFeedback>>
    with FeedbackForHomeRef {
  _FeedbackForHomeProviderElement(super.provider);

  @override
  String get homeId => (origin as FeedbackForHomeProvider).homeId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
