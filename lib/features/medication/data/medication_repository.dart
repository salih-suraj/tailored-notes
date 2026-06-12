import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/audit/audit_log_writer.dart';
import '../../../core/offline/app_database.dart';
import '../../../features/auth/domain/app_user.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../core/offline/sync_service.dart';
import '../../../core/time/uk_time.dart';
import '../domain/med_administration.dart';
import '../domain/prescribed_med.dart';
import 'medication_dao.dart';

class MedicationRepository implements SyncTarget {
  MedicationRepository({
    required MedicationDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
    required AuditLogWriter auditWriter,
  })  : _dao = dao,
        _supabaseClient = supabaseClient,
        _currentUser = currentUser,
        _audit = auditWriter;

  final MedicationDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;
  final AuditLogWriter _audit;

  // ── Prescribed meds ───────────────────────────────────────────────────

  Stream<List<PrescribedMed>> watchActiveMeds(String childId) =>
      _dao
          .watchActiveByChild(childId)
          .map((rows) => rows.map(_medToDomain).toList());

  Future<void> saveMed(PrescribedMed med) async {
    final existing = await _dao.findMedById(med.id);
    final isNew = existing == null;
    final withUser = med.copyWith(
      createdById: isNew ? _currentUser?.id : med.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsertMed(_medToCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'prescribed_medications',
      recordId: med.id,
      before: isNew ? null : _medToDomain(existing).toJson(),
      after: withUser.toJson(),
    );
    _trySyncMed(withUser);
  }

  Future<void> deleteMed(String id) async {
    final existing = await _dao.findMedById(id);
    await _dao.softDeleteMed(id);
    await _audit.record(
      action: 'delete',
      table: 'prescribed_medications',
      recordId: id,
      before: existing != null ? _medToDomain(existing).toJson() : null,
    );

    final deleted = await _dao.findMedById(id);
    if (deleted != null) _trySyncMed(_medToDomain(deleted));
  }

  @override
  String get syncLabel => 'medication';

  @override
  Future<void> syncPending() async {
    if (_supabaseClient == null) return;
    for (final row in await _dao.getUnsyncedMeds()) {
      final med = _medToDomain(row);
      if (!SyncService.isCloudSyncable(med.homeId)) continue;
      await _trySyncMed(med);
    }
    for (final row in await _dao.getUnsyncedAdmins()) {
      final admin = _adminToDomain(row);
      if (!SyncService.isCloudSyncable(admin.homeId)) continue;
      await _trySyncAdmin(admin);
    }
  }

  // ── Administrations ───────────────────────────────────────────────────

  /// Live stream of today's (London time) administration records for [childId].
  Stream<List<MedAdministration>> watchTodayAdmins(String childId) {
    return _dao
        .watchByChildAndDate(
          childId,
          UkTime.startOfTodayUtc(),
          UkTime.endOfTodayUtc(),
        )
        .map((rows) => rows.map(_adminToDomain).toList());
  }

  Future<void> recordAdministration(MedAdministration admin) async {
    final existing = await _dao.findAdminById(admin.id);
    final isNew = existing == null;
    final withUser = admin.copyWith(
      createdById: isNew ? _currentUser?.id : admin.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsertAdmin(_adminToCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'med_administrations',
      recordId: admin.id,
      before: isNew ? null : _adminToDomain(existing).toJson(),
      after: withUser.toJson(),
    );
    _trySyncAdmin(withUser);
  }

  // ── Helpers ───────────────────────────────────────────────────────────

  PrescribedMed _medToDomain(PrescribedMedRow r) => PrescribedMed(
        id: r.id,
        homeId: r.homeId,
        childId: r.childId,
        medicationName: r.medicationName,
        dose: r.dose,
        route: MedRoute.values.byName(r.route),
        frequency: MedFrequency.values.byName(r.frequency),
        instructions: r.instructions,
        prescribedBy: r.prescribedBy,
        startDate: r.startDate,
        endDate: r.endDate,
        isActive: r.isActive,
        createdById: r.createdById,
        updatedById: r.updatedById,
        deletedAt: r.deletedAt,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        isSynced: r.isSynced,
      );

  PrescribedMedsTableCompanion _medToCompanion(PrescribedMed m) =>
      PrescribedMedsTableCompanion(
        id: Value(m.id),
        homeId: Value(m.homeId),
        childId: Value(m.childId),
        medicationName: Value(m.medicationName),
        dose: Value(m.dose),
        route: Value(m.route.name),
        frequency: Value(m.frequency.name),
        instructions: Value(m.instructions),
        prescribedBy: Value(m.prescribedBy),
        startDate: Value(m.startDate),
        endDate: Value(m.endDate),
        isActive: Value(m.isActive),
        createdById: Value(m.createdById),
        updatedById: Value(m.updatedById),
        deletedAt: Value(m.deletedAt?.toUtc()),
        createdAt: Value(m.createdAt.toUtc()),
        updatedAt: Value(m.updatedAt.toUtc()),
        isSynced: Value(m.isSynced),
      );

  MedAdministration _adminToDomain(MedAdministrationRow r) =>
      MedAdministration(
        id: r.id,
        homeId: r.homeId,
        childId: r.childId,
        prescribedMedId: r.prescribedMedId,
        medicationName: r.medicationName,
        dose: r.dose,
        outcome: AdminOutcome.values.byName(r.outcome),
        shift: ShiftType.values.byName(r.shift),
        administeredAt: r.administeredAt,
        administeredById: r.administeredById,
        administeredByName: r.administeredByName,
        reason: r.reason,
        notes: r.notes,
        createdById: r.createdById,
        updatedById: r.updatedById,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        isSynced: r.isSynced,
      );

  MedAdministrationsTableCompanion _adminToCompanion(MedAdministration a) =>
      MedAdministrationsTableCompanion(
        id: Value(a.id),
        homeId: Value(a.homeId),
        childId: Value(a.childId),
        prescribedMedId: Value(a.prescribedMedId),
        medicationName: Value(a.medicationName),
        dose: Value(a.dose),
        outcome: Value(a.outcome.name),
        shift: Value(a.shift.name),
        administeredAt: Value(a.administeredAt.toUtc()),
        administeredById: Value(a.administeredById),
        administeredByName: Value(a.administeredByName),
        reason: Value(a.reason),
        notes: Value(a.notes),
        createdById: Value(a.createdById),
        updatedById: Value(a.updatedById),
        createdAt: Value(a.createdAt.toUtc()),
        updatedAt: Value(a.updatedAt.toUtc()),
        isSynced: Value(a.isSynced),
      );

  Future<void> _trySyncMed(PrescribedMed m) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('prescribed_medications').upsert({
        'id': m.id, 'home_id': m.homeId, 'child_id': m.childId,
        'medication_name': m.medicationName, 'dose': m.dose,
        'route': m.route.name, 'frequency': m.frequency.name,
        'instructions': m.instructions, 'prescribed_by': m.prescribedBy,
        'start_date': m.startDate, 'end_date': m.endDate,
        'is_active': m.isActive, 'created_by_id': m.createdById,
        'updated_by_id': m.updatedById,
        'updated_at': m.updatedAt.toUtc().toIso8601String(),
        'deleted_at': m.deletedAt?.toUtc().toIso8601String(),
      });
      await _dao.upsertMed(_medToCompanion(m.copyWith(isSynced: true)));
    } catch (err, st) {
      log('Sync failed for prescribed med ${m.id}',
          error: err, stackTrace: st, name: 'MedicationRepository');
    }
  }

  // med_administrations is append-only — no deleted_at column locally or
  // in the cloud schema, so the payload stays as-is.
  Future<void> _trySyncAdmin(MedAdministration a) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('med_administrations').upsert({
        'id': a.id, 'home_id': a.homeId, 'child_id': a.childId,
        'prescribed_med_id': a.prescribedMedId,
        'medication_name': a.medicationName, 'dose': a.dose,
        'outcome': a.outcome.name, 'shift': a.shift.name,
        'administered_at': a.administeredAt.toUtc().toIso8601String(),
        'administered_by_id': a.administeredById,
        'administered_by_name': a.administeredByName,
        'reason': a.reason, 'notes': a.notes,
        'created_by_id': a.createdById, 'updated_by_id': a.updatedById,
        'updated_at': a.updatedAt.toUtc().toIso8601String(),
      });
      await _dao.upsertAdmin(_adminToCompanion(a.copyWith(isSynced: true)));
    } catch (err, st) {
      log('Sync failed for med admin ${a.id}',
          error: err, stackTrace: st, name: 'MedicationRepository');
    }
  }
}
