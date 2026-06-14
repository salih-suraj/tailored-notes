import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../models/shift_completion.dart';
import '../providers/shift_completion_provider.dart';

/// Full progress card shown on the child profile.
/// Breaks down completion section by section for the current shift.
class ShiftProgressBar extends ConsumerWidget {
  const ShiftProgressBar({super.key, required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completion = ref.watch(shiftCompletionProvider(childId));
    final colors = Theme.of(context).colorScheme;
    final statusColor = _colorFor(completion.status);

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                Text(
                  'TODAY · ${completion.shift.displayName.toUpperCase()} SHIFT',
                  style: AppTextStyles.label(colors.onSurfaceVariant),
                ),
                const Spacer(),
                Text(
                  '${completion.completedCount} of ${completion.totalCount}',
                  style: AppTextStyles.label(statusColor),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),

            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.pill),
              child: LinearProgressIndicator(
                value: completion.progress,
                minHeight: 6,
                backgroundColor: colors.outlineVariant,
                valueColor: AlwaysStoppedAnimation(statusColor),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Section chips
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: completion.sections
                  .map((s) => _SectionChip(section: s))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Color _colorFor(CompletionStatus status) => switch (status) {
    CompletionStatus.none => AppColors.red,
    CompletionStatus.partial => AppColors.amber,
    CompletionStatus.complete => AppColors.green,
  };
}

class _SectionChip extends StatelessWidget {
  const _SectionChip({required this.section});

  final ShiftSection section;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final fg = section.complete ? AppColors.green : colors.onSurfaceVariant;
    final bg = section.complete
        ? AppColors.green.withAlpha(20)
        : colors.outlineVariant.withAlpha(80);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: fg.withAlpha(60)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            section.complete
                ? Icons.check_circle_outline
                : Icons.radio_button_unchecked,
            size: 12,
            color: fg,
          ),
          const SizedBox(width: 4),
          Text(section.label, style: AppTextStyles.small(fg)),
        ],
      ),
    );
  }
}
