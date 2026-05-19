import 'package:freezed_annotation/freezed_annotation.dart';

part 'care_plan.freezed.dart';
part 'care_plan.g.dart';

enum CarePlanStatus {
  @JsonValue('draft') draft,
  @JsonValue('active') active,
  @JsonValue('under_review') underReview,
  @JsonValue('archived') archived;

  String get displayName => switch (this) {
        CarePlanStatus.draft => 'Draft',
        CarePlanStatus.active => 'Active',
        CarePlanStatus.underReview => 'Under Review',
        CarePlanStatus.archived => 'Archived',
      };
}

/// An overarching care plan document for a child.
/// Contains goals and support strategies reviewed periodically.
@freezed
class CarePlan with _$CarePlan {
  const factory CarePlan({
    required String id,
    required String homeId,
    required String childId,
    required String title,
    required CarePlanStatus status,
    String? reviewDate, // 'YYYY-MM-DD'
    String? notes,
    required String authorId,
    required String authorName,
    String? approvedById,
    String? approvedByName,
    DateTime? approvedAt,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _CarePlan;

  factory CarePlan.fromJson(Map<String, dynamic> json) =>
      _$CarePlanFromJson(json);
}
