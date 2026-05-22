import 'package:freezed_annotation/freezed_annotation.dart';

import '../../daily_notes/domain/daily_note.dart';

part 'step_progress.freezed.dart';
part 'step_progress.g.dart';

enum ProgressOutcome {
  @JsonValue('attempted') attempted,
  @JsonValue('progressed') progressed,
  @JsonValue('achieved') achieved;

  String get displayName => switch (this) {
        ProgressOutcome.attempted => 'Attempted',
        ProgressOutcome.progressed => 'Progressed',
        ProgressOutcome.achieved => 'Achieved',
      };
}

/// A single progress note recorded by staff against a Smart Step.
@freezed
class StepProgress with _$StepProgress {
  const factory StepProgress({
    required String id,
    required String homeId,
    required String childId,
    required String stepId,
    required String date, // 'YYYY-MM-DD'
    required ShiftType shift,
    required ProgressOutcome outcome,
    required String note,
    required String recordedById,
    required String recordedByName,
    String? createdById,
    String? updatedById,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _StepProgress;

  factory StepProgress.fromJson(Map<String, dynamic> json) =>
      _$StepProgressFromJson(json);
}
