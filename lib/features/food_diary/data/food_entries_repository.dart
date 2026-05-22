import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/audit/audit_log_writer.dart';
import '../../../core/offline/app_database.dart';
import '../../../features/auth/domain/app_user.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../domain/food_entry.dart';
import 'food_entries_dao.dart';

class FoodEntriesRepository {
  FoodEntriesRepository({
    required FoodEntriesDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
    required AuditLogWriter auditWriter,
  })  : _dao = dao,
        _supabaseClient = supabaseClient,
        _currentUser = currentUser,
        _audit = auditWriter;

  final FoodEntriesDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;
  final AuditLogWriter _audit;

  Stream<List<FoodEntry>> watchByChild(String childId) =>
      _dao.watchByChild(childId).map((rows) => rows.map(_toDomain).toList());

  Future<void> save(FoodEntry entry) async {
    final existing = await _dao.findById(entry.id);
    final isNew = existing == null;
    final withUser = entry.copyWith(
      createdById: isNew ? _currentUser?.id : entry.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsert(_toCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'food_entries',
      recordId: entry.id,
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
      table: 'food_entries',
      recordId: id,
      before: existing != null ? _toDomain(existing).toJson() : null,
    );
  }

  FoodEntry _toDomain(FoodEntryRow r) => FoodEntry(
        id: r.id,
        homeId: r.homeId,
        childId: r.childId,
        date: r.date,
        shift: ShiftType.values.byName(r.shift),
        mealType: MealType.values.byName(r.mealType),
        description: r.description,
        appetite: Appetite.values.byName(r.appetite),
        concerns: r.concerns,
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

  FoodEntriesTableCompanion _toCompanion(FoodEntry e) =>
      FoodEntriesTableCompanion(
        id: Value(e.id),
        homeId: Value(e.homeId),
        childId: Value(e.childId),
        date: Value(e.date),
        shift: Value(e.shift.name),
        mealType: Value(e.mealType.name),
        description: Value(e.description),
        appetite: Value(e.appetite.name),
        concerns: Value(e.concerns),
        notes: Value(e.notes),
        recordedById: Value(e.recordedById),
        recordedByName: Value(e.recordedByName),
        createdById: Value(e.createdById),
        updatedById: Value(e.updatedById),
        deletedAt: Value(e.deletedAt?.toUtc()),
        createdAt: Value(e.createdAt.toUtc()),
        updatedAt: Value(e.updatedAt.toUtc()),
        isSynced: Value(e.isSynced),
      );

  void _trySyncToSupabase(FoodEntry e) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('food_entries').upsert({
        'id': e.id, 'home_id': e.homeId, 'child_id': e.childId,
        'date': e.date, 'shift': e.shift.name,
        'meal_type': e.mealType.name, 'description': e.description,
        'appetite': e.appetite.name, 'concerns': e.concerns,
        'notes': e.notes, 'recorded_by_id': e.recordedById,
        'recorded_by_name': e.recordedByName,
        'created_by_id': e.createdById, 'updated_by_id': e.updatedById,
        'updated_at': e.updatedAt.toUtc().toIso8601String(),
      });
      await _dao.upsert(_toCompanion(e.copyWith(isSynced: true)));
    } catch (err, st) {
      log('Sync failed for food entry ${e.id}',
          error: err, stackTrace: st, name: 'FoodEntriesRepository');
    }
  }
}
