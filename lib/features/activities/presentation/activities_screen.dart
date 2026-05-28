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
import '../domain/activity_entry.dart';
import 'providers/activities_provider.dart';

class ActivitiesScreen extends ConsumerWidget {
  const ActivitiesScreen({super.key, required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entriesAsync = ref.watch(activityEntriesProvider(childId));
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
            const Text(AppStrings.activitiesTitle),
            if (childName.isNotEmpty)
              Text(childName,
                  style: AppTextStyles.small(colors.onSurfaceVariant)),
          ],
        ),
      ),
      body: entriesAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () =>
              ref.invalidate(activityEntriesProvider(childId)),
        ),
        data: (entries) {
          if (entries.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star_outline,
                      size: 56, color: colors.onSurfaceVariant),
                  const SizedBox(height: AppSpacing.lg),
                  Text(AppStrings.activitiesNoEntries,
                      style: AppTextStyles.body(colors.onSurfaceVariant)),
                  const SizedBox(height: AppSpacing.sm),
                  Text(AppStrings.activitiesNoEntriesHint,
                      style: AppTextStyles.small(colors.onSurfaceVariant)),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: entries.length,
            separatorBuilder: (_, _) =>
                const SizedBox(height: AppSpacing.sm),
            itemBuilder: (_, i) => _ActivityCard(
              entry: entries[i],
              onEdit: () => context.push(
                '/children/$childId/activities/${entries[i].id}/edit',
                extra: entries[i],
              ),
              onDelete: () =>
                  _confirmDelete(context, ref, entries[i].id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            context.push('/children/$childId/activities/new'),
        backgroundColor: AppColors.amber,
        foregroundColor: AppColors.white,
        icon: const Icon(Icons.add),
        label: const Text(AppStrings.activitiesLog),
      ),
    );
  }

  Future<void> _confirmDelete(
      BuildContext context, WidgetRef ref, String id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.activitiesDeleteTitle),
        content: const Text(AppStrings.activitiesDeleteConfirm),
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
      await ref.read(activityEntriesRepositoryProvider).delete(id);
    }
  }
}

// ── Activity card ─────────────────────────────────────────────────────────────

class _ActivityCard extends StatelessWidget {
  const _ActivityCard({
    required this.entry,
    required this.onEdit,
    required this.onDelete,
  });

  final ActivityEntry entry;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final catColor = _categoryColor(entry.category);

    final parts = entry.date.split('-');
    final dateStr = parts.length == 3
        ? DateFormat('EEE d MMM').format(DateTime(
            int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2])))
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
                  _Badge(
                      label: entry.category.displayName,
                      color: catColor),
                  const SizedBox(width: AppSpacing.sm),
                  Text(dateStr,
                      style: AppTextStyles.small(
                          colors.onSurfaceVariant)),
                  if (entry.durationMinutes != null) ...[
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      '${entry.durationMinutes}min',
                      style: AppTextStyles.small(
                          colors.onSurfaceVariant),
                    ),
                  ],
                  const Spacer(),
                  if (entry.rewardEarned)
                    const Padding(
                      padding:
                          EdgeInsets.only(right: AppSpacing.xs),
                      child: Icon(Icons.star,
                          color: AppColors.amber, size: 16),
                    ),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert,
                        size: 18,
                        color: colors.onSurfaceVariant),
                    tooltip: AppStrings.recordOptions,
                    onSelected: (v) {
                      if (v == 'edit') onEdit();
                      if (v == 'delete') onDelete();
                    },
                    itemBuilder: (_) => [
                      const PopupMenuItem(
                          value: 'edit',
                          child: Text(AppStrings.edit)),
                      const PopupMenuItem(
                          value: 'delete',
                          child: Text(AppStrings.delete)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(entry.title,
                  style: AppTextStyles.h3(colors.onSurface)),
              if (entry.description != null &&
                  entry.description!.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(entry.description!,
                    style: AppTextStyles.small(
                        colors.onSurfaceVariant),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ],
              if (entry.achievement != null &&
                  entry.achievement!.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.sm),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs),
                  decoration: BoxDecoration(
                    color: AppColors.green.withAlpha(20),
                    borderRadius:
                        BorderRadius.circular(AppRadius.button),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.emoji_events_outlined,
                          size: 14, color: AppColors.green),
                      const SizedBox(width: AppSpacing.xs),
                      Flexible(
                        child: Text(
                          entry.achievement!,
                          style: AppTextStyles.small(
                              AppColors.green),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.xs),
              Text(entry.recordedByName,
                  style: AppTextStyles.small(
                      colors.onSurfaceVariant)),
            ],
          ),
        ),
      ),
    );
  }

  Color _categoryColor(ActivityCategory c) => switch (c) {
        ActivityCategory.physical => AppColors.green,
        ActivityCategory.creative => AppColors.blue,
        ActivityCategory.educational => AppColors.teal400,
        ActivityCategory.social => AppColors.amber,
        ActivityCategory.community => AppColors.roleSupportWorker,
        ActivityCategory.lifeSkills => AppColors.purple,
        ActivityCategory.other => AppColors.slate400,
      };
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

