import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/time/uk_time.dart';
import '../../features/checklists/presentation/providers/bath_temp_provider.dart';
import '../../features/daily_notes/domain/daily_note.dart';
import '../../features/daily_notes/presentation/providers/daily_notes_provider.dart';
import '../../features/medication/domain/prescribed_med.dart';
import '../../features/medication/presentation/providers/medication_provider.dart';
import '../models/shift_completion.dart';
import '../models/shift_type.dart';

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

  final now = UkTime.now();
  final currentShift = ShiftType.forTime(now);

  final hasNoteToday = notes.any(
    (n) => n.shift == currentShift && _isSameDay(n.occurredAt.toUk(), now),
  );

  final hasBathTempToday = bathRecords.isNotEmpty;

  // Medication is judged per shift: only meds DUE in the current shift count,
  // and each must have been administered during this shift. So an evening or
  // night med doesn't keep the morning shift "outstanding", and logging the
  // meds due now clears it. (Every med still always shows on the medication
  // screen — this only drives the completion indicator.)
  final dueMeds = meds
      .where(
        (m) =>
            !m.frequency.isPrn &&
            _dueShifts(m.frequency).contains(currentShift),
      )
      .toList();
  final thisShiftMedIds = admins
      .where((a) => a.shift == currentShift)
      .map((a) => a.prescribedMedId)
      .toSet();
  final allDueMedsDone = dueMeds.every((m) => thisShiftMedIds.contains(m.id));

  return ShiftCompletion(
    childId: childId,
    shift: currentShift,
    sections: [
      ShiftSection('Daily Notes', complete: hasNoteToday),
      ShiftSection('Bath Temp', complete: hasBathTempToday),
      if (dueMeds.isNotEmpty)
        ShiftSection('Medication', complete: allDueMedsDone),
    ],
  );
}

/// Which shifts a med of [frequency] is due in. Time-of-day frequencies map to
/// the shift that covers them (morning 07–14, afternoon/evening 14–22, night
/// 22–07); multi-dose and unspecified frequencies are due across the relevant
/// shifts. PRN is never due (handled by the caller).
Set<ShiftType> _dueShifts(MedFrequency frequency) => switch (frequency) {
  MedFrequency.morning => {ShiftType.morning},
  MedFrequency.evening => {ShiftType.afternoon},
  MedFrequency.night => {ShiftType.night},
  MedFrequency.morningEvening => {ShiftType.morning, ShiftType.afternoon},
  MedFrequency.threeTimesDaily ||
  MedFrequency.fourTimesDaily ||
  MedFrequency.other => {
    ShiftType.morning,
    ShiftType.afternoon,
    ShiftType.night,
  },
  MedFrequency.prn => const {},
};

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
