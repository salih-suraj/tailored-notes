// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$staffRepositoryHash() => r'128e279f694e9bf2bada33fc34678ca69fc21c28';

/// See also [staffRepository].
@ProviderFor(staffRepository)
final staffRepositoryProvider = AutoDisposeProvider<StaffRepository>.internal(
  staffRepository,
  name: r'staffRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$staffRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StaffRepositoryRef = AutoDisposeProviderRef<StaffRepository>;
String _$staffForHomeHash() => r'0510613855b08b52a4a022a2c2a4d4c66070a614';

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

/// All staff in [homeId]. Manager view.
///
/// Copied from [staffForHome].
@ProviderFor(staffForHome)
const staffForHomeProvider = StaffForHomeFamily();

/// All staff in [homeId]. Manager view.
///
/// Copied from [staffForHome].
class StaffForHomeFamily extends Family<AsyncValue<List<StaffMember>>> {
  /// All staff in [homeId]. Manager view.
  ///
  /// Copied from [staffForHome].
  const StaffForHomeFamily();

  /// All staff in [homeId]. Manager view.
  ///
  /// Copied from [staffForHome].
  StaffForHomeProvider call(String homeId) {
    return StaffForHomeProvider(homeId);
  }

  @override
  StaffForHomeProvider getProviderOverride(
    covariant StaffForHomeProvider provider,
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
  String? get name => r'staffForHomeProvider';
}

/// All staff in [homeId]. Manager view.
///
/// Copied from [staffForHome].
class StaffForHomeProvider
    extends AutoDisposeFutureProvider<List<StaffMember>> {
  /// All staff in [homeId]. Manager view.
  ///
  /// Copied from [staffForHome].
  StaffForHomeProvider(String homeId)
    : this._internal(
        (ref) => staffForHome(ref as StaffForHomeRef, homeId),
        from: staffForHomeProvider,
        name: r'staffForHomeProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$staffForHomeHash,
        dependencies: StaffForHomeFamily._dependencies,
        allTransitiveDependencies:
            StaffForHomeFamily._allTransitiveDependencies,
        homeId: homeId,
      );

  StaffForHomeProvider._internal(
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
    FutureOr<List<StaffMember>> Function(StaffForHomeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StaffForHomeProvider._internal(
        (ref) => create(ref as StaffForHomeRef),
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
  AutoDisposeFutureProviderElement<List<StaffMember>> createElement() {
    return _StaffForHomeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StaffForHomeProvider && other.homeId == homeId;
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
mixin StaffForHomeRef on AutoDisposeFutureProviderRef<List<StaffMember>> {
  /// The parameter `homeId` of this provider.
  String get homeId;
}

class _StaffForHomeProviderElement
    extends AutoDisposeFutureProviderElement<List<StaffMember>>
    with StaffForHomeRef {
  _StaffForHomeProviderElement(super.provider);

  @override
  String get homeId => (origin as StaffForHomeProvider).homeId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
