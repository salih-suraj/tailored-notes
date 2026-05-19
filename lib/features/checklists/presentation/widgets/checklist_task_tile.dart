import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/checklist_item.dart';
import '../providers/checklist_provider.dart';

/// A tappable row that toggles a single cleaning task.
class ChecklistTaskTile extends ConsumerWidget {
  const ChecklistTaskTile({super.key, required this.item});

  final ChecklistItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => ref
          .read(checklistItemsRepositoryProvider)
          .toggle(item),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        child: Row(
          children: [
            Icon(
              item.isComplete
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: item.isComplete ? AppColors.green : colors.outline,
              size: 22,
            ),
            const SizedBox(width: AppSpacing.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.taskLabel,
                    style: AppTextStyles.body(colors.onSurface).copyWith(
                      decoration: item.isComplete
                          ? TextDecoration.lineThrough
                          : null,
                      decorationColor: colors.onSurfaceVariant,
                      color: item.isComplete
                          ? colors.onSurfaceVariant
                          : colors.onSurface,
                    ),
                  ),
                  if (item.isComplete && item.completedByName != null)
                    Text(
                      item.completedByName!,
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
