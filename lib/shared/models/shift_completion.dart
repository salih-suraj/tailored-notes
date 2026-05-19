import '../../features/daily_notes/domain/daily_note.dart';

/// A single documentation section and whether it has been completed.
class ShiftSection {
  const ShiftSection(this.label, {required this.complete});

  final String label;
  final bool complete;
}

/// Aggregated documentation completion for one child on the current shift.
class ShiftCompletion {
  const ShiftCompletion({
    required this.childId,
    required this.shift,
    required this.sections,
  });

  final String childId;
  final ShiftType shift;
  final List<ShiftSection> sections;

  int get completedCount => sections.where((s) => s.complete).length;
  int get totalCount => sections.length;

  double get progress =>
      totalCount > 0 ? completedCount / totalCount : 0.0;

  CompletionStatus get status {
    if (completedCount == 0) return CompletionStatus.none;
    if (completedCount == totalCount) return CompletionStatus.complete;
    return CompletionStatus.partial;
  }
}

enum CompletionStatus { none, partial, complete }
