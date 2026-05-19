import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/audit/audit_log_writer.dart';
import '../../../core/offline/app_database.dart';
import '../../../features/auth/domain/app_user.dart';
import '../domain/healthcare_contact.dart';
import '../domain/medical_profile.dart';
import 'medical_history_dao.dart';

class MedicalHistoryRepository {
  MedicalHistoryRepository({
    required MedicalHistoryDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
    required AuditLogWriter auditWriter,
  })  : _dao = dao,
        _supabaseClient = supabaseClient,
        _currentUser = currentUser,
        _audit = auditWriter;

  final MedicalHistoryDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;
  final AuditLogWriter _audit;

  // ── Profile ───────────────────────────────────────────────────────────

  Stream<MedicalProfile?> watchProfile(String childId) =>
      _dao.watchProfile(childId).map((r) => r != null ? _profileToDomain(r) : null);

  Future<void> saveProfile(MedicalProfile profile) async {
    final existing = await _dao.findProfile(profile.childId);
    final isNew = existing == null;
    final withUser = profile.copyWith(
      createdById: isNew ? _currentUser?.id : profile.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsertProfile(_profileToCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'medical_profiles',
      recordId: profile.id,
      before: isNew ? null : _profileToDomain(existing).toJson(),
      after: withUser.toJson(),
    );
    _trySyncProfile(withUser);
  }

  // ── Contacts ──────────────────────────────────────────────────────────

  Stream<List<HealthcareContact>> watchContacts(String childId) =>
      _dao.watchContacts(childId)
          .map((rows) => rows.map(_contactToDomain).toList());

  Future<void> saveContact(HealthcareContact contact) async {
    final existing = await _dao.findContactById(contact.id);
    final isNew = existing == null;
    final withUser = contact.copyWith(
      createdById: isNew ? _currentUser?.id : contact.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsertContact(_contactToCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'healthcare_contacts',
      recordId: contact.id,
      before: isNew ? null : _contactToDomain(existing).toJson(),
      after: withUser.toJson(),
    );
    _trySyncContact(withUser);
  }

  Future<void> deleteContact(String id) async {
    final existing = await _dao.findContactById(id);
    await _dao.softDeleteContact(id);
    await _audit.record(
      action: 'delete',
      table: 'healthcare_contacts',
      recordId: id,
      before: existing != null ? _contactToDomain(existing).toJson() : null,
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────

  MedicalProfile _profileToDomain(MedicalProfileRow r) => MedicalProfile(
        id: r.id, homeId: r.homeId, childId: r.childId,
        nhsNumber: r.nhsNumber, bloodType: r.bloodType,
        conditions: r.conditions, allergies: r.allergies,
        immunisationNotes: r.immunisationNotes, notes: r.notes,
        createdById: r.createdById, updatedById: r.updatedById,
        createdAt: r.createdAt, updatedAt: r.updatedAt, isSynced: r.isSynced,
      );

  MedicalProfileTableCompanion _profileToCompanion(MedicalProfile p) =>
      MedicalProfileTableCompanion(
        id: Value(p.id), homeId: Value(p.homeId), childId: Value(p.childId),
        nhsNumber: Value(p.nhsNumber), bloodType: Value(p.bloodType),
        conditions: Value(p.conditions), allergies: Value(p.allergies),
        immunisationNotes: Value(p.immunisationNotes), notes: Value(p.notes),
        createdById: Value(p.createdById), updatedById: Value(p.updatedById),
        createdAt: Value(p.createdAt.toUtc()),
        updatedAt: Value(p.updatedAt.toUtc()), isSynced: Value(p.isSynced),
      );

  HealthcareContact _contactToDomain(HealthcareContactRow r) =>
      HealthcareContact(
        id: r.id, homeId: r.homeId, childId: r.childId,
        contactType: ContactType.values.byName(r.contactType),
        name: r.name, role: r.role, phone: r.phone, email: r.email,
        address: r.address, notes: r.notes,
        createdById: r.createdById, updatedById: r.updatedById,
        deletedAt: r.deletedAt,
        createdAt: r.createdAt, updatedAt: r.updatedAt, isSynced: r.isSynced,
      );

  HealthcareContactsTableCompanion _contactToCompanion(HealthcareContact c) =>
      HealthcareContactsTableCompanion(
        id: Value(c.id), homeId: Value(c.homeId), childId: Value(c.childId),
        contactType: Value(c.contactType.name),
        name: Value(c.name), role: Value(c.role), phone: Value(c.phone),
        email: Value(c.email), address: Value(c.address), notes: Value(c.notes),
        createdById: Value(c.createdById), updatedById: Value(c.updatedById),
        deletedAt: Value(c.deletedAt?.toUtc()),
        createdAt: Value(c.createdAt.toUtc()),
        updatedAt: Value(c.updatedAt.toUtc()), isSynced: Value(c.isSynced),
      );

  void _trySyncProfile(MedicalProfile p) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('medical_profiles').upsert({
        'id': p.id, 'home_id': p.homeId, 'child_id': p.childId,
        'nhs_number': p.nhsNumber, 'blood_type': p.bloodType,
        'conditions': p.conditions, 'allergies': p.allergies,
        'immunisation_notes': p.immunisationNotes, 'notes': p.notes,
        'created_by_id': p.createdById, 'updated_by_id': p.updatedById,
        'updated_at': p.updatedAt.toUtc().toIso8601String(),
      });
      await _dao.upsertProfile(_profileToCompanion(p.copyWith(isSynced: true)));
    } catch (err, st) {
      log('Sync failed for medical profile ${p.id}',
          error: err, stackTrace: st, name: 'MedicalHistoryRepository');
    }
  }

  void _trySyncContact(HealthcareContact c) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('healthcare_contacts').upsert({
        'id': c.id, 'home_id': c.homeId, 'child_id': c.childId,
        'contact_type': c.contactType.name, 'name': c.name, 'role': c.role,
        'phone': c.phone, 'email': c.email, 'address': c.address,
        'notes': c.notes, 'created_by_id': c.createdById,
        'updated_by_id': c.updatedById,
        'updated_at': c.updatedAt.toUtc().toIso8601String(),
      });
      await _dao.upsertContact(_contactToCompanion(c.copyWith(isSynced: true)));
    } catch (err, st) {
      log('Sync failed for contact ${c.id}',
          error: err, stackTrace: st, name: 'MedicalHistoryRepository');
    }
  }
}
