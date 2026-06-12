/// The five roles in TailorEd Notes. Injected into the JWT as `app_role`
/// by the custom_access_token_hook (reads `user_profiles.role`).
enum UserRole {
  supportWorker,
  teamLeader,
  manager,
  inspector,
  parentGuardian;

  /// Unknown or missing roles fall back to the LEAST-privileged role
  /// (read-only portal, empty unless explicitly linked) — never a staff
  /// role. A missing `app_role` claim means a misconfigured account
  /// (no user_profiles row, or a stale pre-profile session).
  static UserRole fromString(String value) => switch (value) {
        'support_worker' => supportWorker,
        'team_leader' => teamLeader,
        'manager' => manager,
        'inspector' => inspector,
        'parent_guardian' => parentGuardian,
        _ => parentGuardian,
      };

  String toJson() => switch (this) {
        supportWorker => 'support_worker',
        teamLeader => 'team_leader',
        manager => 'manager',
        inspector => 'inspector',
        parentGuardian => 'parent_guardian',
      };

  String get displayName => switch (this) {
        supportWorker => 'Support Worker',
        teamLeader => 'Team Leader',
        manager => 'Manager',
        inspector => 'Inspector',
        parentGuardian => 'Parent / Guardian',
      };
}
