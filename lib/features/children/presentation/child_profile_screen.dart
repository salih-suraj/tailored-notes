import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/models/shift_completion.dart';
import '../../../shared/providers/shift_completion_provider.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../../../shared/widgets/shift_progress_bar.dart';
import 'providers/children_provider.dart';

/// Overview of a single child — quick-access cards to each care module.
class ChildProfileScreen extends ConsumerWidget {
  const ChildProfileScreen({super.key, required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenAsync = ref.watch(childrenProvider);
    final completion = ref.watch(shiftCompletionProvider(childId));
    final colors = Theme.of(context).colorScheme;

    return childrenAsync.when(
      loading: () => const Scaffold(body: LoadingSkeleton()),
      error: (error, _) => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.childProfile)),
        body: ErrorView(
          message: error.toString(),
          onRetry: () => ref.invalidate(childrenProvider),
        ),
      ),
      data: (children) {
        final child = children.where((c) => c.id == childId).firstOrNull;

        if (child == null) {
          return Scaffold(
            appBar: AppBar(title: const Text(AppStrings.childProfile)),
            body: Center(
              child: Text(
                AppStrings.childNotFound,
                style: AppTextStyles.body(colors.onSurfaceVariant),
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(title: Text(child.name)),
          body: ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              // ── Avatar + name header ────────────────────────────────────
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: colors.primaryContainer,
                      backgroundImage: child.photoUrl != null
                          ? NetworkImage(child.photoUrl!)
                          : null,
                      child: child.photoUrl == null
                          ? Text(
                              child.initials,
                              style: AppTextStyles.h1(colors.onPrimaryContainer),
                            )
                          : null,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(child.name, style: AppTextStyles.h1(colors.onSurface)),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Age ${child.ageYears} · Room ${child.room}',
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // ── Incomplete docs alert ───────────────────────────────────
              if (completion.status != CompletionStatus.complete) ...[
                _IncompleteDocsAlert(completion: completion),
                const SizedBox(height: AppSpacing.sm),
              ],

              // ── Shift completion ────────────────────────────────────────
              ShiftProgressBar(childId: childId),
              const SizedBox(height: AppSpacing.xl),

              // ── Care modules ────────────────────────────────────────────
              Text(
                AppStrings.careRecordSection,
                style: AppTextStyles.label(colors.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.sm),
              _ModuleCard(
                icon: Icons.edit_note,
                label: AppStrings.moduleDailyNotes,
                description: AppStrings.moduleDailyNotesDesc,
                color: AppColors.teal400,
                onTap: () => context.push('/children/$childId/daily-notes'),
              ),
              const SizedBox(height: AppSpacing.sm),
              _ModuleCard(
                icon: Icons.thermostat_outlined,
                label: AppStrings.bathTempModule,
                description: AppStrings.bathTempModuleDesc,
                color: AppColors.blue,
                onTap: () => context.push('/children/$childId/bath-temp'),
              ),
              const SizedBox(height: AppSpacing.sm),
              _ModuleCard(
                icon: Icons.description_outlined,
                label: AppStrings.moduleCarePlans,
                description: AppStrings.moduleCarePlansDesc,
                color: AppColors.teal400,
                onTap: () => context.push('/children/$childId/care-plans'),
              ),
              const SizedBox(height: AppSpacing.sm),
              _ModuleCard(
                icon: Icons.medication_outlined,
                label: AppStrings.moduleMedication,
                description: AppStrings.moduleMedicationDesc,
                color: AppColors.blue,
                onTap: () =>
                    context.push('/children/$childId/medication'),
              ),
              const SizedBox(height: AppSpacing.sm),
              _ModuleCard(
                icon: Icons.health_and_safety_outlined,
                label: AppStrings.moduleMedicalHistory,
                description: AppStrings.moduleMedicalHistoryDesc,
                color: AppColors.red,
                onTap: () =>
                    context.push('/children/$childId/medical-history'),
              ),
              const SizedBox(height: AppSpacing.sm),
              _ModuleCard(
                icon: Icons.show_chart,
                label: AppStrings.moduleBehaviour,
                description: AppStrings.moduleBehaviourDesc,
                color: AppColors.amber,
                onTap: () =>
                    context.push('/children/$childId/behaviour'),
              ),
              const SizedBox(height: AppSpacing.sm),
              _ModuleCard(
                icon: Icons.bedtime_outlined,
                label: AppStrings.moduleSleepDiary,
                description: AppStrings.moduleSleepDiaryDesc,
                color: AppColors.roleSupportWorker,
                onTap: () =>
                    context.push('/children/$childId/sleep-diary'),
              ),
              const SizedBox(height: AppSpacing.sm),
              _ModuleCard(
                icon: Icons.restaurant_outlined,
                label: AppStrings.moduleFoodDiary,
                description: AppStrings.moduleFoodDiaryDesc,
                color: AppColors.green,
                onTap: () =>
                    context.push('/children/$childId/food-diary'),
              ),
              const SizedBox(height: AppSpacing.sm),
              _ModuleCard(
                icon: Icons.star_outline,
                label: AppStrings.moduleActivities,
                description: AppStrings.moduleActivitiesDesc,
                color: AppColors.amber,
                onTap: () =>
                    context.push('/children/$childId/activities'),
              ),
              const SizedBox(height: AppSpacing.sm),
              _ModuleCard(
                icon: Icons.stairs_outlined,
                label: AppStrings.moduleSmartSteps,
                description: AppStrings.moduleSmartStepsDesc,
                color: AppColors.teal400,
                onTap: () =>
                    context.push('/children/$childId/smart-steps'),
              ),
              const SizedBox(height: AppSpacing.sm),
              _ModuleCard(
                icon: Icons.report_outlined,
                label: AppStrings.moduleIncidents,
                description: AppStrings.moduleIncidentsDesc,
                color: AppColors.red,
                onTap: () =>
                    context.push('/children/$childId/incidents'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _IncompleteDocsAlert extends StatelessWidget {
  const _IncompleteDocsAlert({required this.completion});

  final ShiftCompletion completion;

  @override
  Widget build(BuildContext context) {
    final incomplete =
        completion.sections.where((s) => !s.complete).toList();
    final color = completion.status == CompletionStatus.none
        ? AppColors.red
        : AppColors.amber;
    final sectionNames = incomplete.map((s) => s.label).join(' · ');

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: color.withAlpha(80)),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: color, size: 18),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.alertNotRecordedThisShift,
                    style: AppTextStyles.label(color)),
                Text(sectionNames,
                    style: AppTextStyles.small(color)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ModuleCard extends StatelessWidget {
  const _ModuleCard({
    required this.icon,
    required this.label,
    required this.description,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String description;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Semantics(
      button: true,
      child: Material(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            child: Row(
              children: [
                Container(
                  width: AppTapTarget.min,
                  height: AppTapTarget.min,
                  decoration: BoxDecoration(
                    color: color.withAlpha(25),
                    borderRadius: BorderRadius.circular(AppRadius.button),
                  ),
                  child: Icon(icon, color: color, size: 22),
                ),
                const SizedBox(width: AppSpacing.lg),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label, style: AppTextStyles.h3(colors.onSurface)),
                      Text(
                        description,
                        style: AppTextStyles.small(colors.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: colors.onSurfaceVariant,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
