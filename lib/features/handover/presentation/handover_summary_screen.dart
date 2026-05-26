import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/behaviour/domain/behaviour_incident.dart';
import '../../../features/behaviour/presentation/providers/behaviour_provider.dart';
import '../../../features/checklists/domain/bath_temp_record.dart';
import '../../../features/checklists/presentation/providers/bath_temp_provider.dart';
import '../../../features/children/domain/child.dart';
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../features/daily_notes/presentation/providers/daily_notes_provider.dart';
import '../../../features/incidents/domain/incident_report.dart';
import '../../../features/incidents/presentation/providers/incidents_provider.dart';
import '../../../features/medication/domain/med_administration.dart';
import '../../../features/medication/domain/prescribed_med.dart';
import '../../../features/medication/presentation/providers/medication_provider.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/models/shift_completion.dart';
import '../../../shared/providers/shift_completion_provider.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';

/// Auto-generated shift handover summary for Team Leaders and Managers.
/// Reads live from Drift — no manual entry required.
class HandoverSummaryScreen extends ConsumerWidget {
  const HandoverSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenAsync = ref.watch(childrenProvider);
    final shift = ShiftType.forTime(DateTime.now());
    final now = DateTime.now();
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.handoverSummaryTitle)),
      body: childrenAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(childrenProvider),
        ),
        data: (children) {
          if (children.isEmpty) {
            return Center(
              child: Text(
                AppStrings.noChildren,
                style: AppTextStyles.body(colors.onSurfaceVariant),
              ),
            );
          }
          // ListView.builder — each _ChildSummaryCard watches 7 providers;
          // virtualising prevents building off-screen cards at startup.
          return ListView.builder(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: children.length + 3,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _HeaderCard(
                    shift: shift, now: now, childCount: children.length);
              }
              if (index == 1) return const SizedBox(height: AppSpacing.lg);
              if (index == children.length + 2) {
                return const SizedBox(height: 80);
              }
              final c = children[index - 2];
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: _ChildSummaryCard(child: c, shift: shift, now: now),
              );
            },
          );
        },
      ),
    );
  }
}

// ── Header card ───────────────────────────────────────────────────────────────

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({
    required this.shift,
    required this.now,
    required this.childCount,
  });

  final ShiftType shift;
  final DateTime now;
  final int childCount;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: AppColors.teal400.withAlpha(20),
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${shift.displayName.toUpperCase()} SHIFT',
                    style: AppTextStyles.label(AppColors.teal400),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    DateFormat('EEEE d MMMM yyyy', 'en_GB').format(now),
                    style: AppTextStyles.h3(colors.onSurface),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    '${AppStrings.handoverSummaryGenerated} ${DateFormat('HH:mm').format(now)}',
                    style: AppTextStyles.small(colors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('$childCount', style: AppTextStyles.h1(AppColors.teal400)),
                Text(
                  childCount == 1 ? 'child' : 'children',
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Per-child summary card ────────────────────────────────────────────────────

class _ChildSummaryCard extends ConsumerWidget {
  const _ChildSummaryCard({
    required this.child,
    required this.shift,
    required this.now,
  });

  final Child child;
  final ShiftType shift;
  final DateTime now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    final notesAsync = ref.watch(dailyNotesProvider(child.id));
    final behaviourAsync = ref.watch(behaviourIncidentsProvider(child.id));
    final incidentsAsync = ref.watch(incidentReportsProvider(child.id));
    final medsAsync = ref.watch(prescribedMedsProvider(child.id));
    final adminsAsync = ref.watch(todayAdminsProvider(child.id));
    final bathAsync = ref.watch(bathTempTodayProvider(child.id));
    final completion = ref.watch(shiftCompletionProvider(child.id));

    final notes = notesAsync.valueOrNull ?? [];
    final behaviour = behaviourAsync.valueOrNull ?? [];
    final incidents = incidentsAsync.valueOrNull ?? [];
    final meds = medsAsync.valueOrNull ?? [];
    final admins = adminsAsync.valueOrNull ?? [];
    final bathRecords = bathAsync.valueOrNull ?? [];

    // Filter to current shift / today
    final shiftNotes = notes
        .where((n) =>
            n.shift == shift && _isSameDay(n.occurredAt.toLocal(), now))
        .toList();

    final todayBehaviour = behaviour
        .where((b) =>
            b.shift == shift && _isSameDay(b.occurredAt.toLocal(), now))
        .toList();

    final todayIncidents = incidents
        .where((i) => _isSameDay(i.occurredAt.toLocal(), now))
        .toList();

    final scheduledMeds = meds.where((m) => !m.frequency.isPrn).toList();
    final shiftAdmins = admins.where((a) => a.shift == shift).toList();

    // Flags
    final hasPhysicalIntervention =
        todayBehaviour.any((b) => b.physicalIntervention);
    final hasCriticalIncident = todayIncidents.any((i) =>
        i.severity == IncidentSeverity.critical ||
        i.severity == IncidentSeverity.high);
    final hasSafeguarding = todayIncidents.any((i) =>
        i.incidentType == IncidentType.safeguarding ||
        i.incidentType == IncidentType.missingPerson);
    final hasMedRefusal =
        shiftAdmins.any((a) => a.outcome == AdminOutcome.refused);
    final hasFlags = hasPhysicalIntervention ||
        hasCriticalIncident ||
        hasSafeguarding ||
        hasMedRefusal;

    final isComplete = completion.status == CompletionStatus.complete;
    final statusColor = switch (completion.status) {
      CompletionStatus.complete => AppColors.green,
      CompletionStatus.partial => AppColors.amber,
      CompletionStatus.none => AppColors.red,
    };

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Child header
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: colors.primaryContainer,
                  child: Text(
                    child.initials,
                    style: AppTextStyles.label(colors.onPrimaryContainer),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(child.name,
                          style: AppTextStyles.h3(colors.onSurface)),
                      Text(
                        'Room ${child.room} · Age ${child.ageYears}',
                        style: AppTextStyles.small(colors.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
                Icon(
                  isComplete
                      ? Icons.check_circle_outline
                      : Icons.warning_amber_rounded,
                  color: statusColor,
                  size: 18,
                ),
              ],
            ),

            // Flag chips
            if (hasFlags) ...[
              const SizedBox(height: AppSpacing.md),
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: [
                  if (hasPhysicalIntervention)
                    const _FlagChip(AppStrings.handoverFlagPhysical, AppColors.red),
                  if (hasSafeguarding)
                    const _FlagChip(
                        AppStrings.handoverFlagSafeguarding, AppColors.red),
                  if (hasCriticalIncident)
                    const _FlagChip(AppStrings.handoverFlagCritical, AppColors.red),
                  if (hasMedRefusal)
                    const _FlagChip(
                        AppStrings.handoverFlagMedRefusal, AppColors.amber),
                ],
              ),
            ],

            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
              child: Divider(height: 1),
            ),

            _SectionRow(
              icon: Icons.notes_outlined,
              label: AppStrings.handoverSectionNotes,
              value: _notesSummary(shiftNotes),
              valueColor:
                  shiftNotes.isEmpty ? colors.onSurfaceVariant : colors.onSurface,
            ),
            const SizedBox(height: AppSpacing.sm),

            _SectionRow(
              icon: Icons.psychology_outlined,
              label: AppStrings.handoverSectionBehaviour,
              value: todayBehaviour.isEmpty
                  ? AppStrings.handoverNoBehaviour
                  : _behaviourSummary(todayBehaviour),
              valueColor: todayBehaviour.isEmpty
                  ? colors.onSurfaceVariant
                  : AppColors.amber,
            ),
            const SizedBox(height: AppSpacing.sm),

            _SectionRow(
              icon: Icons.report_outlined,
              label: AppStrings.handoverSectionIncidents,
              value: todayIncidents.isEmpty
                  ? AppStrings.handoverNoIncidents
                  : _incidentSummary(todayIncidents),
              valueColor: todayIncidents.isEmpty
                  ? colors.onSurfaceVariant
                  : AppColors.red,
            ),
            const SizedBox(height: AppSpacing.sm),

            _SectionRow(
              icon: Icons.medication_outlined,
              label: AppStrings.handoverSectionMedication,
              value: _medSummary(scheduledMeds, shiftAdmins),
              valueColor: hasMedRefusal
                  ? AppColors.amber
                  : scheduledMeds.isEmpty
                      ? colors.onSurfaceVariant
                      : colors.onSurface,
            ),
            const SizedBox(height: AppSpacing.sm),

            _SectionRow(
              icon: Icons.thermostat_outlined,
              label: AppStrings.handoverSectionBathTemp,
              value: bathRecords.isEmpty
                  ? AppStrings.handoverBathNotRecorded
                  : _bathSummary(bathRecords),
              valueColor:
                  bathRecords.isEmpty ? colors.onSurfaceVariant : colors.onSurface,
            ),
          ],
        ),
      ),
    );
  }

  String _notesSummary(List<DailyNote> notes) {
    if (notes.isEmpty) return AppStrings.handoverNoNotes;
    final count = notes.length;
    final snippet = notes.last.content.split('\n').first.trim();
    final truncated =
        snippet.length > 60 ? '${snippet.substring(0, 60)}…' : snippet;
    return '$count ${count == 1 ? 'note' : 'notes'} · "$truncated"';
  }

  String _behaviourSummary(List<BehaviourIncident> incidents) {
    final count = incidents.length;
    final highest = incidents
        .map((i) => i.severity)
        .reduce((a, b) => a.index > b.index ? a : b);
    final extra =
        incidents.any((i) => i.physicalIntervention) ? ' · intervention' : '';
    return '$count ${count == 1 ? 'incident' : 'incidents'} · ${highest.displayName}$extra';
  }

  String _incidentSummary(List<IncidentReport> reports) {
    final count = reports.length;
    final types = reports.map((r) => r.incidentType.displayName).toSet().join(', ');
    final highest = reports
        .map((r) => r.severity)
        .reduce((a, b) => a.index > b.index ? a : b);
    return '$count ${count == 1 ? 'report' : 'reports'} · $types · ${highest.displayName}';
  }

  String _medSummary(
      List<PrescribedMed> scheduled, List<MedAdministration> admins) {
    if (scheduled.isEmpty) return AppStrings.handoverNoMeds;
    final given =
        admins.where((a) => a.outcome == AdminOutcome.administered).length;
    final refused =
        admins.where((a) => a.outcome == AdminOutcome.refused).length;
    final held = admins.where((a) => a.outcome == AdminOutcome.held).length;
    if (refused == 0 && held == 0 && given == scheduled.length) {
      return 'All administered (${scheduled.length})';
    }
    final parts = <String>[];
    if (given > 0) parts.add('$given given');
    if (refused > 0) parts.add('$refused refused');
    if (held > 0) parts.add('$held held');
    return parts.isEmpty ? 'Not yet recorded' : parts.join(' · ');
  }

  String _bathSummary(List<BathTempRecord> records) {
    final latest = records.reduce(
        (a, b) => a.recordedAt.isAfter(b.recordedAt) ? a : b);
    final status = bathTempStatus(latest.temperatureCelsius);
    final label = switch (status) {
      BathTempStatus.safe => 'Safe',
      BathTempStatus.tooCold => 'Too cold',
      BathTempStatus.tooHot => 'Too hot',
    };
    return '${latest.temperatureCelsius.toStringAsFixed(1)}°C · $label';
  }
}

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

// ── Helper widgets ────────────────────────────────────────────────────────────

class _FlagChip extends StatelessWidget {
  const _FlagChip(this.label, this.color);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: color.withAlpha(100)),
      ),
      child: Text(label, style: AppTextStyles.small(color)),
    );
  }
}

class _SectionRow extends StatelessWidget {
  const _SectionRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.valueColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: colors.onSurfaceVariant),
        const SizedBox(width: AppSpacing.sm),
        SizedBox(
          width: 78,
          child: Text(
            label,
            style: AppTextStyles.small(colors.onSurfaceVariant),
          ),
        ),
        Expanded(
          child: Text(value, style: AppTextStyles.small(valueColor)),
        ),
      ],
    );
  }
}
