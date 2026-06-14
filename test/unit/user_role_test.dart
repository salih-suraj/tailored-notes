import 'package:flutter_test/flutter_test.dart';
import 'package:tailored_notes/features/auth/domain/user_role.dart';

void main() {
  group('UserRole.fromString', () {
    test('maps every known role string', () {
      expect(UserRole.fromString('support_worker'), UserRole.supportWorker);
      expect(UserRole.fromString('team_leader'), UserRole.teamLeader);
      expect(UserRole.fromString('manager'), UserRole.manager);
      expect(UserRole.fromString('inspector'), UserRole.inspector);
      expect(UserRole.fromString('parent_guardian'), UserRole.parentGuardian);
    });

    // Regression: an unknown / missing app_role claim previously fell back to
    // supportWorker, which handed a parent account the staff tab set (bug
    // found during item 30 verification, 2026-06-12). The fallback must be
    // the LEAST-privileged role so a misconfigured account sees the empty
    // read-only portal, never staff screens.
    test(
      'falls back to parentGuardian for unknown values (least privilege)',
      () {
        expect(UserRole.fromString(''), UserRole.parentGuardian);
        expect(UserRole.fromString('admin'), UserRole.parentGuardian);
        expect(UserRole.fromString('SUPPORT_WORKER'), UserRole.parentGuardian);
        expect(UserRole.fromString('superuser'), UserRole.parentGuardian);
      },
    );
  });

  group('UserRole.toJson', () {
    test('serialises to the snake_case wire value', () {
      expect(UserRole.supportWorker.toJson(), 'support_worker');
      expect(UserRole.teamLeader.toJson(), 'team_leader');
      expect(UserRole.manager.toJson(), 'manager');
      expect(UserRole.inspector.toJson(), 'inspector');
      expect(UserRole.parentGuardian.toJson(), 'parent_guardian');
    });

    test('round-trips through fromString for all real roles', () {
      for (final role in UserRole.values) {
        expect(
          UserRole.fromString(role.toJson()),
          role,
          reason: '${role.name} should survive a toJson/fromString round-trip',
        );
      }
    });
  });

  group('UserRole.displayName', () {
    test('every role has a non-empty human label', () {
      for (final role in UserRole.values) {
        expect(role.displayName, isNotEmpty);
      }
      expect(UserRole.supportWorker.displayName, 'Support Worker');
      expect(UserRole.parentGuardian.displayName, 'Parent / Guardian');
    });
  });
}
