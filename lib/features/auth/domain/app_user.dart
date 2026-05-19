import 'user_role.dart';

/// Authenticated user with their role and home assignment.
class AppUser {
  const AppUser({
    required this.id,
    required this.email,
    required this.role,
    required this.homeId,
    this.displayName,
  });

  final String id;
  final String email;
  final UserRole role;
  final String homeId;
  final String? displayName;

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
    );
  }
}
