import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/dev_mode.dart';
import '../../../../core/network/supabase_client.dart';
import '../../domain/app_user.dart';
import '../../domain/user_role.dart';

part 'auth_provider.g.dart';

/// Streams Supabase auth state changes. Empty when no client is available.
@riverpod
Stream<AuthState> authStateChanges(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  if (client == null) return const Stream.empty();
  return client.auth.onAuthStateChange;
}

/// The currently signed-in [AppUser], or null if unauthenticated.
@riverpod
AppUser? currentUser(Ref ref) {
  if (kDevMode) {
    return const AppUser(
      id: 'dev-user-001',
      email: 'dev@tailorednotes.local',
      role: UserRole.supportWorker,
      homeId: 'dev-home-001',
      displayName: 'Dev User',
    );
  }
  final client = ref.watch(supabaseClientProvider);
  if (client == null) return null;
  final session = client.auth.currentSession;
  if (session == null) return null;
  final supaUser = session.user;
  return AppUser.fromMetadata(
    id: supaUser.id,
    email: supaUser.email ?? '',
    metadata: supaUser.userMetadata ?? {},
  );
}

/// True when a user is authenticated.
@riverpod
bool isAuthenticated(Ref ref) => ref.watch(currentUserProvider) != null;

/// Signs in with email and password.
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> signIn({required String email, required String password}) async {
    final client = ref.read(supabaseClientProvider);
    if (client == null) {
      state = AsyncError('No Supabase connection — run with credentials.', StackTrace.current);
      return;
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
    });
  }

  Future<void> signOut() async {
    final client = ref.read(supabaseClientProvider);
    if (client == null) return;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => client.auth.signOut());
  }

  Future<void> resetPassword(String email) async {
    final client = ref.read(supabaseClientProvider);
    if (client == null) return;
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => client.auth.resetPasswordForEmail(email),
    );
  }
}
