// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_log_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$visitorLogRepositoryHash() =>
    r'fd9454b71d96188312dcadb00fc1b901e7b5195f';

/// See also [visitorLogRepository].
@ProviderFor(visitorLogRepository)
final visitorLogRepositoryProvider =
    AutoDisposeProvider<VisitorLogRepository>.internal(
      visitorLogRepository,
      name: r'visitorLogRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$visitorLogRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VisitorLogRepositoryRef = AutoDisposeProviderRef<VisitorLogRepository>;
String _$visitorLogTodayHash() => r'3ba4a3c8931d695246566c656d7b2f84702f0b30';

/// Live stream of today's visitor log entries for the home.
///
/// Copied from [visitorLogToday].
@ProviderFor(visitorLogToday)
final visitorLogTodayProvider =
    AutoDisposeStreamProvider<List<VisitorLogEntry>>.internal(
      visitorLogToday,
      name: r'visitorLogTodayProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$visitorLogTodayHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VisitorLogTodayRef =
    AutoDisposeStreamProviderRef<List<VisitorLogEntry>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
