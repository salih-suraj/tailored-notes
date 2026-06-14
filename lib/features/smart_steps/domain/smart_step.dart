import 'package:freezed_annotation/freezed_annotation.dart';

part 'smart_step.freezed.dart';
part 'smart_step.g.dart';

enum StepStatus {
  @JsonValue('not_started')
  notStarted,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('achieved')
  achieved;

  String get displayName => switch (this) {
    StepStatus.notStarted => 'Not Started',
    StepStatus.inProgress => 'In Progress',
    StepStatus.achieved => 'Achieved',
  };
}

enum StepCategory {
  @JsonValue('communication')
  communication,
  @JsonValue('self_care')
  selfCare,
  @JsonValue('independence')
  independence,
  @JsonValue('social')
  social,
  @JsonValue('emotional')
  emotional,
  @JsonValue('learning')
  learning,
  @JsonValue('physical')
  physical,
  @JsonValue('other')
  other;

  String get displayName => switch (this) {
    StepCategory.communication => 'Communication',
    StepCategory.selfCare => 'Self-Care',
    StepCategory.independence => 'Independence',
    StepCategory.social => 'Social',
    StepCategory.emotional => 'Emotional',
    StepCategory.learning => 'Learning',
    StepCategory.physical => 'Physical',
    StepCategory.other => 'Other',
  };
}

/// A single developmental goal / step in the child's Smart Steps plan.
@freezed
class SmartStep with _$SmartStep {
  const factory SmartStep({
    required String id,
    required String homeId,
    required String childId,
    required StepCategory category,
    required String title,
    String? description,
    String? targetDate, // 'YYYY-MM-DD'
    required StepStatus status,
    String? achievedDate, // 'YYYY-MM-DD'
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _SmartStep;

  factory SmartStep.fromJson(Map<String, dynamic> json) =>
      _$SmartStepFromJson(json);
}
