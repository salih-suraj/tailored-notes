import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/audit/audit_log_writer.dart';
import '../../../core/offline/app_database.dart';
import '../../../features/auth/domain/app_user.dart';
import '../domain/care_plan.dart';
import '../domain/care_plan_goal.dart';
import 'care_plans_dao.dart';

class CarePlansRepository {
  CarePlansRepository({
    required CarePlansDao dao,
    required SupabaseClient? supabaseClient,
    required AppUser? currentUser,
    required AuditLogWriter auditWriter,
  })  : _dao = dao,
        _supabaseClient = supabaseClient,
        _currentUser = currentUser,
        _audit = auditWriter;

  final CarePlansDao _dao;
  final SupabaseClient? _supabaseClient;
  final AppUser? _currentUser;
  final AuditLogWriter _audit;

  // ── Care plans ─────────────────────────────────────────────────────────

  Stream<List<CarePlan>> watchByChild(String childId) =>
      _dao.watchByChild(childId).map((rows) => rows.map(_planToDomain).toList());

  Future<void> savePlan(CarePlan plan) async {
    final existing = await _dao.findPlanById(plan.id);
    final isNew = existing == null;
    final withUser = plan.copyWith(
      createdById: isNew ? _currentUser?.id : plan.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsertPlan(_planToCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'care_plans',
      recordId: plan.id,
      before: isNew ? null : _planToDomain(existing).toJson(),
      after: withUser.toJson(),
    );
    _trySyncPlan(withUser);
  }

  Future<void> deletePlan(String id) async {
    final existing = await _dao.findPlanById(id);
    await _dao.softDeletePlan(id);
    await _audit.record(
      action: 'delete',
      table: 'care_plans',
      recordId: id,
      before: existing != null ? _planToDomain(existing).toJson() : null,
    );
  }

  // ── Goals ──────────────────────────────────────────────────────────────

  Stream<List<CarePlanGoal>> watchGoals(String carePlanId) =>
      _dao.watchGoals(carePlanId).map((rows) => rows.map(_goalToDomain).toList());

  Future<void> saveGoal(CarePlanGoal goal) async {
    final existing = await _dao.findGoalById(goal.id);
    final isNew = existing == null;
    final withUser = goal.copyWith(
      createdById: isNew ? _currentUser?.id : goal.createdById,
      updatedById: _currentUser?.id,
    );
    await _dao.upsertGoal(_goalToCompanion(withUser));
    await _audit.record(
      action: isNew ? 'insert' : 'update',
      table: 'care_plan_goals',
      recordId: goal.id,
      before: isNew ? null : _goalToDomain(existing).toJson(),
      after: withUser.toJson(),
    );
    _trySyncGoal(withUser);
  }

  Future<void> deleteGoal(String id) async {
    final existing = await _dao.findGoalById(id);
    await _dao.softDeleteGoal(id);
    await _audit.record(
      action: 'delete',
      table: 'care_plan_goals',
      recordId: id,
      before: existing != null ? _goalToDomain(existing).toJson() : null,
    );
  }

  // ── Helpers ──────────────────────────────────────────────────────────────

  CarePlan _planToDomain(CarePlanRow r) => CarePlan(
        id: r.id,
        homeId: r.homeId,
        childId: r.childId,
        title: r.title,
        status: CarePlanStatus.values.byName(r.status),
        reviewDate: r.reviewDate,
        notes: r.notes,
        authorId: r.authorId,
        authorName: r.authorName,
        approvedById: r.approvedById,
        approvedByName: r.approvedByName,
        approvedAt: r.approvedAt,
        createdById: r.createdById,
        updatedById: r.updatedById,
        deletedAt: r.deletedAt,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        isSynced: r.isSynced,
      );

  CarePlansTableCompanion _planToCompanion(CarePlan p) =>
      CarePlansTableCompanion(
        id: Value(p.id),
        homeId: Value(p.homeId),
        childId: Value(p.childId),
        title: Value(p.title),
        status: Value(p.status.name),
        reviewDate: Value(p.reviewDate),
        notes: Value(p.notes),
        authorId: Value(p.authorId),
        authorName: Value(p.authorName),
        approvedById: Value(p.approvedById),
        approvedByName: Value(p.approvedByName),
        approvedAt: Value(p.approvedAt?.toUtc()),
        createdById: Value(p.createdById),
        updatedById: Value(p.updatedById),
        deletedAt: Value(p.deletedAt?.toUtc()),
        createdAt: Value(p.createdAt.toUtc()),
        updatedAt: Value(p.updatedAt.toUtc()),
        isSynced: Value(p.isSynced),
      );

  CarePlanGoal _goalToDomain(CarePlanGoalRow r) => CarePlanGoal(
        id: r.id,
        carePlanId: r.carePlanId,
        homeId: r.homeId,
        childId: r.childId,
        category: GoalCategory.values.byName(r.category),
        title: r.title,
        description: r.description,
        strategy: r.strategy,
        targetDate: r.targetDate,
        status: GoalStatus.values.byName(r.status),
        progressNotes: r.progressNotes,
        sortOrder: r.sortOrder,
        createdById: r.createdById,
        updatedById: r.updatedById,
        deletedAt: r.deletedAt,
        createdAt: r.createdAt,
        updatedAt: r.updatedAt,
        isSynced: r.isSynced,
      );

  CarePlanGoalsTableCompanion _goalToCompanion(CarePlanGoal g) =>
      CarePlanGoalsTableCompanion(
        id: Value(g.id),
        carePlanId: Value(g.carePlanId),
        homeId: Value(g.homeId),
        childId: Value(g.childId),
        category: Value(g.category.name),
        title: Value(g.title),
        description: Value(g.description),
        strategy: Value(g.strategy),
        targetDate: Value(g.targetDate),
        status: Value(g.status.name),
        progressNotes: Value(g.progressNotes),
        sortOrder: Value(g.sortOrder),
        createdById: Value(g.createdById),
        updatedById: Value(g.updatedById),
        deletedAt: Value(g.deletedAt?.toUtc()),
        createdAt: Value(g.createdAt.toUtc()),
        updatedAt: Value(g.updatedAt.toUtc()),
        isSynced: Value(g.isSynced),
      );

  void _trySyncPlan(CarePlan p) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('care_plans').upsert({
        'id': p.id,
        'home_id': p.homeId,
        'child_id': p.childId,
        'title': p.title,
        'status': p.status.name,
        'review_date': p.reviewDate,
        'notes': p.notes,
        'author_id': p.authorId,
        'author_name': p.authorName,
        'approved_by_id': p.approvedById,
        'approved_by_name': p.approvedByName,
        'approved_at': p.approvedAt?.toUtc().toIso8601String(),
        'created_by_id': p.createdById,
        'updated_by_id': p.updatedById,
        'updated_at': p.updatedAt.toUtc().toIso8601String(),
      });
      await _dao.upsertPlan(_planToCompanion(p.copyWith(isSynced: true)));
    } catch (err, st) {
      log('Supabase sync failed for care plan ${p.id}',
          error: err, stackTrace: st, name: 'CarePlansRepository');
    }
  }

  void _trySyncGoal(CarePlanGoal g) async {
    final client = _supabaseClient;
    if (client == null) return;
    try {
      await client.from('care_plan_goals').upsert({
        'id': g.id,
        'care_plan_id': g.carePlanId,
        'home_id': g.homeId,
        'child_id': g.childId,
        'category': g.category.name,
        'title': g.title,
        'description': g.description,
        'strategy': g.strategy,
        'target_date': g.targetDate,
        'status': g.status.name,
        'progress_notes': g.progressNotes,
        'sort_order': g.sortOrder,
        'created_by_id': g.createdById,
        'updated_by_id': g.updatedById,
        'updated_at': g.updatedAt.toUtc().toIso8601String(),
      });
      await _dao.upsertGoal(_goalToCompanion(g.copyWith(isSynced: true)));
    } catch (err, st) {
      log('Supabase sync failed for goal ${g.id}',
          error: err, stackTrace: st, name: 'CarePlansRepository');
    }
  }
}
