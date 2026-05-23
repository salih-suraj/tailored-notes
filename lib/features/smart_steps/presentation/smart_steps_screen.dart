import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/smart_step.dart';
import 'providers/smart_steps_provider.dart';

class SmartStepsScreen extends ConsumerWidget {
  const SmartStepsScreen({super.key, required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepsAsync = ref.watch(smartStepsProvider(childId));
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
            const Text(AppStrings.smartStepsTitle),
            if (childName.isNotEmpty)
              Text(childName,
                  style: AppTextStyles.small(colors.onSurfaceVariant)),
          ],
        ),
      ),
      body: stepsAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(smartStepsProvider(childId)),
        ),
        data: (steps) {
          if (steps.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.stairs_outlined,
                      size: 56, color: colors.onSurfaceVariant),
                  const SizedBox(height: AppSpacing.lg),
                  Text(AppStrings.smartStepsNoSteps,
                      style: AppTextStyles.body(colors.onSurfaceVariant)),
                  const SizedBox(height: AppSpacing.sm),
                  Text(AppStrings.smartStepsNoStepsHint,
                      style: AppTextStyles.small(colors.onSurfaceVariant)),
                ],
              ),
            );
          }

          final inProgress = steps
              .where((s) => s.status == StepStatus.inProgress)
              .toList();
          final notStarted = steps
              .where((s) => s.status == StepStatus.notStarted)
              .toList();
          final achieved = steps
              .where((s) => s.status == StepStatus.achieved)
              .toList();

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              if (inProgress.isNotEmpty) ...[
                _SectionHeader(
                  label: AppStrings.smartStepsInProgress,
                  color: AppColors.amber,
                  count: inProgress.length,
                ),
                const SizedBox(height: AppSpacing.sm),
                ...inProgress.map((s) => _StepCard(
                      step: s,
                      onTap: () => context.push(
                        '/children/$childId/smart-steps/${s.id}',
                        extra: s,
                      ),
                      onDelete: () => _confirmDelete(context, ref, s.id),
                    )),
                const SizedBox(height: AppSpacing.lg),
              ],
              if (notStarted.isNotEmpty) ...[
                _SectionHeader(
                  label: AppStrings.smartStepsNotStarted,
                  color: AppColors.slate400,
                  count: notStarted.length,
                ),
                const SizedBox(height: AppSpacing.sm),
                ...notStarted.map((s) => _StepCard(
                      step: s,
                      onTap: () => context.push(
                        '/children/$childId/smart-steps/${s.id}',
                        extra: s,
                      ),
                      onDelete: () => _confirmDelete(context, ref, s.id),
                    )),
                const SizedBox(height: AppSpacing.lg),
              ],
              if (achieved.isNotEmpty) ...[
                _SectionHeader(
                  label: AppStrings.smartStepsAchieved,
                  color: AppColors.green,
                  count: achieved.length,
                ),
                const SizedBox(height: AppSpacing.sm),
                ...achieved.map((s) => _StepCard(
                      step: s,
                      onTap: () => context.push(
                        '/children/$childId/smart-steps/${s.id}',
                        extra: s,
                      ),
                      onDelete: () => _confirmDelete(context, ref, s.id),
                    )),
              ],
              const SizedBox(height: 80),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            context.push('/children/$childId/smart-steps/new'),
        backgroundColor: AppColors.teal400,
        foregroundColor: AppColors.white,
        icon: const Icon(Icons.add),
        label: const Text(AppStrings.smartStepsAddStep),
      ),
    );
  }

  Future<void> _confirmDelete(
      BuildContext context, WidgetRef ref, String id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(AppStrings.smartStepsDeleteTitle),
        content: const Text(AppStrings.smartStepsDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(smartStepsRepositoryProvider).deleteStep(id);
    }
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.label,
    required this.color,
    required this.count,
  });
  final String label;
  final Color color;
  final int count;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Text(label, style: AppTextStyles.label(color)),
          const Spacer(),
          Text('$count',
              style: AppTextStyles.small(
                  Theme.of(context).colorScheme.onSurfaceVariant)),
        ],
      );
}

class _StepCard extends StatelessWidget {
  const _StepCard({
    required this.step,
    required this.onTap,
    required this.onDelete,
  });

  final SmartStep step;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final statusColor = _statusColor(step.status);
    final catColor = _categoryColor(step.category);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Material(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 44,
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _Badge(
                              label: step.category.displayName,
                              color: catColor),
                          if (step.status == StepStatus.achieved) ...[
                            const SizedBox(width: AppSpacing.sm),
                            const Icon(Icons.emoji_events,
                                size: 14, color: AppColors.green),
                          ],
                        ],
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(step.title,
                          style: AppTextStyles.h3(colors.onSurface)),
                      if (step.description != null) ...[
                        const SizedBox(height: 2),
                        Text(step.description!,
                            style: AppTextStyles.small(
                                colors.onSurfaceVariant),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert,
                      size: 18, color: colors.onSurfaceVariant),
                  tooltip: AppStrings.recordOptions,
                  onSelected: (v) {
                    if (v == 'delete') onDelete();
                  },
                  itemBuilder: (_) => [
                    const PopupMenuItem(
                        value: 'delete', child: Text(AppStrings.delete)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _statusColor(StepStatus s) => switch (s) {
        StepStatus.notStarted => AppColors.slate400,
        StepStatus.inProgress => AppColors.amber,
        StepStatus.achieved => AppColors.green,
      };

  Color _categoryColor(StepCategory c) => switch (c) {
        StepCategory.communication => AppColors.blue,
        StepCategory.selfCare => AppColors.teal400,
        StepCategory.independence => AppColors.green,
        StepCategory.social => AppColors.amber,
        StepCategory.emotional => const Color(0xFF9C27B0),
        StepCategory.learning => AppColors.roleSupportWorker,
        StepCategory.physical => const Color(0xFFE87510),
        StepCategory.other => AppColors.slate400,
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
