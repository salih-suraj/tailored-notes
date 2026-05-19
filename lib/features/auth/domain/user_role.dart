/// The four roles in TailorEd Notes. Stored as a string in Supabase user metadata.
enum UserRole {
  supportWorker,
  teamLeader,
  manager,
  inspector,
  parentGuardian;

  static UserRole fromString(String value) => switch (value) {
        'support_worker' => supportWorker,
        'team_leader' => teamLeader,
        'manager' => manager,
        'inspector' => inspector,
        'parent_guardian' => parentGuardian,
        _ => supportWorker,
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
