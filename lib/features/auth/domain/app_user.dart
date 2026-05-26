import 'dart:convert';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'user_role.dart';

/// Authenticated user with their role and home assignment.
class AppUser {
  const AppUser({
    required this.id,
    required this.email,
    required this.role,
    required this.homeId,
    this.displayName,
    this.isMfaVerified = false,
  });

  final String id;
  final String email;
  final UserRole role;
  final String homeId;
  final String? displayName;

  /// True when the session has been upgraded to AAL2 (TOTP verified).
  final bool isMfaVerified;

  /// Manager and Inspector must complete MFA before accessing the app.
  bool get requiresMfa =>
      role == UserRole.manager || role == UserRole.inspector;

  /// True when MFA is required but not yet completed for this session.
  bool get needsMfaChallenge => requiresMfa && !isMfaVerified;

  /// Builds from a live Supabase session.
  /// Reads [role], [homeId], and AAL from the JWT payload —
  /// that is where the custom_access_token_hook injects them.
  factory AppUser.fromSession(Session session) {
    final claims = _jwtClaims(session.accessToken);
    return AppUser(
      id: session.user.id,
      email: session.user.email ?? '',
      role: UserRole.fromString(claims['role'] as String? ?? ''),
      homeId: claims['home_id'] as String? ?? '',
      displayName: session.user.userMetadata?['display_name'] as String?,
      isMfaVerified: claims['aal'] == 'aal2',
    );
  }

  /// Dev-mode only — hardcoded manager, always MFA-verified.
  factory AppUser.fromMetadata({
    required String id,
    required String email,
    required Map<String, dynamic> metadata,
  }) {
    return AppUser(
      id: id,
      email: email,
      role: UserRole.fromString(metadata['role'] as String? ?? ''),
      homeId: metadata['home_id'] as String? ?? '',
      displayName: metadata['display_name'] as String?,
      isMfaVerified: true,
    );
  }

  static Map<String, dynamic> _jwtClaims(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return {};
      final normalized = base64Url.normalize(parts[1]);
      return jsonDecode(utf8.decode(base64Url.decode(normalized)))
          as Map<String, dynamic>;
    } catch (_) {
      return {};
    }
  }
}
