import '../../auth/domain/user_role.dart';

/// A staff account in the manager's home, as shown on the Staff screen.
/// Backed by a `user_profiles` row (read via RLS) — not a Drift table.
class StaffMember {
  const StaffMember({
    required this.id,
    required this.email,
    required this.role,
    required this.isActive,
    this.displayName,
  });

  final String id;
  final String email;
  final UserRole role;
  final bool isActive;
  final String? displayName;

  /// Name to show, falling back to the email's local part, then the email.
  String get name {
    final n = displayName?.trim();
    if (n != null && n.isNotEmpty) return n;
    final at = email.indexOf('@');
    return at > 0 ? email.substring(0, at) : email;
  }

  factory StaffMember.fromJson(Map<String, dynamic> json) => StaffMember(
    id: json['id'] as String,
    email: (json['email'] as String?) ?? '',
    role: UserRole.fromString((json['role'] as String?) ?? ''),
    // Column added by supabase_staff_management.sql; default true if absent.
    isActive: (json['is_active'] as bool?) ?? true,
    displayName: json['display_name'] as String?,
  );
}
