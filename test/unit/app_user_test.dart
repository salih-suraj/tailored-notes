import 'package:flutter_test/flutter_test.dart';
import 'package:tailored_notes/features/auth/domain/app_user.dart';
import 'package:tailored_notes/features/auth/domain/user_role.dart';

AppUser _user(UserRole role, {bool mfaVerified = false}) => AppUser(
      id: 'u1',
      email: 'u1@example.com',
      role: role,
      homeId: 'home-1',
      isMfaVerified: mfaVerified,
    );

void main() {
  group('AppUser.requiresMfa', () {
    test('only managers and inspectors require MFA', () {
      expect(_user(UserRole.manager).requiresMfa, isTrue);
      expect(_user(UserRole.inspector).requiresMfa, isTrue);
      expect(_user(UserRole.supportWorker).requiresMfa, isFalse);
      expect(_user(UserRole.teamLeader).requiresMfa, isFalse);
      expect(_user(UserRole.parentGuardian).requiresMfa, isFalse);
    });
  });

  group('AppUser.needsMfaChallenge', () {
    test('MFA roles need the challenge until the session is AAL2', () {
      expect(_user(UserRole.manager, mfaVerified: false).needsMfaChallenge,
          isTrue);
      expect(_user(UserRole.inspector, mfaVerified: false).needsMfaChallenge,
          isTrue);
    });

    test('MFA roles are cleared once the session is verified', () {
      expect(_user(UserRole.manager, mfaVerified: true).needsMfaChallenge,
          isFalse);
      expect(_user(UserRole.inspector, mfaVerified: true).needsMfaChallenge,
          isFalse);
    });

    test('non-MFA roles never need the challenge, verified or not', () {
      for (final role in [
        UserRole.supportWorker,
        UserRole.teamLeader,
        UserRole.parentGuardian,
      ]) {
        expect(_user(role, mfaVerified: false).needsMfaChallenge, isFalse,
            reason: '${role.name} should not be gated by MFA');
        expect(_user(role, mfaVerified: true).needsMfaChallenge, isFalse);
      }
    });
  });
}
