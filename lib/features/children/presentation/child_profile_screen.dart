import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/models/app_strings.dart';
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
                icon: Icons.cleaning_services_outlined,
                label: AppStrings.moduleCleaning,
                description: AppStrings.moduleCleaningDesc,
                color: AppColors.teal400,
                onTap: () => context.push('/children/$childId/checklists'),
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
              const _ModuleCard(
                icon: Icons.show_chart,
                label: AppStrings.moduleBehaviour,
                description: AppStrings.moduleBehaviourDesc,
                color: AppColors.amber,
                locked: true,
              ),
              const SizedBox(height: AppSpacing.sm),
              const _ModuleCard(
                icon: Icons.bedtime_outlined,
                label: AppStrings.moduleSleepDiary,
                description: AppStrings.moduleSleepDiaryDesc,
                color: AppColors.roleSupportWorker,
                locked: true,
              ),
              const SizedBox(height: AppSpacing.sm),
              const _ModuleCard(
                icon: Icons.restaurant_outlined,
                label: AppStrings.moduleFoodDiary,
                description: AppStrings.moduleFoodDiaryDesc,
                color: AppColors.green,
                locked: true,
              ),
              const SizedBox(height: AppSpacing.sm),
              const _ModuleCard(
                icon: Icons.star_outline,
                label: AppStrings.moduleActivities,
                description: AppStrings.moduleActivitiesDesc,
                color: AppColors.amber,
                locked: true,
              ),
            ],
          ),
        );
      },
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
    this.locked = false,
  });

  final IconData icon;
  final String label;
  final String description;
  final Color color;
  final VoidCallback? onTap;
  final bool locked;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final effectiveOnTap = locked ? null : onTap;

    return Opacity(
      opacity: locked ? 0.45 : 1.0,
      child: Material(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: InkWell(
          onTap: effectiveOnTap,
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
                  locked ? Icons.lock_outline : Icons.chevron_right,
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
