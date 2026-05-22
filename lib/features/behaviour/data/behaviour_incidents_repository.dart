import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/audit/audit_log_writer.dart';
import '../../../core/offline/app_database.dart';
import '../../../features/auth/domain/app_user.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../domain/behaviour_incident.dart';
import 'behaviour_incidents_dao.dart';

class BehaviourIncidentsRepository {
  BehaviourIncidentsRepository({
    required BehaviourIncidentsDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
    required AuditLogWriter auditWriter,
  })  : _dao = dao,
        _supabaseClient = supabaseClient,
        _currentUser = currentUser,
        _audit = auditWriter;

  final BehaviourIncidentsDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;
  final AuditLogWriter _audit;

  Stream<List<BehaviourIncident>> watchByChild(String childId) =>
      _dao.watchByChild(childId).map((rows) => rows.map(_toDomain).toList());

  Future<void> save(BehaviourIncident incident) async {
    final existing = await _dao.findById(incident.id);
    final isNew = existing == null;
    final withUser = incident.copyWith(
      createdById: isNew ? _currentUser?.id : incident.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsert(_toCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'behaviour_incidents',
      recordId: incident.id,
      before: isNew ? null : _toDomain(existing).toJson(),
      after: withUser.toJson(),
    );
    _trySyncToSupabase(withUser);
  }

  Future<void> delete(String id) async {
    final existing = await _dao.findById(id);
    await _dao.softDelete(id);
    await _audit.record(
      action: 'delete',
      table: 'behaviour_incidents',
      recordId: id,
      before: existing != null ? _toDomain(existing).toJson() : null,
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────

  BehaviourIncident _toDomain(BehaviourIncidentRow r) => BehaviourIncident(
        id: r.id,
        homeId: r.homeId,
        childId: r.childId,
        shift: ShiftType.values.byName(r.shift),
        occurredAt: r.occurredAt,
        severity: BehaviourSeverity.values.byName(r.severity),
        antecedent: r.antecedent,
        behaviour: r.behaviour,
        consequence: r.consequence,
        durationMinutes: r.durationMinutes,
        location: r.location,
        physicalIntervention: r.physicalIntervention,
        interventionDetails: r.interventionDetails,
        injuryOccurred: r.injuryOccurred,
        injuryDetails: r.injuryDetails,
        notes: r.notes,
        recordedById: r.recordedById,
        recordedByName: r.recordedByName,
        createdById: r.createdById,
        updatedById: r.updatedById,
        deletedAt: r.deletedAt,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        isSynced: r.isSynced,
      );

  BehaviourIncidentsTableCompanion _toCompanion(BehaviourIncident i) =>
      BehaviourIncidentsTableCompanion(
        id: Value(i.id),
        homeId: Value(i.homeId),
        childId: Value(i.childId),
        shift: Value(i.shift.name),
        occurredAt: Value(i.occurredAt.toUtc()),
        severity: Value(i.severity.name),
        antecedent: Value(i.antecedent),
        behaviour: Value(i.behaviour),
        consequence: Value(i.consequence),
        durationMinutes: Value(i.durationMinutes),
        location: Value(i.location),
        physicalIntervention: Value(i.physicalIntervention),
        interventionDetails: Value(i.interventionDetails),
        injuryOccurred: Value(i.injuryOccurred),
        injuryDetails: Value(i.injuryDetails),
        notes: Value(i.notes),
        recordedById: Value(i.recordedById),
        recordedByName: Value(i.recordedByName),
        createdById: Value(i.createdById),
        updatedById: Value(i.updatedById),
        deletedAt: Value(i.deletedAt?.toUtc()),
        createdAt: Value(i.createdAt.toUtc()),
        updatedAt: Value(i.updatedAt.toUtc()),
        isSynced: Value(i.isSynced),
      );

  void _trySyncToSupabase(BehaviourIncident i) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('behaviour_incidents').upsert({
        'id': i.id,
        'home_id': i.homeId,
        'child_id': i.childId,
        'shift': i.shift.name,
        'occurred_at': i.occurredAt.toUtc().toIso8601String(),
        'severity': i.severity.name,
        'antecedent': i.antecedent,
        'behaviour': i.behaviour,
        'consequence': i.consequence,
        'duration_minutes': i.durationMinutes,
        'location': i.location,
        'physical_intervention': i.physicalIntervention,
        'intervention_details': i.interventionDetails,
        'injury_occurred': i.injuryOccurred,
        'injury_details': i.injuryDetails,
        'notes': i.notes,
        'recorded_by_id': i.recordedById,
        'recorded_by_name': i.recordedByName,
        'created_by_id': i.createdById,
        'updated_by_id': i.updatedById,
        'updated_at': i.updatedAt.toUtc().toIso8601String(),
      });
      await _dao.upsert(_toCompanion(i.copyWith(isSynced: true)));
    } catch (err, st) {
      log('Sync failed for behaviour incident ${i.id}',
          error: err, stackTrace: st, name: 'BehaviourIncidentsRepository');
    }
  }
}
