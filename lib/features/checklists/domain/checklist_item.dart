import 'package:freezed_annotation/freezed_annotation.dart';

import '../../daily_notes/domain/daily_note.dart';

part 'checklist_item.freezed.dart';
part 'checklist_item.g.dart';

/// A single cleaning task instance for a shift + date.
/// Written to local Drift first; synced to Supabase when online.
@freezed
class ChecklistItem with _$ChecklistItem {
  const factory ChecklistItem({
    required String id,
    required String homeId,
    String? childId,
    required String areaKey,
    required String areaLabel,
    required String taskKey,
    required String taskLabel,
    required ShiftType shift,
    required String date, // 'YYYY-MM-DD'
    @Default(false) bool isComplete,
    DateTime? completedAt,
    String? completedByName,
    String? createdById,
    String? updatedById,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _ChecklistItem;

  factory ChecklistItem.fromJson(Map<String, dynamic> json) =>
      _$ChecklistItemFromJson(json);
}

/// Hardcoded bedroom cleaning tasks. Each element is (taskKey, taskLabel).
const roomCleaningTasks = <(String, String)>[
  ('vacuumed', 'Vacuumed floor'),
  ('surfaces_dusted', 'Dusted surfaces'),
  ('bin_emptied', 'Emptied bin'),
  ('mirrors_cleaned', 'Cleaned mirrors & windows'),
  ('items_tidied', 'Tidied personal items'),
];

/// A communal area with its checklist tasks.
class CommunalArea {
  const CommunalArea({
    required this.key,
    required this.label,
    required this.tasks,
  });

  final String key;
  final String label;
  final List<(String, String)> tasks; // (taskKey, taskLabel)
}

const communalAreas = <CommunalArea>[
  CommunalArea(
    key: 'kitchen',
    label: 'Kitchen',
    tasks: [
      ('surfaces_cleaned', 'Cleaned surfaces'),
      ('floor_mopped', 'Mopped floor'),
      ('hob_cleaned', 'Cleaned hob'),
    ],
  ),
  CommunalArea(
    key: 'living_room',
    label: 'Living Room',
    tasks: [
      ('vacuumed', 'Vacuumed'),
      ('surfaces_dusted', 'Dusted surfaces'),
      ('tidied', 'Tidied'),
    ],
  ),
  CommunalArea(
    key: 'bathrooms',
    label: 'Bathrooms',
    tasks: [
      ('toilet_cleaned', 'Cleaned toilet'),
      ('sink_cleaned', 'Cleaned sink & basin'),
      ('shower_cleaned', 'Cleaned bath / shower'),
      ('floor_mopped', 'Mopped floor'),
    ],
  ),
];
