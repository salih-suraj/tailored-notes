// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_steps_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$smartStepsRepositoryHash() =>
    r'324f984caa147ee405c7fba81a417c44cc10ca57';

/// See also [smartStepsRepository].
@ProviderFor(smartStepsRepository)
final smartStepsRepositoryProvider =
    AutoDisposeProvider<SmartStepsRepository>.internal(
      smartStepsRepository,
      name: r'smartStepsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$smartStepsRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SmartStepsRepositoryRef = AutoDisposeProviderRef<SmartStepsRepository>;
String _$smartStepsHash() => r'7077eaa12dbb371b54ae14d627772eb1b28d97a2';

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

/// Live stream of Smart Steps for [childId].
///
/// Copied from [smartSteps].
@ProviderFor(smartSteps)
const smartStepsProvider = SmartStepsFamily();

/// Live stream of Smart Steps for [childId].
///
/// Copied from [smartSteps].
class SmartStepsFamily extends Family<AsyncValue<List<SmartStep>>> {
  /// Live stream of Smart Steps for [childId].
  ///
  /// Copied from [smartSteps].
  const SmartStepsFamily();

  /// Live stream of Smart Steps for [childId].
  ///
  /// Copied from [smartSteps].
  SmartStepsProvider call(String childId) {
    return SmartStepsProvider(childId);
  }

  @override
  SmartStepsProvider getProviderOverride(
    covariant SmartStepsProvider provider,
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
  String? get name => r'smartStepsProvider';
}

/// Live stream of Smart Steps for [childId].
///
/// Copied from [smartSteps].
class SmartStepsProvider extends AutoDisposeStreamProvider<List<SmartStep>> {
  /// Live stream of Smart Steps for [childId].
  ///
  /// Copied from [smartSteps].
  SmartStepsProvider(String childId)
    : this._internal(
        (ref) => smartSteps(ref as SmartStepsRef, childId),
        from: smartStepsProvider,
        name: r'smartStepsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$smartStepsHash,
        dependencies: SmartStepsFamily._dependencies,
        allTransitiveDependencies: SmartStepsFamily._allTransitiveDependencies,
        childId: childId,
      );

  SmartStepsProvider._internal(
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
    Stream<List<SmartStep>> Function(SmartStepsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SmartStepsProvider._internal(
        (ref) => create(ref as SmartStepsRef),
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
  AutoDisposeStreamProviderElement<List<SmartStep>> createElement() {
    return _SmartStepsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SmartStepsProvider && other.childId == childId;
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
mixin SmartStepsRef on AutoDisposeStreamProviderRef<List<SmartStep>> {
  /// The parameter `childId` of this provider.
  String get childId;
}

class _SmartStepsProviderElement
    extends AutoDisposeStreamProviderElement<List<SmartStep>>
    with SmartStepsRef {
  _SmartStepsProviderElement(super.provider);

  @override
  String get childId => (origin as SmartStepsProvider).childId;
}

String _$stepProgressNotesHash() => r'fffd01241c3f47ee4000a9ef900babbea3e483db';

/// Live stream of progress notes for [stepId].
///
/// Copied from [stepProgressNotes].
@ProviderFor(stepProgressNotes)
const stepProgressNotesProvider = StepProgressNotesFamily();

/// Live stream of progress notes for [stepId].
///
/// Copied from [stepProgressNotes].
class StepProgressNotesFamily extends Family<AsyncValue<List<StepProgress>>> {
  /// Live stream of progress notes for [stepId].
  ///
  /// Copied from [stepProgressNotes].
  const StepProgressNotesFamily();

  /// Live stream of progress notes for [stepId].
  ///
  /// Copied from [stepProgressNotes].
  StepProgressNotesProvider call(String stepId) {
    return StepProgressNotesProvider(stepId);
  }

  @override
  StepProgressNotesProvider getProviderOverride(
    covariant StepProgressNotesProvider provider,
  ) {
    return call(provider.stepId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'stepProgressNotesProvider';
}

/// Live stream of progress notes for [stepId].
///
/// Copied from [stepProgressNotes].
class StepProgressNotesProvider
    extends AutoDisposeStreamProvider<List<StepProgress>> {
  /// Live stream of progress notes for [stepId].
  ///
  /// Copied from [stepProgressNotes].
  StepProgressNotesProvider(String stepId)
    : this._internal(
        (ref) => stepProgressNotes(ref as StepProgressNotesRef, stepId),
        from: stepProgressNotesProvider,
        name: r'stepProgressNotesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$stepProgressNotesHash,
        dependencies: StepProgressNotesFamily._dependencies,
        allTransitiveDependencies:
            StepProgressNotesFamily._allTransitiveDependencies,
        stepId: stepId,
      );

  StepProgressNotesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.stepId,
  }) : super.internal();

  final String stepId;

  @override
  Override overrideWith(
    Stream<List<StepProgress>> Function(StepProgressNotesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StepProgressNotesProvider._internal(
        (ref) => create(ref as StepProgressNotesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        stepId: stepId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<StepProgress>> createElement() {
    return _StepProgressNotesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StepProgressNotesProvider && other.stepId == stepId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stepId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StepProgressNotesRef on AutoDisposeStreamProviderRef<List<StepProgress>> {
  /// The parameter `stepId` of this provider.
  String get stepId;
}

class _StepProgressNotesProviderElement
    extends AutoDisposeStreamProviderElement<List<StepProgress>>
    with StepProgressNotesRef {
  _StepProgressNotesProviderElement(super.provider);

  @override
  String get stepId => (origin as StepProgressNotesProvider).stepId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
