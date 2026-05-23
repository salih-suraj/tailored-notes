import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/audit/audit_log_writer.dart';
import '../../../core/offline/app_database.dart';
import '../../../features/auth/domain/app_user.dart';
import '../domain/incident_report.dart';
import 'incident_reports_dao.dart';

class IncidentReportsRepository {
  IncidentReportsRepository({
    required IncidentReportsDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
    required AuditLogWriter auditWriter,
  })  : _dao = dao,
        _supabaseClient = supabaseClient,
        _currentUser = currentUser,
        _audit = auditWriter;

  final IncidentReportsDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;
  final AuditLogWriter _audit;

  Stream<List<IncidentReport>> watchByChild(String childId) =>
      _dao.watchByChild(childId).map((rows) => rows.map(_toDomain).toList());

  Future<void> save(IncidentReport report) async {
    final existing = await _dao.findById(report.id);
    final isNew = existing == null;
    final withUser = report.copyWith(
      createdById: isNew ? _currentUser?.id : report.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsert(_toCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'incident_reports',
      recordId: report.id,
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
      table: 'incident_reports',
      recordId: id,
      before: existing != null ? _toDomain(existing).toJson() : null,
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────

  IncidentReport _toDomain(IncidentReportRow r) => IncidentReport(
        id: r.id,
        homeId: r.homeId,
        childId: r.childId,
        incidentType: IncidentType.values.byName(r.incidentType),
        severity: IncidentSeverity.values.byName(r.severity),
        title: r.title,
        occurredAt: r.occurredAt,
        location: r.location,
        description: r.description,
        immediateAction: r.immediateAction,
        injuryDetails: r.injuryDetails,
        policeNotified: r.policeNotified,
        parentNotified: r.parentNotified,
        managerNotified: r.managerNotified,
        followUpRequired: r.followUpRequired,
        followUpDetails: r.followUpDetails,
        reportedById: r.reportedById,
        reportedByName: r.reportedByName,
        createdById: r.createdById,
        updatedById: r.updatedById,
        deletedAt: r.deletedAt,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        isSynced: r.isSynced,
      );

  IncidentReportsTableCompanion _toCompanion(IncidentReport r) =>
      IncidentReportsTableCompanion(
        id: Value(r.id),
        homeId: Value(r.homeId),
        childId: Value(r.childId),
        incidentType: Value(r.incidentType.name),
        severity: Value(r.severity.name),
        title: Value(r.title),
        occurredAt: Value(r.occurredAt.toUtc()),
        location: Value(r.location),
        description: Value(r.description),
        immediateAction: Value(r.immediateAction),
        injuryDetails: Value(r.injuryDetails),
        policeNotified: Value(r.policeNotified),
        parentNotified: Value(r.parentNotified),
        managerNotified: Value(r.managerNotified),
        followUpRequired: Value(r.followUpRequired),
        followUpDetails: Value(r.followUpDetails),
        reportedById: Value(r.reportedById),
        reportedByName: Value(r.reportedByName),
        createdById: Value(r.createdById),
        updatedById: Value(r.updatedById),
        deletedAt: Value(r.deletedAt?.toUtc()),
        createdAt: Value(r.createdAt.toUtc()),
        updatedAt: Value(r.updatedAt.toUtc()),
        isSynced: Value(r.isSynced),
      );

  void _trySyncToSupabase(IncidentReport r) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('incident_reports').upsert({
        'id': r.id,
        'home_id': r.homeId,
        'child_id': r.childId,
        'incident_type': r.incidentType.name,
        'severity': r.severity.name,
        'title': r.title,
        'occurred_at': r.occurredAt.toUtc().toIso8601String(),
        'location': r.location,
        'description': r.description,
        'immediate_action': r.immediateAction,
        'injury_details': r.injuryDetails,
        'police_notified': r.policeNotified,
        'parent_notified': r.parentNotified,
        'manager_notified': r.managerNotified,
        'follow_up_required': r.followUpRequired,
        'follow_up_details': r.followUpDetails,
        'reported_by_id': r.reportedById,
        'reported_by_name': r.reportedByName,
        'created_by_id': r.createdById,
        'updated_by_id': r.updatedById,
        'updated_at': r.updatedAt.toUtc().toIso8601String(),
      });
      await _dao.upsert(_toCompanion(r.copyWith(isSynced: true)));
    } catch (err, st) {
      log('Sync failed for incident report ${r.id}',
          error: err, stackTrace: st, name: 'IncidentReportsRepository');
    }
  }
}
