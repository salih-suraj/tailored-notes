// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incidents_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$incidentReportsRepositoryHash() =>
    r'6a8615b83a6a919d627e3fd797e822459a053e5f';

/// See also [incidentReportsRepository].
@ProviderFor(incidentReportsRepository)
final incidentReportsRepositoryProvider =
    AutoDisposeProvider<IncidentReportsRepository>.internal(
      incidentReportsRepository,
      name: r'incidentReportsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$incidentReportsRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IncidentReportsRepositoryRef =
    AutoDisposeProviderRef<IncidentReportsRepository>;
String _$incidentReportsHash() => r'3b3cade92bbe0ca3f56d006e5dd30e38836ff2ea';

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

/// See also [incidentReports].
@ProviderFor(incidentReports)
const incidentReportsProvider = IncidentReportsFamily();

/// See also [incidentReports].
class IncidentReportsFamily extends Family<AsyncValue<List<IncidentReport>>> {
  /// See also [incidentReports].
  const IncidentReportsFamily();

  /// See also [incidentReports].
  IncidentReportsProvider call(String childId) {
    return IncidentReportsProvider(childId);
  }

  @override
  IncidentReportsProvider getProviderOverride(
    covariant IncidentReportsProvider provider,
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
  String? get name => r'incidentReportsProvider';
}

/// See also [incidentReports].
class IncidentReportsProvider
    extends AutoDisposeStreamProvider<List<IncidentReport>> {
  /// See also [incidentReports].
  IncidentReportsProvider(String childId)
    : this._internal(
        (ref) => incidentReports(ref as IncidentReportsRef, childId),
        from: incidentReportsProvider,
        name: r'incidentReportsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$incidentReportsHash,
        dependencies: IncidentReportsFamily._dependencies,
        allTransitiveDependencies:
            IncidentReportsFamily._allTransitiveDependencies,
        childId: childId,
      );

  IncidentReportsProvider._internal(
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
    Stream<List<IncidentReport>> Function(IncidentReportsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IncidentReportsProvider._internal(
        (ref) => create(ref as IncidentReportsRef),
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
  AutoDisposeStreamProviderElement<List<IncidentReport>> createElement() {
    return _IncidentReportsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IncidentReportsProvider && other.childId == childId;
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
mixin IncidentReportsRef on AutoDisposeStreamProviderRef<List<IncidentReport>> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _IncidentReportsProviderElement
    extends AutoDisposeStreamProviderElement<List<IncidentReport>>
    with IncidentReportsRef {
  _IncidentReportsProviderElement(super.provider);

  @override
  String get childId => (origin as IncidentReportsProvider).childId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
