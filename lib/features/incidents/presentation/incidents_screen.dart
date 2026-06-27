import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/time/uk_time.dart';
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/incident_report.dart';
import 'providers/incidents_provider.dart';

class IncidentsScreen extends ConsumerWidget {
  const IncidentsScreen({super.key, required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportsAsync = ref.watch(incidentReportsProvider(childId));
    final childrenAsync = ref.watch(childrenProvider);
    final colors = Theme.of(context).colorScheme;

    final childName =
        childrenAsync.valueOrNull
            ?.where((c) => c.id == childId)
            .firstOrNull
            ?.name ??
        '';

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.incidentsTitle),
            if (childName.isNotEmpty)
              Text(
                childName,
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
          ],
        ),
      ),
      body: reportsAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          error: e,
          onRetry: () => ref.invalidate(incidentReportsProvider(childId)),
        ),
        data: (reports) {
          if (reports.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.report_outlined,
                    size: 56,
                    color: colors.onSurfaceVariant,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    AppStrings.incidentNoReports,
                    style: AppTextStyles.body(colors.onSurfaceVariant),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    AppStrings.incidentNoReportsHint,
                    style: AppTextStyles.small(colors.onSurfaceVariant),
                  ),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: reports.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (_, i) => _IncidentCard(
              report: reports[i],
              onEdit: () => context.push(
                '/children/$childId/incidents/${reports[i].id}/edit',
                extra: reports[i],
              ),
              onDelete: () => _confirmDelete(context, ref, reports[i].id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/children/$childId/incidents/new'),
        backgroundColor: AppColors.teal400,
        foregroundColor: AppColors.white,
        icon: const Icon(Icons.add),
        label: const Text(AppStrings.incidentLog),
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    String id,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.incidentDeleteTitle),
        content: const Text(AppStrings.incidentDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(dialogContext).colorScheme.error,
            ),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(incidentReportsRepositoryProvider).delete(id);
    }
  }
}

// ── Incident card ─────────────────────────────────────────────────────────────

class _IncidentCard extends StatelessWidget {
  const _IncidentCard({
    required this.report,
    required this.onEdit,
    required this.onDelete,
  });

  final IncidentReport report;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final severityColor = _severityColor(report.severity);
    final dateStr = DateFormat(
      'EEE d MMM · HH:mm',
      'en_GB',
    ).format(report.occurredAt.toUk());

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
              // Header row: type badge, severity badge, flags, menu
              Row(
                children: [
                  _NeutralChip(label: report.incidentType.displayName),
                  const SizedBox(width: AppSpacing.sm),
                  _Badge(
                    label: report.severity.displayName,
                    color: severityColor,
                  ),
                  const Spacer(),
                  if (report.followUpRequired)
                    const Padding(
                      padding: EdgeInsets.only(right: AppSpacing.sm),
                      child: Tooltip(
                        message: AppStrings.incidentFollowUpRequired,
                        child: Icon(
                          Icons.pending_actions,
                          color: AppColors.amber,
                          size: 16,
                        ),
                      ),
                    ),
                  if (report.policeNotified)
                    const Padding(
                      padding: EdgeInsets.only(right: AppSpacing.sm),
                      child: Tooltip(
                        message: AppStrings.incidentPoliceNotified,
                        child: Icon(
                          Icons.local_police_outlined,
                          color: AppColors.blue,
                          size: 16,
                        ),
                      ),
                    ),
                  PopupMenuButton<String>(
                    icon: Icon(
                      Icons.more_vert,
                      size: 18,
                      color: colors.onSurfaceVariant,
                    ),
                    tooltip: AppStrings.recordOptions,
                    onSelected: (v) {
                      if (v == 'edit') onEdit();
                      if (v == 'delete') onDelete();
                    },
                    itemBuilder: (_) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text(AppStrings.edit),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text(AppStrings.delete),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),

              // Title
              Text(
                report.title,
                style: AppTextStyles.h3(colors.onSurface),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.xs),

              // Date + reporter
              Text(
                dateStr,
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.xs),

              // Description snippet
              Text(
                report.description,
                style: AppTextStyles.small(colors.onSurface),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              // Notification row
              const SizedBox(height: AppSpacing.sm),
              _NotificationRow(report: report),

              const SizedBox(height: AppSpacing.xs),
              Text(
                '${AppStrings.incidentReportedBy} ${report.reportedByName}',
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _severityColor(IncidentSeverity s) => switch (s) {
    IncidentSeverity.low => AppColors.green,
    IncidentSeverity.medium => AppColors.amber,
    IncidentSeverity.high => AppColors.orange,
    IncidentSeverity.critical => AppColors.red,
  };
}

class _NotificationRow extends StatelessWidget {
  const _NotificationRow({required this.report});

  final IncidentReport report;

  @override
  Widget build(BuildContext context) {
    if (!report.policeNotified &&
        !report.parentNotified &&
        !report.managerNotified) {
      return const SizedBox.shrink();
    }
    return Wrap(
      spacing: AppSpacing.xs,
      children: [
        if (report.policeNotified)
          const _MiniChip(label: 'Police notified', color: AppColors.blue),
        if (report.parentNotified)
          const _MiniChip(label: 'Parent notified', color: AppColors.teal400),
        if (report.managerNotified)
          const _MiniChip(label: 'Manager notified', color: AppColors.slate400),
      ],
    );
  }
}

class _MiniChip extends StatelessWidget {
  const _MiniChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
    decoration: BoxDecoration(
      color: color.withAlpha(20),
      borderRadius: BorderRadius.circular(AppRadius.pill),
      border: Border.all(color: color.withAlpha(60)),
    ),
    child: Text(
      label,
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: color),
    ),
  );
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
    decoration: BoxDecoration(
      color: color.withAlpha(25),
      borderRadius: BorderRadius.circular(AppRadius.pill),
    ),
    child: Text(label, style: AppTextStyles.label(color)),
  );
}

/// Quiet neutral chip for organisational metadata (incident type) — colour here
/// is reserved for severity and the follow-up / police / notification signals.
class _NeutralChip extends StatelessWidget {
  const _NeutralChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Text(label, style: AppTextStyles.label(colors.onSurfaceVariant)),
    );
  }
}
