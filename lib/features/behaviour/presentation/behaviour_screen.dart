import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/behaviour_incident.dart';
import 'providers/behaviour_provider.dart';

class BehaviourScreen extends ConsumerWidget {
  const BehaviourScreen({super.key, required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incidentsAsync = ref.watch(behaviourIncidentsProvider(childId));
    final childrenAsync = ref.watch(childrenProvider);
    final colors = Theme.of(context).colorScheme;

    final childName = childrenAsync.valueOrNull
            ?.where((c) => c.id == childId)
            .firstOrNull
            ?.name ??
        '';

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.behaviourTitle),
            if (childName.isNotEmpty)
              Text(childName,
                  style: AppTextStyles.small(colors.onSurfaceVariant)),
          ],
        ),
      ),
      body: incidentsAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () =>
              ref.invalidate(behaviourIncidentsProvider(childId)),
        ),
        data: (incidents) {
          if (incidents.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.show_chart,
                      size: 56, color: colors.onSurfaceVariant),
                  const SizedBox(height: AppSpacing.lg),
                  Text(AppStrings.behaviourNoIncidents,
                      style: AppTextStyles.body(colors.onSurfaceVariant)),
                  const SizedBox(height: AppSpacing.sm),
                  Text(AppStrings.behaviourNoIncidentsHint,
                      style: AppTextStyles.small(colors.onSurfaceVariant)),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: incidents.length,
            separatorBuilder: (_, _) =>
                const SizedBox(height: AppSpacing.sm),
            itemBuilder: (_, i) => _IncidentCard(
              incident: incidents[i],
              onEdit: () => context.push(
                '/children/$childId/behaviour/${incidents[i].id}/edit',
                extra: incidents[i],
              ),
              onDelete: () =>
                  _confirmDelete(context, ref, incidents[i].id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            context.push('/children/$childId/behaviour/new'),
        backgroundColor: AppColors.amber,
        foregroundColor: AppColors.white,
        icon: const Icon(Icons.add),
        label: const Text(AppStrings.behaviourLogIncident),
      ),
    );
  }

  Future<void> _confirmDelete(
      BuildContext context, WidgetRef ref, String id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.behaviourDeleteTitle),
        content: const Text(AppStrings.behaviourDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(foregroundColor: Theme.of(dialogContext).colorScheme.error),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(behaviourRepositoryProvider).delete(id);
    }
  }
}

// ── Incident card ─────────────────────────────────────────────────────────────

class _IncidentCard extends StatelessWidget {
  const _IncidentCard({
    required this.incident,
    required this.onEdit,
    required this.onDelete,
  });

  final BehaviourIncident incident;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final severityColor = _severityColor(incident.severity);
    final dateStr = DateFormat('EEE d MMM · HH:mm', 'en_GB')
        .format(incident.occurredAt.toLocal());
    final shiftColor = switch (incident.shift) {
      ShiftType.morning => AppColors.amber,
      ShiftType.afternoon => AppColors.teal400,
      ShiftType.night => AppColors.roleSupportWorker,
    };

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: InkWell(
        onTap: onEdit,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                children: [
                  _Badge(
                      label: incident.severity.displayName,
                      color: severityColor),
                  const SizedBox(width: AppSpacing.sm),
                  _Badge(
                      label: incident.shift.displayName,
                      color: shiftColor),
                  const Spacer(),
                  if (incident.physicalIntervention)
                    Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.sm),
                      child: Tooltip(
                        message: AppStrings.behaviourPhysicalIntervention,
                        child: Icon(Icons.warning_amber_rounded,
                            color: AppColors.red, size: 16),
                      ),
                    ),
                  if (incident.injuryOccurred)
                    Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.sm),
                      child: Tooltip(
                        message: AppStrings.behaviourInjury,
                        child: Icon(Icons.personal_injury_outlined,
                            color: AppColors.red, size: 16),
                      ),
                    ),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert,
                        size: 18, color: colors.onSurfaceVariant),
                    tooltip: AppStrings.recordOptions,
                    onSelected: (v) {
                      if (v == 'edit') onEdit();
                      if (v == 'delete') onDelete();
                    },
                    itemBuilder: (_) => [
                      const PopupMenuItem(
                          value: 'edit', child: Text(AppStrings.edit)),
                      const PopupMenuItem(
                          value: 'delete', child: Text(AppStrings.delete)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(dateStr,
                  style: AppTextStyles.small(colors.onSurfaceVariant)),
              const SizedBox(height: AppSpacing.sm),
              // ABC summary
              _AbcRow(
                  label: 'A',
                  color: AppColors.blue,
                  text: incident.antecedent),
              const SizedBox(height: AppSpacing.xs),
              _AbcRow(
                  label: 'B',
                  color: severityColor,
                  text: incident.behaviour),
              const SizedBox(height: AppSpacing.xs),
              _AbcRow(
                  label: 'C',
                  color: AppColors.green,
                  text: incident.consequence),
              if (incident.location != null) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${AppStrings.behaviourLocation}: ${incident.location}',
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                ),
              ],
              Text(incident.recordedByName,
                  style: AppTextStyles.small(colors.onSurfaceVariant)),
            ],
          ),
        ),
      ),
    );
  }

  Color _severityColor(BehaviourSeverity s) => switch (s) {
        BehaviourSeverity.mild => AppColors.amber,
        BehaviourSeverity.moderate => AppColors.orange,
        BehaviourSeverity.severe => AppColors.red,
      };
}

class _AbcRow extends StatelessWidget {
  const _AbcRow(
      {required this.label, required this.color, required this.text});

  final String label;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 18,
          height: 18,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color.withAlpha(25),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(label,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: color)),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.small(colors.onSurface),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm, vertical: 2),
        decoration: BoxDecoration(
          color: color.withAlpha(25),
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Text(label, style: AppTextStyles.label(color)),
      );
}

