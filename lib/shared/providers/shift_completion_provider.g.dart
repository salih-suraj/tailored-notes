// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_completion_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shiftCompletionHash() => r'0f313a83b17492f507b2821811a43e8e23929b2a';

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

/// Computes documentation completion for [childId] on the current shift.
/// Reacts live to Drift — updates the moment any record is saved.
///
/// Copied from [shiftCompletion].
@ProviderFor(shiftCompletion)
const shiftCompletionProvider = ShiftCompletionFamily();

/// Computes documentation completion for [childId] on the current shift.
/// Reacts live to Drift — updates the moment any record is saved.
///
/// Copied from [shiftCompletion].
class ShiftCompletionFamily extends Family<ShiftCompletion> {
  /// Computes documentation completion for [childId] on the current shift.
  /// Reacts live to Drift — updates the moment any record is saved.
  ///
  /// Copied from [shiftCompletion].
  const ShiftCompletionFamily();

  /// Computes documentation completion for [childId] on the current shift.
  /// Reacts live to Drift — updates the moment any record is saved.
  ///
  /// Copied from [shiftCompletion].
  ShiftCompletionProvider call(String childId) {
    return ShiftCompletionProvider(childId);
  }

  @override
  ShiftCompletionProvider getProviderOverride(
    covariant ShiftCompletionProvider provider,
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
  String? get name => r'shiftCompletionProvider';
}

/// Computes documentation completion for [childId] on the current shift.
/// Reacts live to Drift — updates the moment any record is saved.
///
/// Copied from [shiftCompletion].
class ShiftCompletionProvider extends AutoDisposeProvider<ShiftCompletion> {
  /// Computes documentation completion for [childId] on the current shift.
  /// Reacts live to Drift — updates the moment any record is saved.
  ///
  /// Copied from [shiftCompletion].
  ShiftCompletionProvider(String childId)
    : this._internal(
        (ref) => shiftCompletion(ref as ShiftCompletionRef, childId),
        from: shiftCompletionProvider,
        name: r'shiftCompletionProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$shiftCompletionHash,
        dependencies: ShiftCompletionFamily._dependencies,
        allTransitiveDependencies:
            ShiftCompletionFamily._allTransitiveDependencies,
        childId: childId,
      );

  ShiftCompletionProvider._internal(
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
    ShiftCompletion Function(ShiftCompletionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShiftCompletionProvider._internal(
        (ref) => create(ref as ShiftCompletionRef),
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
  AutoDisposeProviderElement<ShiftCompletion> createElement() {
    return _ShiftCompletionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShiftCompletionProvider && other.childId == childId;
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
mixin ShiftCompletionRef on AutoDisposeProviderRef<ShiftCompletion> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _ShiftCompletionProviderElement
    extends AutoDisposeProviderElement<ShiftCompletion>
    with ShiftCompletionRef {
  _ShiftCompletionProviderElement(super.provider);

  @override
  String get childId => (origin as ShiftCompletionProvider).childId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
