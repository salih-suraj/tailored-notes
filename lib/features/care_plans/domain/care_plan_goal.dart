import 'package:freezed_annotation/freezed_annotation.dart';

part 'care_plan_goal.freezed.dart';
part 'care_plan_goal.g.dart';

enum GoalCategory {
  @JsonValue('communication') communication,
  @JsonValue('independence') independence,
  @JsonValue('behaviour') behaviour,
  @JsonValue('health') health,
  @JsonValue('education') education,
  @JsonValue('social') social,
  @JsonValue('other') other;

  String get displayName => switch (this) {
        GoalCategory.communication => 'Communication',
        GoalCategory.independence => 'Independence & Daily Living',
        GoalCategory.behaviour => 'Behaviour & Emotional Wellbeing',
        GoalCategory.health => 'Health & Medical',
        GoalCategory.education => 'Education & Learning',
        GoalCategory.social => 'Social & Relationships',
        GoalCategory.other => 'Other',
      };
}

enum GoalStatus {
  @JsonValue('not_started') notStarted,
  @JsonValue('in_progress') inProgress,
  @JsonValue('achieved') achieved,
  @JsonValue('discontinued') discontinued;

  String get displayName => switch (this) {
        GoalStatus.notStarted => 'Not Started',
        GoalStatus.inProgress => 'In Progress',
        GoalStatus.achieved => 'Achieved',
        GoalStatus.discontinued => 'Discontinued',
      };
}

/// A single goal within a care plan.
@freezed
class CarePlanGoal with _$CarePlanGoal {
  const factory CarePlanGoal({
    required String id,
    required String carePlanId,
    required String homeId,
    required String childId,
    required GoalCategory category,
    required String title,
    String? description,
    String? strategy,
    String? targetDate, // 'YYYY-MM-DD'
    required GoalStatus status,
    String? progressNotes,
    @Default(0) int sortOrder,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _CarePlanGoal;

  factory CarePlanGoal.fromJson(Map<String, dynamic> json) =>
      _$CarePlanGoalFromJson(json);
}
