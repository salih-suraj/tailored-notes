import 'package:drift/drift.dart';

import '../../../core/offline/app_database.dart';
import 'care_plan_goals_table.dart';
import 'care_plans_table.dart';

part 'care_plans_dao.g.dart';

@DriftAccessor(tables: [CarePlansTable, CarePlanGoalsTable])
class CarePlansDao extends DatabaseAccessor<AppDatabase>
    with _$CarePlansDaoMixin {
  CarePlansDao(super.db);

  // ── Care plans ─────────────────────────────────────────────────────────

  Stream<List<CarePlanRow>> watchByChild(String childId) =>
      (select(carePlansTable)
            ..where(
              (t) => t.childId.equals(childId) & t.deletedAt.isNull(),
            )
            ..orderBy([
              (t) => OrderingTerm.desc(t.updatedAt),
            ]))
          .watch();

  Future<CarePlanRow?> findPlanById(String id) =>
      (select(carePlansTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<void> upsertPlan(CarePlansTableCompanion plan) =>
      into(carePlansTable).insertOnConflictUpdate(plan);

  Future<void> softDeletePlan(String id) =>
      (update(carePlansTable)..where((t) => t.id.equals(id))).write(
        CarePlansTableCompanion(
          deletedAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          isSynced: const Value(false),
        ),
      );

  // ── Goals ──────────────────────────────────────────────────────────────

  Stream<List<CarePlanGoalRow>> watchGoals(String carePlanId) =>
      (select(carePlanGoalsTable)
            ..where(
              (t) =>
                  t.carePlanId.equals(carePlanId) & t.deletedAt.isNull(),
            )
            ..orderBy([
              (t) => OrderingTerm.asc(t.sortOrder),
              (t) => OrderingTerm.asc(t.createdAt),
            ]))
          .watch();

  Future<CarePlanGoalRow?> findGoalById(String id) =>
      (select(carePlanGoalsTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<void> upsertGoal(CarePlanGoalsTableCompanion goal) =>
      into(carePlanGoalsTable).insertOnConflictUpdate(goal);

  Future<void> softDeleteGoal(String id) =>
      (update(carePlanGoalsTable)..where((t) => t.id.equals(id))).write(
        CarePlanGoalsTableCompanion(
          deletedAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          isSynced: const Value(false),
        ),
      );
}
