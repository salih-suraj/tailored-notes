import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

/// Streams the current network connectivity state.
@riverpod
Stream<List<ConnectivityResult>> connectivity(Ref ref) =>
    Connectivity().onConnectivityChanged;

/// True when any network interface is available.
/// Before the first connectivity event arrives, assume online — a false
/// "offline" flash at startup is worse than a briefly-late banner.
@riverpod
bool isOnline(Ref ref) {
  final result = ref.watch(connectivityProvider).valueOrNull;
  if (result == null) return true;
  return result.any((r) => r != ConnectivityResult.none);
}
