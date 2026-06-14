import 'package:flutter_test/flutter_test.dart';
import 'package:tailored_notes/core/offline/sync_service.dart';

void main() {
  group('SyncService.isCloudSyncable', () {
    test('accepts canonical lower- and upper-case uuids', () {
      expect(
        SyncService.isCloudSyncable('123e4567-e89b-12d3-a456-426614174000'),
        isTrue,
      );
      expect(
        SyncService.isCloudSyncable('123E4567-E89B-12D3-A456-426614174000'),
        isTrue,
      );
    });

    // Regression: dev-mode rows carry home_id 'dev-home-001', which the uuid
    // cloud schema can never accept. The sweep must skip them or they retry
    // forever (logged in Q2). Anything that isn't a uuid is non-syncable.
    test('rejects the dev-mode home id and other non-uuid values', () {
      expect(SyncService.isCloudSyncable('dev-home-001'), isFalse);
      expect(SyncService.isCloudSyncable('unknown'), isFalse);
      expect(SyncService.isCloudSyncable(''), isFalse);
      expect(SyncService.isCloudSyncable('home-1'), isFalse);
    });

    test('rejects near-misses (wrong segment lengths, bad characters)', () {
      // One char short in the final segment.
      expect(
        SyncService.isCloudSyncable('123e4567-e89b-12d3-a456-42661417400'),
        isFalse,
      );
      // Non-hex character.
      expect(
        SyncService.isCloudSyncable('123e4567-e89b-12d3-a456-42661417400z'),
        isFalse,
      );
      // Missing dashes.
      expect(
        SyncService.isCloudSyncable('123e4567e89b12d3a456426614174000'),
        isFalse,
      );
    });
  });
}
