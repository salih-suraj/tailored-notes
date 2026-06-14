import 'package:flutter_test/flutter_test.dart';
import 'package:tailored_notes/features/parent_portal/domain/parent_link.dart';

void main() {
  group('ParentLink.isActive', () {
    test('is active when not revoked', () {
      final link = ParentLink(
        id: 'l1',
        parentUserId: 'p1',
        childId: 'c1',
        homeId: 'home-1',
        canViewPhotos: false,
        grantedBy: 'm1',
        createdAt: DateTime.now(),
      );
      expect(link.isActive, isTrue);
    });

    test('is inactive once revoked', () {
      final link = ParentLink(
        id: 'l1',
        parentUserId: 'p1',
        childId: 'c1',
        homeId: 'home-1',
        canViewPhotos: false,
        grantedBy: 'm1',
        createdAt: DateTime.now(),
        revokedAt: DateTime.now(),
      );
      expect(link.isActive, isFalse);
    });
  });

  group('ParentLink.displayName', () {
    test('uses the child name when present', () {
      final link = ParentLink(
        id: 'l1',
        parentUserId: 'p1',
        childId: '7e57f00d-0000-4000-8000-000000000001',
        homeId: 'home-1',
        canViewPhotos: false,
        grantedBy: 'm1',
        createdAt: DateTime.now(),
        childName: 'Alex',
      );
      expect(link.displayName, 'Alex');
    });

    test('falls back to a short child id when name is missing', () {
      final link = ParentLink(
        id: 'l1',
        parentUserId: 'p1',
        childId: '7e57f00d-0000-4000-8000-000000000001',
        homeId: 'home-1',
        canViewPhotos: false,
        grantedBy: 'm1',
        createdAt: DateTime.now(),
      );
      expect(link.displayName, 'Child 7e57f00d…');
    });
  });

  group('ParentLink.fromJson', () {
    test('parses columns plus embedded child and user', () {
      final link = ParentLink.fromJson({
        'id': 'l1',
        'parent_user_id': 'p1',
        'child_id': 'c1',
        'home_id': 'home-1',
        'can_view_photos': true,
        'granted_by': 'm1',
        'created_at': '2026-06-14T10:00:00.000Z',
        'revoked_at': null,
        'children': {'name': 'Alex', 'photo_url': 'https://x/p.jpg'},
        'users': {'email': 'parent@example.com'},
      });
      expect(link.id, 'l1');
      expect(link.canViewPhotos, isTrue);
      expect(link.isActive, isTrue);
      expect(link.childName, 'Alex');
      expect(link.childPhotoUrl, 'https://x/p.jpg');
      expect(link.parentEmail, 'parent@example.com');
    });

    test('defaults can_view_photos to false and parses revoked_at', () {
      final link = ParentLink.fromJson({
        'id': 'l1',
        'parent_user_id': 'p1',
        'child_id': 'c1',
        'home_id': 'home-1',
        'granted_by': 'm1',
        'created_at': '2026-06-14T10:00:00.000Z',
        'revoked_at': '2026-06-15T09:00:00.000Z',
      });
      expect(link.canViewPhotos, isFalse);
      expect(link.isActive, isFalse);
      expect(link.revokedAt, DateTime.utc(2026, 6, 15, 9, 0, 0));
    });
  });
}
