import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/sleep_entry.dart';
import 'providers/sleep_diary_provider.dart';

class SleepDiaryScreen extends ConsumerWidget {
  const SleepDiaryScreen({super.key, required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entriesAsync = ref.watch(sleepEntriesProvider(childId));
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
            const Text(AppStrings.sleepDiaryTitle),
            if (childName.isNotEmpty)
              Text(
                childName,
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
          ],
        ),
      ),
      body: entriesAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          error: e,
          onRetry: () => ref.invalidate(sleepEntriesProvider(childId)),
        ),
        data: (entries) {
          if (entries.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.bedtime_outlined,
                    size: 56,
                    color: colors.onSurfaceVariant,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    AppStrings.sleepNoEntries,
                    style: AppTextStyles.body(colors.onSurfaceVariant),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    AppStrings.sleepNoEntriesHint,
                    style: AppTextStyles.small(colors.onSurfaceVariant),
                  ),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: entries.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (_, i) => _SleepCard(
              entry: entries[i],
              onEdit: () => context.push(
                '/children/$childId/sleep-diary/${entries[i].id}/edit',
                extra: entries[i],
              ),
              onDelete: () => _confirmDelete(context, ref, entries[i].id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/children/$childId/sleep-diary/new'),
        backgroundColor: AppColors.teal400,
        foregroundColor: AppColors.white,
        icon: const Icon(Icons.add),
        label: const Text(AppStrings.sleepLogEntry),
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
        title: const Text(AppStrings.sleepDeleteTitle),
        content: const Text(AppStrings.sleepDeleteConfirm),
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
      await ref.read(sleepEntriesRepositoryProvider).delete(id);
    }
  }
}

// ── Sleep card ────────────────────────────────────────────────────────────────

class _SleepCard extends StatelessWidget {
  const _SleepCard({
    required this.entry,
    required this.onEdit,
    required this.onDelete,
  });

  final SleepEntry entry;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final qualityColor = _qualityColor(entry.quality);

    // Format date
    final parts = entry.date.split('-');
    final dateStr = parts.length == 3
        ? DateFormat('EEE d MMM').format(
            DateTime(
              int.parse(parts[0]),
              int.parse(parts[1]),
              int.parse(parts[2]),
            ),
          )
        : entry.date;

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
              Row(
                children: [
                  _NeutralChip(label: dateStr),
                  const SizedBox(width: AppSpacing.sm),
                  _NeutralChip(label: entry.shift.displayName),
                  const SizedBox(width: AppSpacing.sm),
                  _Badge(label: entry.quality.displayName, color: qualityColor),
                  const Spacer(),
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
              Row(
                children: [
                  if (entry.bedTime != null) ...[
                    Icon(
                      Icons.bedtime_outlined,
                      size: 14,
                      color: colors.onSurfaceVariant,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      entry.bedTime!,
                      style: AppTextStyles.body(colors.onSurface),
                    ),
                  ],
                  if (entry.bedTime != null && entry.wakeTime != null) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 12,
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if (entry.wakeTime != null) ...[
                    const Icon(
                      Icons.wb_sunny_outlined,
                      size: 14,
                      color: AppColors.amber,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      entry.wakeTime!,
                      style: AppTextStyles.body(colors.onSurface),
                    ),
                  ],
                  if (entry.numberOfWakings > 0) ...[
                    const SizedBox(width: AppSpacing.md),
                    Text(
                      '${entry.numberOfWakings}× ${AppStrings.sleepWakings}',
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                    ),
                  ],
                ],
              ),
              if (entry.notes != null && entry.notes!.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  entry.notes!,
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: AppSpacing.xs),
              Text(
                entry.recordedByName,
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _qualityColor(SleepQuality q) => switch (q) {
    SleepQuality.good => AppColors.green,
    SleepQuality.fair => AppColors.amber,
    SleepQuality.poor => AppColors.red,
  };
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

/// Quiet neutral chip for organisational metadata (date, shift) — colour here
/// is reserved for sleep quality.
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
