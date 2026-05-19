import 'package:freezed_annotation/freezed_annotation.dart';

part 'visitor_log_entry.freezed.dart';
part 'visitor_log_entry.g.dart';

/// A single visitor arrival record for the home.
/// Not tied to a specific child — visitors come to the home.
@freezed
class VisitorLogEntry with _$VisitorLogEntry {
  const factory VisitorLogEntry({
    required String id,
    required String homeId,
    required String visitorName,
    String? relation,
    required String purpose,
    required String authorisedBy,
    required DateTime arrivedAt,
    DateTime? departedAt,
    String? notes,
    required String recordedById,
    required String recordedByName,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _VisitorLogEntry;

  factory VisitorLogEntry.fromJson(Map<String, dynamic> json) =>
      _$VisitorLogEntryFromJson(json);
}

/// Predefined visitor relation options shown as chips on the entry form.
const visitorRelations = <String>[
  'Parent / Guardian',
  'Social Worker',
  'GP / Nurse',
  'Therapist',
  'Inspector',
  'Contractor',
  'Other',
];
