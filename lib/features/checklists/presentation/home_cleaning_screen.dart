import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/children/domain/child.dart';
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/checklist_item.dart';
import 'providers/checklist_provider.dart';
import 'widgets/checklist_task_tile.dart';

/// Home-level cleaning screen.
/// Shows communal areas and every child's bedroom in a single scroll.
/// Staff work through this during cleaning rounds.
class HomeCleaningScreen extends ConsumerWidget {
  const HomeCleaningScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenAsync = ref.watch(childrenProvider);
    final communalAsync = ref.watch(communalChecklistProvider);
    final colors = Theme.of(context).colorScheme;
    final now = DateTime.now();
    final shift = ShiftType.forTime(now);
    final shiftColor = switch (shift) {
      ShiftType.morning => AppColors.amber,
      ShiftType.afternoon => AppColors.teal400,
      ShiftType.night => AppColors.roleSupportWorker,
    };

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.moduleCleaning),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                    color: shiftColor.withAlpha(30),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    shift.displayName,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: shiftColor,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  DateFormat('d MMM yyyy').format(now),
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                ),
              ],
            ),
          ],
        ),
      ),
      body: switch ((childrenAsync, communalAsync)) {
        (AsyncError(:final error), _) ||
        (_, AsyncError(:final error)) => ErrorView(
          message: error.toString(),
          onRetry: () {
            ref.invalidate(childrenProvider);
            ref.invalidate(communalChecklistProvider);
          },
        ),
        (AsyncLoading(), _) || (_, AsyncLoading()) => const LoadingSkeleton(),
        (
          AsyncData(value: final children),
          AsyncData(value: final communalItems),
        ) =>
          _CleaningBody(children: children, communalItems: communalItems),
        _ => const LoadingSkeleton(),
      },
    );
  }
}

// ── Body ──────────────────────────────────────────────────────────────────────

class _CleaningBody extends StatelessWidget {
  const _CleaningBody({required this.children, required this.communalItems});

  final List<Child> children;
  final List<ChecklistItem> communalItems;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListView(
      children: [
        // ── Communal areas ──────────────────────────────────────────────
        _SectionHeader(
          label: AppStrings.checklistCommunalSection,
          colors: colors,
        ),
        for (final area in communalAreas)
          ..._communalSection(context, area, communalItems),

        const SizedBox(height: AppSpacing.lg),

        // ── Children's bedrooms ────────────────────────────────────────
        _SectionHeader(label: AppStrings.cleaningBedrooms, colors: colors),
        for (final child in children) _RoomSection(child: child),

        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }

  List<Widget> _communalSection(
    BuildContext context,
    CommunalArea area,
    List<ChecklistItem> allCommunal,
  ) {
    final areaItems = allCommunal.where((i) => i.areaKey == area.key).toList();
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

// ── Room section per child ────────────────────────────────────────────────────

class _RoomSection extends ConsumerWidget {
  const _RoomSection({required this.child});

  final Child child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomAsync = ref.watch(roomChecklistProvider(child.id));
    final colors = Theme.of(context).colorScheme;

    return roomAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (e, _) => const SizedBox.shrink(),
      data: (items) {
        final doneCount = items.where((i) => i.isComplete).length;
        final allDone = doneCount == items.length && items.isNotEmpty;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.md,
                AppSpacing.lg,
                AppSpacing.xs,
              ),
              child: Row(
                children: [
                  Text(
                    '${AppStrings.checklistRoomSection} ${child.room} — ${child.name}',
                    style: AppTextStyles.label(colors.onSurfaceVariant),
                  ),
                  const Spacer(),
                  Text(
                    '$doneCount / ${items.length}',
                    style: AppTextStyles.small(
                      allDone ? AppColors.green : colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            ...items.map((item) => ChecklistTaskTile(item: item)),
          ],
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.label, required this.colors});
  final String label;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(
      AppSpacing.lg,
      AppSpacing.lg,
      AppSpacing.lg,
      AppSpacing.xs,
    ),
    child: Text(label, style: AppTextStyles.label(colors.onSurfaceVariant)),
  );
}
