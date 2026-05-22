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
import '../domain/food_entry.dart';
import 'providers/food_diary_provider.dart';

class FoodDiaryScreen extends ConsumerWidget {
  const FoodDiaryScreen({super.key, required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entriesAsync = ref.watch(foodEntriesProvider(childId));
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
            const Text(AppStrings.foodDiaryTitle),
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
          onRetry: () => ref.invalidate(foodEntriesProvider(childId)),
        ),
        data: (entries) {
          if (entries.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.restaurant_outlined,
                      size: 56, color: colors.onSurfaceVariant),
                  const SizedBox(height: AppSpacing.lg),
                  Text(AppStrings.foodNoEntries,
                      style: AppTextStyles.body(colors.onSurfaceVariant)),
                  const SizedBox(height: AppSpacing.sm),
                  Text(AppStrings.foodNoEntriesHint,
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
            itemBuilder: (_, i) => _FoodCard(
              entry: entries[i],
              onEdit: () => context.push(
                '/children/$childId/food-diary/${entries[i].id}/edit',
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
            context.push('/children/$childId/food-diary/new'),
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.white,
        icon: const Icon(Icons.add),
        label: const Text(AppStrings.foodLogEntry),
      ),
    );
  }

  Future<void> _confirmDelete(
      BuildContext context, WidgetRef ref, String id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(AppStrings.foodDeleteTitle),
        content: const Text(AppStrings.foodDeleteConfirm),
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
      await ref.read(foodEntriesRepositoryProvider).delete(id);
    }
  }
}

class _FoodCard extends StatelessWidget {
  const _FoodCard({
    required this.entry,
    required this.onEdit,
    required this.onDelete,
  });

  final FoodEntry entry;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final appetiteColor = _appetiteColor(entry.appetite);
    final mealColor = _mealColor(entry.mealType);

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
                  _Badge(label: entry.mealType.displayName, color: mealColor),
                  const SizedBox(width: AppSpacing.sm),
                  _Badge(
                      label: entry.appetite.displayName,
                      color: appetiteColor),
                  const SizedBox(width: AppSpacing.sm),
                  Text(dateStr,
                      style: AppTextStyles.small(colors.onSurfaceVariant)),
                  const Spacer(),
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
                          value: 'delete',
                          child: Text(AppStrings.delete)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(entry.description,
                  style: AppTextStyles.body(colors.onSurface),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              if (entry.concerns != null && entry.concerns!.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.xs),
                Row(
                  children: [
                    const Icon(Icons.warning_amber_outlined,
                        size: 14, color: AppColors.amber),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(
                      child: Text(entry.concerns!,
                          style: AppTextStyles.small(AppColors.amber),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: AppSpacing.xs),
              Text(entry.recordedByName,
                  style: AppTextStyles.small(colors.onSurfaceVariant)),
            ],
          ),
        ),
      ),
    );
  }

  Color _appetiteColor(Appetite a) => switch (a) {
        Appetite.good => AppColors.green,
        Appetite.fair => AppColors.amber,
        Appetite.poor => AppColors.red,
      };

  Color _mealColor(MealType m) => switch (m) {
        MealType.breakfast => AppColors.amber,
        MealType.morningSnack => const Color(0xFFD4892A),
        MealType.lunch => AppColors.teal400,
        MealType.afternoonSnack => AppColors.blue,
        MealType.dinner => AppColors.green,
        MealType.eveningSnack => AppColors.roleSupportWorker,
        MealType.other => AppColors.slate400,
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
