import 'package:flutter_test/flutter_test.dart';
import 'package:tailored_notes/features/inspector/domain/inspector_grant.dart';

void main() {
  group('InspectorGrant.isActive / daysRemaining', () {
    test('a future expiry is active', () {
      final grant = InspectorGrant(
        id: 'g1',
        inspectorUserId: 'i1',
        homeId: 'home-1',
        grantedBy: 'm1',
        expiresAt: DateTime.now().add(const Duration(days: 5, hours: 1)),
        createdAt: DateTime.now(),
        scope: const ['daily_notes'],
      );
      expect(grant.isActive, isTrue);
      expect(grant.daysRemaining, 5);
    });

    test('a past expiry is inactive', () {
      final grant = InspectorGrant(
        id: 'g1',
        inspectorUserId: 'i1',
        homeId: 'home-1',
        grantedBy: 'm1',
        expiresAt: DateTime.now().subtract(const Duration(days: 1)),
        createdAt: DateTime.now().subtract(const Duration(days: 8)),
        scope: const ['daily_notes'],
      );
      expect(grant.isActive, isFalse);
    });
  });

  group('InspectorGrant.displayName', () {
    test('uses the resolved home name when present', () {
      final grant = InspectorGrant(
        id: 'g1',
        inspectorUserId: 'i1',
        homeId: '7e57f00d-0000-4000-8000-000000000001',
        grantedBy: 'm1',
        expiresAt: DateTime.now().add(const Duration(days: 1)),
        createdAt: DateTime.now(),
        scope: const [],
        homeName: 'Sunrise House',
      );
      expect(grant.displayName, 'Sunrise House');
    });

    test('falls back to a short home id when name is missing', () {
      final grant = InspectorGrant(
        id: 'g1',
        inspectorUserId: 'i1',
        homeId: '7e57f00d-0000-4000-8000-000000000001',
        grantedBy: 'm1',
        expiresAt: DateTime.now().add(const Duration(days: 1)),
        createdAt: DateTime.now(),
        scope: const [],
      );
      expect(grant.displayName, 'Home 7e57f00d…');
    });
  });

  group('InspectorGrant.fromJson', () {
    test('parses columns plus embedded home and user', () {
      final grant = InspectorGrant.fromJson({
        'id': 'g1',
        'inspector_user_id': 'i1',
        'home_id': 'home-1',
        'granted_by': 'm1',
        'expires_at': '2026-06-20T23:59:59.000Z',
        'created_at': '2026-06-14T10:00:00.000Z',
        'scope': ['daily_notes', 'medication', 'children'],
        'homes': {'name': 'Sunrise House'},
        'users': {'email': 'inspector@example.com'},
      });
      expect(grant.id, 'g1');
      expect(grant.scope, ['daily_notes', 'medication', 'children']);
      expect(grant.homeName, 'Sunrise House');
      expect(grant.inspectorEmail, 'inspector@example.com');
      expect(grant.expiresAt, DateTime.utc(2026, 6, 20, 23, 59, 59));
    });

    test('tolerates a missing scope list and missing embeds', () {
      final grant = InspectorGrant.fromJson({
        'id': 'g1',
        'inspector_user_id': 'i1',
        'home_id': 'home-1',
        'granted_by': 'm1',
        'expires_at': '2026-06-20T23:59:59.000Z',
        'created_at': '2026-06-14T10:00:00.000Z',
      });
      expect(grant.scope, isEmpty);
      expect(grant.homeName, isNull);
      expect(grant.inspectorEmail, isNull);
    });
  });
}
