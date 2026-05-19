import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

/// Streams the current network connectivity state.
@riverpod
Stream<List<ConnectivityResult>> connectivity(Ref ref) =>
    Connectivity().onConnectivityChanged;

/// True when any network interface is available.
@riverpod
bool isOnline(Ref ref) {
  final result = ref.watch(connectivityProvider).valueOrNull ?? [];
  return result.any((r) => r != ConnectivityResult.none);
}
