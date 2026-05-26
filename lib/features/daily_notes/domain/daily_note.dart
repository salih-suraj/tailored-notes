import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/models/shift_type.dart';
export '../../../shared/models/shift_type.dart';

part 'daily_note.freezed.dart';
part 'daily_note.g.dart';

/// A single staff observation for a child during a shift.
/// Written to local Drift first; synced to Supabase when online.
@freezed
class DailyNote with _$DailyNote {
  const factory DailyNote({
    required String id,
    required String homeId,
    required String childId,
    required String authorId,
    required String authorName,
    required ShiftType shift,
    required String content,
    required DateTime occurredAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    String? updatedById,
    String? updatedByName,
    @Default(false) bool isSynced,
  }) = _DailyNote;

  factory DailyNote.fromJson(Map<String, dynamic> json) =>
      _$DailyNoteFromJson(json);
}
