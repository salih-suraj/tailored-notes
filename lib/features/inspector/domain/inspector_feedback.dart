// @JsonKey on freezed constructor params is the documented freezed pattern;
// the analyzer can't see that freezed copies them onto the generated fields.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'inspector_feedback.freezed.dart';
part 'inspector_feedback.g.dart';

enum FeedbackSeverity {
  @JsonValue('compliment') compliment,
  @JsonValue('recommendation') recommendation,
  @JsonValue('requirement') requirement;

  String get displayName => switch (this) {
        FeedbackSeverity.compliment => 'Compliment',
        FeedbackSeverity.recommendation => 'Recommendation',
        FeedbackSeverity.requirement => 'Requirement',
      };
}

enum FeedbackStatus {
  @JsonValue('open') open,
  @JsonValue('acknowledged') acknowledged,
  @JsonValue('resolved') resolved;

  String get displayName => switch (this) {
        FeedbackStatus.open => 'Open',
        FeedbackStatus.acknowledged => 'Acknowledged',
        FeedbackStatus.resolved => 'Resolved',
      };
}

/// A feedback or recommendation entry left by an inspector for a home,
/// optionally tied to a specific child and module section.
///
/// This is a cloud-only model (table `inspector_feedback`, no local Drift
/// table) — JSON keys map directly to Supabase's snake_case columns so
/// `toJson`/`fromJson` can be used as-is for Supabase reads and writes.
@freezed
class InspectorFeedback with _$InspectorFeedback {
  const factory InspectorFeedback({
    required String id,
    @JsonKey(name: 'home_id') required String homeId,
    @JsonKey(name: 'inspector_user_id') required String inspectorUserId,
    @JsonKey(name: 'inspector_email') required String inspectorEmail,
    @JsonKey(name: 'child_id') String? childId,
    @JsonKey(name: 'child_name') String? childName,
    required String module,
    required FeedbackSeverity severity,
    required String content,
    @Default(FeedbackStatus.open) FeedbackStatus status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'resolved_at') DateTime? resolvedAt,
    @JsonKey(name: 'resolved_by') String? resolvedBy,
    @JsonKey(name: 'resolution_notes') String? resolutionNotes,
  }) = _InspectorFeedback;

  factory InspectorFeedback.fromJson(Map<String, dynamic> json) =>
      _$InspectorFeedbackFromJson(json);
}
