import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/children/domain/child.dart';
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../core/routing/app_routes.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/models/shift_completion.dart';
import '../../../shared/providers/shift_completion_provider.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';

/// Team Leader Oversight — shift-level view of documentation completion
/// across all children. Lives on the Handover tab (team leader role only).
class TeamLeaderOversightScreen extends ConsumerWidget {
  const TeamLeaderOversightScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenAsync = ref.watch(childrenProvider);
    final colors = Theme.of(context).colorScheme;
    final shift = ShiftType.forTime(DateTime.now());
    final dateStr = DateFormat(
      'EEEE d MMMM yyyy',
      'en_GB',
    ).format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.oversightTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.dashboard_outlined),
            tooltip: AppStrings.navDashboard,
            onPressed: () => context.push(AppRoutes.dashboard),
          ),
          IconButton(
            icon: const Icon(Icons.insights_outlined),
            tooltip: AppStrings.dashboardViewBehaviourPatterns,
            onPressed: () => context.push(AppRoutes.behaviourPatterns),
          ),
          IconButton(
            icon: const Icon(Icons.summarize_outlined),
            tooltip: AppStrings.oversightViewSummary,
            onPressed: () => context.push(AppRoutes.handoverSummary),
          ),
        ],
      ),
      body: childrenAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          error: e,
          onRetry: () => ref.invalidate(childrenProvider),
        ),
        data: (children) {
          if (children.isEmpty) {
            return Center(
              child: Text(
                AppStrings.noChildren,
                style: AppTextStyles.body(colors.onSurfaceVariant),
              ),
            );
          }

          final completions = {
            for (final c in children)
              c.id: ref.watch(shiftCompletionProvider(c.id)),
          };

          final needsAttention = children
              .where(
                (c) => completions[c.id]!.status != CompletionStatus.complete,
              )
              .toList();
          final fullyDocumented = children
              .where(
                (c) => completions[c.id]!.status == CompletionStatus.complete,
              )
              .toList();

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              _ShiftHeaderCard(
                shift: shift,
                dateStr: dateStr,
                completeCount: fullyDocumented.length,
                totalCount: children.length,
              ),
              const SizedBox(height: AppSpacing.xl),

              if (needsAttention.isNotEmpty) ...[
                Text(
                  AppStrings.oversightNeedsAttention,
                  style: AppTextStyles.label(AppColors.amber),
                ),
                const SizedBox(height: AppSpacing.sm),
                ...needsAttention.map(
                  (c) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: _ChildOversightCard(
                      child: c,
                      completion: completions[c.id]!,
                      onTap: () => context.push('/children/${c.id}'),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
              ],

              if (fullyDocumented.isNotEmpty) ...[
                Text(
                  AppStrings.oversightFullyDocumented,
                  style: AppTextStyles.label(AppColors.green),
                ),
                const SizedBox(height: AppSpacing.sm),
                ...fullyDocumented.map(
                  (c) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: _ChildOversightCard(
                      child: c,
                      completion: completions[c.id]!,
                      onTap: () => context.push('/children/${c.id}'),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 80),
            ],
          );
        },
      ),
    );
  }
}

// ── Shift header card ─────────────────────────────────────────────────────────

class _ShiftHeaderCard extends StatelessWidget {
  const _ShiftHeaderCard({
    required this.shift,
    required this.dateStr,
    required this.completeCount,
    required this.totalCount,
  });

  final ShiftType shift;
  final String dateStr;
  final int completeCount;
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final allDone = completeCount == totalCount;
    final barColor = allDone ? AppColors.green : AppColors.amber;

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  shift.displayName.toUpperCase(),
                  style: AppTextStyles.label(colors.onSurfaceVariant),
                ),
                const Spacer(),
                Text(
                  '$completeCount of $totalCount',
                  style: AppTextStyles.label(barColor),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(dateStr, style: AppTextStyles.small(colors.onSurfaceVariant)),
            const SizedBox(height: AppSpacing.md),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.pill),
              child: LinearProgressIndicator(
                value: totalCount > 0 ? completeCount / totalCount : 0,
                minHeight: 6,
                backgroundColor: colors.outlineVariant,
                valueColor: AlwaysStoppedAnimation(barColor),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              AppStrings.oversightChildrenDocumented,
              style: AppTextStyles.small(colors.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Per-child card ────────────────────────────────────────────────────────────

class _ChildOversightCard extends StatelessWidget {
  const _ChildOversightCard({
    required this.child,
    required this.completion,
    required this.onTap,
  });

  final Child child;
  final ShiftCompletion completion;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isComplete = completion.status == CompletionStatus.complete;
    final statusColor = switch (completion.status) {
      CompletionStatus.complete => AppColors.green,
      CompletionStatus.partial => AppColors.amber,
      CompletionStatus.none => AppColors.red,
    };
    final incomplete = completion.sections.where((s) => !s.complete).toList();

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              Icon(
                isComplete
                    ? Icons.check_circle_outline
                    : Icons.warning_amber_rounded,
                color: statusColor,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            child.name,
                            style: AppTextStyles.h3(colors.onSurface),
                          ),
                        ),
                        Text(
                          'Room ${child.room}',
                          style: AppTextStyles.small(colors.onSurfaceVariant),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      isComplete
                          ? AppStrings.oversightAllComplete
                          : incomplete.map((s) => s.label).join(' · '),
                      style: AppTextStyles.small(statusColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Icon(
                Icons.chevron_right,
                color: colors.onSurfaceVariant,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
