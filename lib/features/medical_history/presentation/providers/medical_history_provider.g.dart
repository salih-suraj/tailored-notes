// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$medicalHistoryRepositoryHash() =>
    r'203db21dea0971d7e2a75875736d26b31edf4cff';

/// See also [medicalHistoryRepository].
@ProviderFor(medicalHistoryRepository)
final medicalHistoryRepositoryProvider =
    AutoDisposeProvider<MedicalHistoryRepository>.internal(
      medicalHistoryRepository,
      name: r'medicalHistoryRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$medicalHistoryRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MedicalHistoryRepositoryRef =
    AutoDisposeProviderRef<MedicalHistoryRepository>;
String _$medicalProfileHash() => r'd0b24e868f097f8a455d9921af2ca8b2a1ab3849';

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

/// Live stream of the medical profile for [childId]. Null if not yet created.
///
/// Copied from [medicalProfile].
@ProviderFor(medicalProfile)
const medicalProfileProvider = MedicalProfileFamily();

/// Live stream of the medical profile for [childId]. Null if not yet created.
///
/// Copied from [medicalProfile].
class MedicalProfileFamily extends Family<AsyncValue<MedicalProfile?>> {
  /// Live stream of the medical profile for [childId]. Null if not yet created.
  ///
  /// Copied from [medicalProfile].
  const MedicalProfileFamily();

  /// Live stream of the medical profile for [childId]. Null if not yet created.
  ///
  /// Copied from [medicalProfile].
  MedicalProfileProvider call(String childId) {
    return MedicalProfileProvider(childId);
  }

  @override
  MedicalProfileProvider getProviderOverride(
    covariant MedicalProfileProvider provider,
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
  String? get name => r'medicalProfileProvider';
}

/// Live stream of the medical profile for [childId]. Null if not yet created.
///
/// Copied from [medicalProfile].
class MedicalProfileProvider
    extends AutoDisposeStreamProvider<MedicalProfile?> {
  /// Live stream of the medical profile for [childId]. Null if not yet created.
  ///
  /// Copied from [medicalProfile].
  MedicalProfileProvider(String childId)
    : this._internal(
        (ref) => medicalProfile(ref as MedicalProfileRef, childId),
        from: medicalProfileProvider,
        name: r'medicalProfileProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$medicalProfileHash,
        dependencies: MedicalProfileFamily._dependencies,
        allTransitiveDependencies:
            MedicalProfileFamily._allTransitiveDependencies,
        childId: childId,
      );

  MedicalProfileProvider._internal(
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
    Stream<MedicalProfile?> Function(MedicalProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MedicalProfileProvider._internal(
        (ref) => create(ref as MedicalProfileRef),
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
  AutoDisposeStreamProviderElement<MedicalProfile?> createElement() {
    return _MedicalProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MedicalProfileProvider && other.childId == childId;
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
mixin MedicalProfileRef on AutoDisposeStreamProviderRef<MedicalProfile?> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _MedicalProfileProviderElement
    extends AutoDisposeStreamProviderElement<MedicalProfile?>
    with MedicalProfileRef {
  _MedicalProfileProviderElement(super.provider);

  @override
  String get childId => (origin as MedicalProfileProvider).childId;
}

String _$healthcareContactsHash() =>
    r'd9645664218df1f88cfea9d7984b8a1629ffe21a';

/// Live stream of healthcare contacts for [childId].
///
/// Copied from [healthcareContacts].
@ProviderFor(healthcareContacts)
const healthcareContactsProvider = HealthcareContactsFamily();

/// Live stream of healthcare contacts for [childId].
///
/// Copied from [healthcareContacts].
class HealthcareContactsFamily
    extends Family<AsyncValue<List<HealthcareContact>>> {
  /// Live stream of healthcare contacts for [childId].
  ///
  /// Copied from [healthcareContacts].
  const HealthcareContactsFamily();

  /// Live stream of healthcare contacts for [childId].
  ///
  /// Copied from [healthcareContacts].
  HealthcareContactsProvider call(String childId) {
    return HealthcareContactsProvider(childId);
  }

  @override
  HealthcareContactsProvider getProviderOverride(
    covariant HealthcareContactsProvider provider,
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
  String? get name => r'healthcareContactsProvider';
}

/// Live stream of healthcare contacts for [childId].
///
/// Copied from [healthcareContacts].
class HealthcareContactsProvider
    extends AutoDisposeStreamProvider<List<HealthcareContact>> {
  /// Live stream of healthcare contacts for [childId].
  ///
  /// Copied from [healthcareContacts].
  HealthcareContactsProvider(String childId)
    : this._internal(
        (ref) => healthcareContacts(ref as HealthcareContactsRef, childId),
        from: healthcareContactsProvider,
        name: r'healthcareContactsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$healthcareContactsHash,
        dependencies: HealthcareContactsFamily._dependencies,
        allTransitiveDependencies:
            HealthcareContactsFamily._allTransitiveDependencies,
        childId: childId,
      );

  HealthcareContactsProvider._internal(
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
    Stream<List<HealthcareContact>> Function(HealthcareContactsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: HealthcareContactsProvider._internal(
        (ref) => create(ref as HealthcareContactsRef),
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
  AutoDisposeStreamProviderElement<List<HealthcareContact>> createElement() {
    return _HealthcareContactsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HealthcareContactsProvider && other.childId == childId;
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
mixin HealthcareContactsRef
    on AutoDisposeStreamProviderRef<List<HealthcareContact>> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _HealthcareContactsProviderElement
    extends AutoDisposeStreamProviderElement<List<HealthcareContact>>
    with HealthcareContactsRef {
  _HealthcareContactsProviderElement(super.provider);

  @override
  String get childId => (origin as HealthcareContactsProvider).childId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
