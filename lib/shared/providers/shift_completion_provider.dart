import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/checklists/presentation/providers/bath_temp_provider.dart';
import '../../features/daily_notes/domain/daily_note.dart';
import '../../features/daily_notes/presentation/providers/daily_notes_provider.dart';
import '../../features/medication/presentation/providers/medication_provider.dart';
import '../models/shift_completion.dart';

part 'shift_completion_provider.g.dart';

/// Computes documentation completion for [childId] on the current shift.
/// Reacts live to Drift — updates the moment any record is saved.
@riverpod
ShiftCompletion shiftCompletion(Ref ref, String childId) {
  final notesAsync = ref.watch(dailyNotesProvider(childId));
  final bathTempAsync = ref.watch(bathTempTodayProvider(childId));
  final medsAsync = ref.watch(prescribedMedsProvider(childId));
  final adminsAsync = ref.watch(todayAdminsProvider(childId));

  final notes = notesAsync.valueOrNull ?? [];
  final bathRecords = bathTempAsync.valueOrNull ?? [];
  final meds = medsAsync.valueOrNull ?? [];
  final admins = adminsAsync.valueOrNull ?? [];

  final now = DateTime.now();
  final currentShift = ShiftType.forTime(now);

  final hasNoteToday = notes.any(
    (n) => n.shift == currentShift && _isSameDay(n.occurredAt.toLocal(), now),
  );

  final hasBathTempToday = bathRecords.isNotEmpty;

  final scheduledMeds = meds.where((m) => !m.frequency.isPrn).toList();
  final administeredMedIds = admins.map((a) => a.prescribedMedId).toSet();
  final allMedsDone = scheduledMeds.isNotEmpty &&
      scheduledMeds.every((m) => administeredMedIds.contains(m.id));

  return ShiftCompletion(
    childId: childId,
    shift: currentShift,
    sections: [
      ShiftSection('Daily Notes', complete: hasNoteToday),
      ShiftSection('Bath Temp', complete: hasBathTempToday),
      ShiftSection('Medication', complete: allMedsDone),
    ],
  );
}

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
