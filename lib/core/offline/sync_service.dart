import 'dart:async';
import 'dart:developer';

/// A repository that can push its pending (isSynced = false) rows to
/// Supabase. Every care-record repository registers itself as a target.
abstract interface class SyncTarget {
  /// Table name used for logging only.
  String get syncLabel;

  /// Pushes all locally-pending rows (inserts, updates, AND soft deletes —
  /// payloads carry deleted_at) to Supabase. Implementations must mark rows
  /// isSynced = true only after the cloud write succeeds, and must skip
  /// rows that can never sync (non-uuid home_id from dev mode).
  Future<void> syncPending();
}

/// Q2 sync engine — drains every repository's unsynced rows on login and on
/// a periodic timer. Upserts are idempotent (last-write-wins on the cloud),
/// so re-running a sweep is always safe.
///
/// This also backfills history: rows written while the backend was
/// rejecting syncs (or while offline) still have isSynced = false, so the
/// first successful sweep uploads them.
class SyncService {
  SyncService({required List<SyncTarget> targets}) : _targets = targets;

  final List<SyncTarget> _targets;
  Timer? _timer;
  bool _sweeping = false;

  static const _interval = Duration(minutes: 2);

  /// Matches a canonical uuid — dev-mode rows (home_id 'dev-home-001')
  /// can never be accepted by the cloud schema and must be skipped.
  static final uuidPattern = RegExp(
    r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}'
    r'-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
  );

  static bool isCloudSyncable(String homeId) => uuidPattern.hasMatch(homeId);

  /// Starts the periodic sweep (idempotent) and runs one immediately.
  void start() {
    _timer ??= Timer.periodic(_interval, (_) => syncAll());
    syncAll();
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  /// Runs one sweep across all targets. A failure in one target never
  /// blocks the others; failed rows stay isSynced = false and are retried
  /// on the next sweep.
  Future<void> syncAll() async {
    if (_sweeping) return;
    _sweeping = true;
    try {
      for (final target in _targets) {
        try {
          await target.syncPending();
        } catch (e, st) {
          log(
            'Sync sweep failed for ${target.syncLabel}',
            error: e,
            stackTrace: st,
            name: 'SyncService',
          );
        }
      }
    } finally {
      _sweeping = false;
    }
  }
}
