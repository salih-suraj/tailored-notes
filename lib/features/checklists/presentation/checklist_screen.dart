import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/checklist_item.dart';
import 'providers/checklist_provider.dart';
import 'widgets/checklist_task_tile.dart';

/// Cleaning checklist for a single child's shift.
/// Shows the child's bedroom tasks + communal area tasks.
class ChecklistScreen extends ConsumerWidget {
  const ChecklistScreen({super.key, required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenAsync = ref.watch(childrenProvider);
    final roomAsync = ref.watch(roomChecklistProvider(childId));
    final communalAsync = ref.watch(communalChecklistProvider);
    final colors = Theme.of(context).colorScheme;
    final now = DateTime.now();
    final shift = ShiftType.forTime(now);

    final child = childrenAsync.valueOrNull
        ?.where((c) => c.id == childId)
        .firstOrNull;

    final title = child != null
        ? '${AppStrings.checklistsTitle} — ${child.name}'
        : AppStrings.checklistsTitle;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(36),
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              bottom: AppSpacing.sm,
            ),
            child: Row(
              children: [
                _ShiftChip(shift: shift),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  DateFormat('d MMM yyyy').format(now),
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ),
      ),
      body: switch ((roomAsync, communalAsync)) {
        (AsyncError(:final error), _) => ErrorView(
            message: error.toString(),
            onRetry: () {
              ref.invalidate(roomChecklistProvider(childId));
              ref.invalidate(communalChecklistProvider);
            },
          ),
        (_, AsyncError(:final error)) => ErrorView(
            message: error.toString(),
            onRetry: () {
              ref.invalidate(roomChecklistProvider(childId));
              ref.invalidate(communalChecklistProvider);
            },
          ),
        (AsyncLoading(), _) || (_, AsyncLoading()) => const LoadingSkeleton(),
        (AsyncData(value: final roomItems), AsyncData(value: final communalItems)) =>
          _ChecklistBody(
            roomItems: roomItems,
            communalItems: communalItems,
            roomLabel: child != null
                ? '${AppStrings.checklistRoomSection} ${child.room}'
                : AppStrings.checklistBedroom,
          ),
        _ => const LoadingSkeleton(),
      },
    );
  }
}

class _ChecklistBody extends StatelessWidget {
  const _ChecklistBody({
    required this.roomItems,
    required this.communalItems,
    required this.roomLabel,
  });

  final List<ChecklistItem> roomItems;
  final List<ChecklistItem> communalItems;
  final String roomLabel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _SectionHeader(
          label: roomLabel.toUpperCase(),
          doneCount: roomItems.where((i) => i.isComplete).length,
          totalCount: roomItems.length,
        ),
        ...roomItems.map((item) => ChecklistTaskTile(item: item)),
        const SizedBox(height: AppSpacing.md),
        const _SectionHeader(label: AppStrings.checklistCommunalSection),
        for (final area in communalAreas)
          ..._areaSection(context, area, communalItems),
        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }

  List<Widget> _areaSection(
    BuildContext context,
    CommunalArea area,
    List<ChecklistItem> allCommunal,
  ) {
    final areaItems =
        allCommunal.where((i) => i.areaKey == area.key).toList();
    if (areaItems.isEmpty) return [];
    final colors = Theme.of(context).colorScheme;
    return [
      Padding(
        padding: const EdgeInsets.only(
          left: AppSpacing.lg,
          top: AppSpacing.sm,
          bottom: AppSpacing.xs,
        ),
        child: Text(
          area.label,
          style: AppTextStyles.label(colors.onSurfaceVariant),
        ),
      ),
      ...areaItems.map((item) => ChecklistTaskTile(item: item)),
    ];
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.label,
    this.doneCount,
    this.totalCount,
  });

  final String label;
  final int? doneCount;
  final int? totalCount;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.xs,
      ),
      child: Row(
        children: [
          Text(label, style: AppTextStyles.label(colors.onSurfaceVariant)),
          if (doneCount != null && totalCount != null) ...[
            const Spacer(),
            Text(
              '$doneCount / $totalCount',
              style: AppTextStyles.small(
                doneCount == totalCount ? AppColors.green : colors.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ShiftChip extends StatelessWidget {
  const _ShiftChip({required this.shift});

  final ShiftType shift;

  @override
  Widget build(BuildContext context) {
    final color = switch (shift) {
      ShiftType.morning => AppColors.amber,
      ShiftType.afternoon => AppColors.teal400,
      ShiftType.night => AppColors.roleSupportWorker,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        shift.displayName,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
