// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$medicationRepositoryHash() =>
    r'e3465db165d202b186138c678e15edabe9099cb3';

/// See also [medicationRepository].
@ProviderFor(medicationRepository)
final medicationRepositoryProvider =
    AutoDisposeProvider<MedicationRepository>.internal(
      medicationRepository,
      name: r'medicationRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$medicationRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MedicationRepositoryRef = AutoDisposeProviderRef<MedicationRepository>;
String _$prescribedMedsHash() => r'3520e8ce91daaa0cf0487d7ba2802fa79c5a8330';

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

/// Active prescribed meds for [childId].
///
/// Copied from [prescribedMeds].
@ProviderFor(prescribedMeds)
const prescribedMedsProvider = PrescribedMedsFamily();

/// Active prescribed meds for [childId].
///
/// Copied from [prescribedMeds].
class PrescribedMedsFamily extends Family<AsyncValue<List<PrescribedMed>>> {
  /// Active prescribed meds for [childId].
  ///
  /// Copied from [prescribedMeds].
  const PrescribedMedsFamily();

  /// Active prescribed meds for [childId].
  ///
  /// Copied from [prescribedMeds].
  PrescribedMedsProvider call(String childId) {
    return PrescribedMedsProvider(childId);
  }

  @override
  PrescribedMedsProvider getProviderOverride(
    covariant PrescribedMedsProvider provider,
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
  String? get name => r'prescribedMedsProvider';
}

/// Active prescribed meds for [childId].
///
/// Copied from [prescribedMeds].
class PrescribedMedsProvider
    extends AutoDisposeStreamProvider<List<PrescribedMed>> {
  /// Active prescribed meds for [childId].
  ///
  /// Copied from [prescribedMeds].
  PrescribedMedsProvider(String childId)
    : this._internal(
        (ref) => prescribedMeds(ref as PrescribedMedsRef, childId),
        from: prescribedMedsProvider,
        name: r'prescribedMedsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$prescribedMedsHash,
        dependencies: PrescribedMedsFamily._dependencies,
        allTransitiveDependencies:
            PrescribedMedsFamily._allTransitiveDependencies,
        childId: childId,
      );

  PrescribedMedsProvider._internal(
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
    Stream<List<PrescribedMed>> Function(PrescribedMedsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PrescribedMedsProvider._internal(
        (ref) => create(ref as PrescribedMedsRef),
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
  AutoDisposeStreamProviderElement<List<PrescribedMed>> createElement() {
    return _PrescribedMedsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PrescribedMedsProvider && other.childId == childId;
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
mixin PrescribedMedsRef on AutoDisposeStreamProviderRef<List<PrescribedMed>> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _PrescribedMedsProviderElement
    extends AutoDisposeStreamProviderElement<List<PrescribedMed>>
    with PrescribedMedsRef {
  _PrescribedMedsProviderElement(super.provider);

  @override
  String get childId => (origin as PrescribedMedsProvider).childId;
}

String _$todayAdminsHash() => r'0e8e439a341e92bc567b3cf7bf7daa38e1722ad0';

/// Today's administration records for [childId].
///
/// Copied from [todayAdmins].
@ProviderFor(todayAdmins)
const todayAdminsProvider = TodayAdminsFamily();

/// Today's administration records for [childId].
///
/// Copied from [todayAdmins].
class TodayAdminsFamily extends Family<AsyncValue<List<MedAdministration>>> {
  /// Today's administration records for [childId].
  ///
  /// Copied from [todayAdmins].
  const TodayAdminsFamily();

  /// Today's administration records for [childId].
  ///
  /// Copied from [todayAdmins].
  TodayAdminsProvider call(String childId) {
    return TodayAdminsProvider(childId);
  }

  @override
  TodayAdminsProvider getProviderOverride(
    covariant TodayAdminsProvider provider,
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
  String? get name => r'todayAdminsProvider';
}

/// Today's administration records for [childId].
///
/// Copied from [todayAdmins].
class TodayAdminsProvider
    extends AutoDisposeStreamProvider<List<MedAdministration>> {
  /// Today's administration records for [childId].
  ///
  /// Copied from [todayAdmins].
  TodayAdminsProvider(String childId)
    : this._internal(
        (ref) => todayAdmins(ref as TodayAdminsRef, childId),
        from: todayAdminsProvider,
        name: r'todayAdminsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$todayAdminsHash,
        dependencies: TodayAdminsFamily._dependencies,
        allTransitiveDependencies: TodayAdminsFamily._allTransitiveDependencies,
        childId: childId,
      );

  TodayAdminsProvider._internal(
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
    Stream<List<MedAdministration>> Function(TodayAdminsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TodayAdminsProvider._internal(
        (ref) => create(ref as TodayAdminsRef),
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
  AutoDisposeStreamProviderElement<List<MedAdministration>> createElement() {
    return _TodayAdminsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TodayAdminsProvider && other.childId == childId;
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
mixin TodayAdminsRef on AutoDisposeStreamProviderRef<List<MedAdministration>> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _TodayAdminsProviderElement
    extends AutoDisposeStreamProviderElement<List<MedAdministration>>
    with TodayAdminsRef {
  _TodayAdminsProviderElement(super.provider);

  @override
  String get childId => (origin as TodayAdminsProvider).childId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
