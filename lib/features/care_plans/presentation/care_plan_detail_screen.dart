import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/care_plan.dart';
import '../domain/care_plan_goal.dart';
import 'providers/care_plans_provider.dart';

class CarePlanDetailScreen extends ConsumerWidget {
  const CarePlanDetailScreen({
    super.key,
    required this.plan,
  });

  final CarePlan plan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsAsync = ref.watch(carePlanGoalsProvider(plan.id));
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(plan.title),
        actions: [
          TextButton(
            onPressed: () => context.push(
              '/children/${plan.childId}/care-plans/${plan.id}/edit',
              extra: plan,
            ),
            child: Text(
              AppStrings.edit,
              style: AppTextStyles.button(colors.primary),
            ),
          ),
        ],
      ),
      body: goalsAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(carePlanGoalsProvider(plan.id)),
        ),
        data: (goals) => CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _PlanHeader(plan: plan)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.lg,
                  AppSpacing.lg,
                  AppSpacing.xs,
                ),
                child: Row(
                  children: [
                    Text(
                      AppStrings.carePlanGoals,
                      style: AppTextStyles.label(colors.onSurfaceVariant),
                    ),
                    const Spacer(),
                    Text(
                      '${goals.length}',
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ),
            if (goals.isEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Center(
                    child: Text(
                      AppStrings.carePlanNoGoals,
                      style: AppTextStyles.body(colors.onSurfaceVariant),
                    ),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  0,
                  AppSpacing.lg,
                  AppSpacing.xl,
                ),
                sliver: SliverList.separated(
                  itemCount: goals.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: AppSpacing.sm),
                  itemBuilder: (_, i) => _GoalCard(
                    goal: goals[i],
                    onTap: () => _showGoalSheet(context, ref, goal: goals[i]),
                    onDelete: () =>
                        _confirmDeleteGoal(context, ref, goals[i].id),
                  ),
                ),
              ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 80), // FAB clearance
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showGoalSheet(context, ref),
        backgroundColor: AppColors.teal400,
        foregroundColor: AppColors.white,
        icon: const Icon(Icons.add),
        label: const Text(AppStrings.goalNew),
      ),
    );
  }

  Future<void> _showGoalSheet(
    BuildContext context,
    WidgetRef ref, {
    CarePlanGoal? goal,
  }) =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (_) => _GoalEditorSheet(plan: plan, existing: goal),
      );

  Future<void> _confirmDeleteGoal(
    BuildContext context,
    WidgetRef ref,
    String id,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(AppStrings.goalDeleteTitle),
        content: const Text(AppStrings.goalDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(carePlansRepositoryProvider).deleteGoal(id);
    }
  }
}

// ── Plan header ───────────────────────────────────────────────────────────────

class _PlanHeader extends StatelessWidget {
  const _PlanHeader({required this.plan});
  final CarePlan plan;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final statusColor = _statusColor(plan.status);

    return Container(
      margin: const EdgeInsets.all(AppSpacing.lg),
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withAlpha(25),
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                child: Text(
                  plan.status.displayName,
                  style: AppTextStyles.label(statusColor),
                ),
              ),
              if (plan.reviewDate != null) ...[
                const Spacer(),
                Icon(
                  Icons.event_outlined,
                  size: 14,
                  color: colors.onSurfaceVariant,
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  _formatDate(plan.reviewDate!),
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                ),
              ],
            ],
          ),
          if (plan.notes != null && plan.notes!.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            Text(plan.notes!, style: AppTextStyles.body(colors.onSurface)),
          ],
          const SizedBox(height: AppSpacing.sm),
          Text(
            '${AppStrings.carePlanBy} ${plan.authorName}',
            style: AppTextStyles.small(colors.onSurfaceVariant),
          ),
          if (plan.approvedByName != null) ...[
            Text(
              '${AppStrings.carePlanApprovedBy} ${plan.approvedByName}',
              style: AppTextStyles.small(colors.onSurfaceVariant),
            ),
          ],
        ],
      ),
    );
  }

  Color _statusColor(CarePlanStatus s) => switch (s) {
        CarePlanStatus.active => AppColors.green,
        CarePlanStatus.draft => AppColors.amber,
        CarePlanStatus.underReview => AppColors.blue,
        CarePlanStatus.archived => AppColors.slate400,
      };

  String _formatDate(String d) {
    final parts = d.split('-');
    if (parts.length != 3) return d;
    final dt = DateTime(
        int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
    return DateFormat('d MMM yyyy').format(dt);
  }
}

// ── Goal card ─────────────────────────────────────────────────────────────────

class _GoalCard extends StatelessWidget {
  const _GoalCard({
    required this.goal,
    required this.onTap,
    required this.onDelete,
  });

  final CarePlanGoal goal;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final statusColor = _goalStatusColor(goal.status);
    const catColor = AppColors.blue;

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _Chip(label: goal.category.displayName, color: catColor),
                  const SizedBox(width: AppSpacing.sm),
                  _Chip(
                    label: goal.status.displayName,
                    color: statusColor,
                  ),
                  const Spacer(),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert,
                        size: 18, color: colors.onSurfaceVariant),
                    tooltip: AppStrings.recordOptions,
                    onSelected: (v) {
                      if (v == 'edit') onTap();
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
              Text(goal.title, style: AppTextStyles.h3(colors.onSurface)),
              if (goal.strategy != null && goal.strategy!.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  goal.strategy!,
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              if (goal.progressNotes != null &&
                  goal.progressNotes!.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  goal.progressNotes!,
                  style: AppTextStyles.small(colors.primary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _goalStatusColor(GoalStatus s) => switch (s) {
        GoalStatus.notStarted => AppColors.slate400,
        GoalStatus.inProgress => AppColors.amber,
        GoalStatus.achieved => AppColors.green,
        GoalStatus.discontinued => AppColors.red,
      };
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          color: color.withAlpha(25),
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Text(label, style: AppTextStyles.label(color)),
      );
}

// ── Goal editor sheet ─────────────────────────────────────────────────────────

class _GoalEditorSheet extends ConsumerStatefulWidget {
  const _GoalEditorSheet({required this.plan, this.existing});

  final CarePlan plan;
  final CarePlanGoal? existing;

  @override
  ConsumerState<_GoalEditorSheet> createState() => _GoalEditorSheetState();
}

class _GoalEditorSheetState extends ConsumerState<_GoalEditorSheet> {
  final _titleController = TextEditingController();
  final _strategyController = TextEditingController();
  final _descController = TextEditingController();
  final _progressController = TextEditingController();
  GoalCategory _category = GoalCategory.other;
  GoalStatus _status = GoalStatus.notStarted;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final g = widget.existing;
    if (g != null) {
      _titleController.text = g.title;
      _strategyController.text = g.strategy ?? '';
      _descController.text = g.description ?? '';
      _progressController.text = g.progressNotes ?? '';
      _category = g.category;
      _status = g.status;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _strategyController.dispose();
    _descController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.goalTitleRequired)),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final existing = widget.existing;
      final goal = CarePlanGoal(
        id: existing?.id ?? const Uuid().v4(),
        carePlanId: widget.plan.id,
        homeId: widget.plan.homeId,
        childId: widget.plan.childId,
        category: _category,
        title: title,
        description: _descController.text.trim().isEmpty
            ? null
            : _descController.text.trim(),
        strategy: _strategyController.text.trim().isEmpty
            ? null
            : _strategyController.text.trim(),
        status: _status,
        progressNotes: _progressController.text.trim().isEmpty
            ? null
            : _progressController.text.trim(),
        sortOrder: existing?.sortOrder ?? 0,
        createdById: existing?.createdById ?? user?.id,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      );
      await ref.read(carePlansRepositoryProvider).saveGoal(goal);
      if (mounted) Navigator.of(context).pop();
    } catch (e, st) {
      log('Goal save failed', error: e, stackTrace: st, name: 'GoalSheet');
      if (mounted) {
        setState(() => _saving = false);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text(AppStrings.saveFailed)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isEditing = widget.existing != null;

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.xl,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  isEditing ? AppStrings.goalEdit : AppStrings.goalNew,
                  style: AppTextStyles.h3(colors.onSurface),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                  tooltip: AppStrings.cancel,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),

            // Category chips
            const Text(AppStrings.goalCategory),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: GoalCategory.values.map((c) {
                final sel = _category == c;
                return FilterChip(
                  label: Text(c.displayName),
                  selected: sel,
                  onSelected: (_) => setState(() => _category = c),
                  selectedColor: colors.primaryContainer,
                  checkmarkColor: colors.primary,
                );
              }).toList(),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Goal title
            const Text(AppStrings.goalTitle),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: AppStrings.goalTitleHint,
                border: OutlineInputBorder(),
              ),
              autofocus: widget.existing == null,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Strategy
            const Text(AppStrings.goalStrategy),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _strategyController,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: AppStrings.goalStrategyHint,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Status
            const Text(AppStrings.goalStatus),
            const SizedBox(height: AppSpacing.sm),
            SegmentedButton<GoalStatus>(
              segments: GoalStatus.values
                  .map((s) => ButtonSegment(
                        value: s,
                        label: Text(s.displayName,
                            style: const TextStyle(fontSize: 11)),
                      ))
                  .toList(),
              selected: {_status},
              onSelectionChanged: (v) => setState(() => _status = v.first),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Progress notes
            const Text(AppStrings.goalProgressNotes),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _progressController,
              maxLines: 2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),

            FilledButton(
              onPressed: _saving ? null : _save,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.teal400,
                minimumSize: const Size.fromHeight(AppTapTarget.min),
              ),
              child: _saving
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: AppColors.white),
                    )
                  : const Text(AppStrings.save),
            ),
          ],
        ),
      ),
    );
  }
}
