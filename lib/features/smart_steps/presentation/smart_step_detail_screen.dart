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
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/smart_step.dart';
import '../domain/step_progress.dart';
import 'providers/smart_steps_provider.dart';

class SmartStepDetailScreen extends ConsumerWidget {
  const SmartStepDetailScreen({super.key, required this.step});

  final SmartStep step;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressAsync = ref.watch(stepProgressNotesProvider(step.id));
    final colors = Theme.of(context).colorScheme;
    final statusColor = _statusColor(step.status);

    return Scaffold(
      appBar: AppBar(
        title: Text(step.title,
            overflow: TextOverflow.ellipsis),
        actions: [
          TextButton(
            onPressed: () => context.push(
              '/children/${step.childId}/smart-steps/${step.id}/edit',
              extra: step,
            ),
            child: Text(AppStrings.edit,
                style: AppTextStyles.button(colors.primary)),
          ),
        ],
      ),
      body: progressAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () =>
              ref.invalidate(stepProgressNotesProvider(step.id)),
        ),
        data: (notes) => CustomScrollView(
          slivers: [
            // Step header
            SliverToBoxAdapter(
              child: _StepHeader(step: step, statusColor: statusColor),
            ),

            // Progress notes header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg, AppSpacing.lg,
                  AppSpacing.lg, AppSpacing.xs,
                ),
                child: Row(
                  children: [
                    Text(AppStrings.smartStepsProgress,
                        style: AppTextStyles.label(
                            colors.onSurfaceVariant)),
                    const Spacer(),
                    Text('${notes.length}',
                        style: AppTextStyles.small(
                            colors.onSurfaceVariant)),
                  ],
                ),
              ),
            ),

            if (notes.isEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Center(
                    child: Text(AppStrings.smartStepsNoProgress,
                        style: AppTextStyles.body(
                            colors.onSurfaceVariant)),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg, 0, AppSpacing.lg, AppSpacing.xl),
                sliver: SliverList.separated(
                  itemCount: notes.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: AppSpacing.sm),
                  itemBuilder: (_, i) =>
                      _ProgressCard(progress: notes[i]),
                ),
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 80)),
          ],
        ),
      ),
      floatingActionButton: step.status != StepStatus.achieved
          ? FloatingActionButton.extended(
              onPressed: () => _showProgressSheet(context, ref),
              backgroundColor: AppColors.teal400,
              foregroundColor: AppColors.white,
              icon: const Icon(Icons.add),
              label: const Text(AppStrings.smartStepsLogProgress),
            )
          : null,
    );
  }

  Color _statusColor(StepStatus s) => switch (s) {
        StepStatus.notStarted => AppColors.slate400,
        StepStatus.inProgress => AppColors.amber,
        StepStatus.achieved => AppColors.green,
      };

  Future<void> _showProgressSheet(
      BuildContext context, WidgetRef ref) =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (_) => _ProgressSheet(step: step),
      );
}

// ── Step header ───────────────────────────────────────────────────────────────

class _StepHeader extends StatelessWidget {
  const _StepHeader({required this.step, required this.statusColor});
  final SmartStep step;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.all(AppSpacing.lg),
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border(
          left: BorderSide(color: statusColor, width: 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _Badge(
                  label: step.status.displayName,
                  color: statusColor),
              const SizedBox(width: AppSpacing.sm),
              _Badge(
                  label: step.category.displayName,
                  color: AppColors.blue),
            ],
          ),
          if (step.description != null && step.description!.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(step.description!,
                style: AppTextStyles.body(colors.onSurface)),
          ],
          if (step.targetDate != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Icon(Icons.flag_outlined,
                    size: 14, color: colors.onSurfaceVariant),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  '${AppStrings.smartStepsTarget}: ${_fmtDate(step.targetDate!)}',
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                ),
              ],
            ),
          ],
          if (step.achievedDate != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Row(
              children: [
                const Icon(Icons.emoji_events,
                    size: 14, color: AppColors.green),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  '${AppStrings.smartStepsAchievedOn}: ${_fmtDate(step.achievedDate!)}',
                  style: AppTextStyles.small(AppColors.green),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _fmtDate(String d) {
    final parts = d.split('-');
    if (parts.length != 3) return d;
    return DateFormat('d MMM yyyy').format(
        DateTime(int.parse(parts[0]), int.parse(parts[1]),
            int.parse(parts[2])));
  }
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

// ── Progress card ─────────────────────────────────────────────────────────────

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({required this.progress});
  final StepProgress progress;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final outcomeColor = switch (progress.outcome) {
      ProgressOutcome.attempted => AppColors.slate400,
      ProgressOutcome.progressed => AppColors.amber,
      ProgressOutcome.achieved => AppColors.green,
    };
    final parts = progress.date.split('-');
    final dateStr = parts.length == 3
        ? DateFormat('EEE d MMM').format(DateTime(
            int.parse(parts[0]), int.parse(parts[1]),
            int.parse(parts[2])))
        : progress.date;

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
                _Badge(
                    label: progress.outcome.displayName,
                    color: outcomeColor),
                const SizedBox(width: AppSpacing.sm),
                Text(dateStr,
                    style: AppTextStyles.small(
                        colors.onSurfaceVariant)),
                const SizedBox(width: AppSpacing.sm),
                Text(progress.shift.displayName,
                    style: AppTextStyles.small(
                        colors.onSurfaceVariant)),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(progress.note,
                style: AppTextStyles.body(colors.onSurface)),
            const SizedBox(height: AppSpacing.xs),
            Text(progress.recordedByName,
                style: AppTextStyles.small(
                    colors.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}

// ── Progress bottom sheet ─────────────────────────────────────────────────────

class _ProgressSheet extends ConsumerStatefulWidget {
  const _ProgressSheet({required this.step});
  final SmartStep step;

  @override
  ConsumerState<_ProgressSheet> createState() =>
      _ProgressSheetState();
}

class _ProgressSheetState extends ConsumerState<_ProgressSheet> {
  final _noteController = TextEditingController();
  ProgressOutcome _outcome = ProgressOutcome.progressed;
  final ShiftType _shift = ShiftType.forTime(DateTime.now());
  bool _saving = false;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  String _todayStr() {
    final d = DateTime.now().toLocal();
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  Future<void> _save() async {
    final note = _noteController.text.trim();
    if (note.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(AppStrings.smartStepsNoteRequired)),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final progress = StepProgress(
        id: const Uuid().v4(),
        homeId: widget.step.homeId,
        childId: widget.step.childId,
        stepId: widget.step.id,
        date: _todayStr(),
        shift: _shift,
        outcome: _outcome,
        note: note,
        recordedById: user?.id ?? 'dev-user-001',
        recordedByName:
            user?.displayName ?? user?.email ?? 'Unknown',
        createdById: user?.id,
        createdAt: now,
        updatedAt: now,
      );
      await ref
          .read(smartStepsRepositoryProvider)
          .logProgress(progress);
      if (mounted) Navigator.of(context).pop();
    } catch (e, st) {
      log('Progress save failed',
          error: e, stackTrace: st, name: 'ProgressSheet');
      if (mounted) {
        setState(() => _saving = false);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(AppStrings.saveFailed)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.lg,
        bottom:
            MediaQuery.of(context).viewInsets.bottom + AppSpacing.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(AppStrings.smartStepsLogProgress,
                  style: AppTextStyles.h3(colors.onSurface)),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
                tooltip: AppStrings.cancel,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // Outcome + shift row
          Row(
            children: [
              Expanded(
                child: Wrap(
                  spacing: AppSpacing.sm,
                  children: ProgressOutcome.values.map((o) {
                    final sel = _outcome == o;
                    final col = switch (o) {
                      ProgressOutcome.attempted => AppColors.slate400,
                      ProgressOutcome.progressed => AppColors.amber,
                      ProgressOutcome.achieved => AppColors.green,
                    };
                    return FilterChip(
                      label: Text(o.displayName),
                      selected: sel,
                      onSelected: (_) =>
                          setState(() => _outcome = o),
                      selectedColor: col.withAlpha(40),
                      checkmarkColor: col,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),

          // Note
          TextField(
            controller: _noteController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: AppStrings.smartStepsNoteLabel,
              hintText: AppStrings.smartStepsNoteHint,
              border: OutlineInputBorder(),
            ),
            autofocus: true,
          ),
          if (_outcome == ProgressOutcome.achieved) ...[
            const SizedBox(height: AppSpacing.sm),
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.green.withAlpha(20),
                borderRadius: BorderRadius.circular(AppRadius.button),
              ),
              child: Row(
                children: [
                  const Icon(Icons.emoji_events,
                      size: 16, color: AppColors.green),
                  const SizedBox(width: AppSpacing.sm),
                  Text(AppStrings.smartStepsAchievedNote,
                      style: AppTextStyles.small(AppColors.green)),
                ],
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.lg),

          FilledButton(
            onPressed: _saving ? null : _save,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.teal400,
              minimumSize: const Size.fromHeight(AppTapTarget.min),
            ),
            child: _saving
                ? const SizedBox(
                    width: 20, height: 20,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: AppColors.white))
                : const Text(AppStrings.save),
          ),
        ],
      ),
    );
  }
}
