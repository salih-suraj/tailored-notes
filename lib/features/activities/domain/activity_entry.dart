import 'package:freezed_annotation/freezed_annotation.dart';

import '../../daily_notes/domain/daily_note.dart';

part 'activity_entry.freezed.dart';
part 'activity_entry.g.dart';

enum ActivityCategory {
  @JsonValue('physical') physical,
  @JsonValue('creative') creative,
  @JsonValue('educational') educational,
  @JsonValue('social') social,
  @JsonValue('community') community,
  @JsonValue('life_skills') lifeSkills,
  @JsonValue('other') other;

  String get displayName => switch (this) {
        ActivityCategory.physical => 'Physical',
        ActivityCategory.creative => 'Creative',
        ActivityCategory.educational => 'Educational',
        ActivityCategory.social => 'Social',
        ActivityCategory.community => 'Community',
        ActivityCategory.lifeSkills => 'Life Skills',
        ActivityCategory.other => 'Other',
      };
}

/// A single activity, reward, or achievement record for a child.
/// Covers activity participation, reward chart points, and positive milestones.
@freezed
class ActivityEntry with _$ActivityEntry {
  const factory ActivityEntry({
    required String id,
    required String homeId,
    required String childId,
    required String date, // 'YYYY-MM-DD'
    required ShiftType shift,
    required ActivityCategory category,
    required String title,
    String? description,
    int? durationMinutes,
    @Default(false) bool rewardEarned,
    String? achievement, // positive milestone to highlight
    required String recordedById,
    required String recordedByName,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _ActivityEntry;

  factory ActivityEntry.fromJson(Map<String, dynamic> json) =>
      _$ActivityEntryFromJson(json);
}
