import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/models/shift_completion.dart';
import '../../../shared/providers/shift_completion_provider.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../../../shared/widgets/shift_progress_bar.dart';
import '../../medical_history/presentation/providers/medical_history_provider.dart';
import '../domain/child.dart';
import 'providers/children_provider.dart';

final _dobFormat = DateFormat('d MMM yyyy', 'en_GB');

/// A single care-module entry point shown on the profile hub.
class _Module {
  const _Module({
    required this.icon,
    required this.label,
    required this.description,
    required this.color,
    required this.route,
  });

  final IconData icon;
  final String label;
  final String description;
  final Color color;
  final String route; // path segment under /children/:id/
}

/// Overview of a single child — identity, safety flags, today's documentation
/// status, then grouped entry points to each care module.
///
/// This screen is a *hub*: it surfaces the safety-critical headlines (allergies,
/// conditions, what's outstanding this shift) and routes into the deep records,
/// rather than expanding every record inline.
class ChildProfileScreen extends ConsumerWidget {
  const ChildProfileScreen({super.key, required this.childId});

  final String childId;

  // ── Care modules, grouped for scannability ────────────────────────────────
  static const _dailyCare = [
    _Module(
      icon: Icons.edit_note,
      label: AppStrings.moduleDailyNotes,
      description: AppStrings.moduleDailyNotesDesc,
      color: AppColors.moduleDailyNotes,
      route: 'daily-notes',
    ),
    _Module(
      icon: Icons.restaurant_outlined,
      label: AppStrings.moduleFoodDiary,
      description: AppStrings.moduleFoodDiaryDesc,
      color: AppColors.moduleFood,
      route: 'food-diary',
    ),
    _Module(
      icon: Icons.bedtime_outlined,
      label: AppStrings.moduleSleepDiary,
      description: AppStrings.moduleSleepDiaryDesc,
      color: AppColors.moduleSleep,
      route: 'sleep-diary',
    ),
    _Module(
      icon: Icons.thermostat_outlined,
      label: AppStrings.bathTempModule,
      description: AppStrings.bathTempModuleDesc,
      color: AppColors.moduleBathTemp,
      route: 'bath-temp',
    ),
    _Module(
      icon: Icons.star_outline,
      label: AppStrings.moduleActivities,
      description: AppStrings.moduleActivitiesDesc,
      color: AppColors.moduleActivities,
      route: 'activities',
    ),
  ];

  static const _healthSafety = [
    _Module(
      icon: Icons.medication_outlined,
      label: AppStrings.moduleMedication,
      description: AppStrings.moduleMedicationDesc,
      color: AppColors.moduleMedication,
      route: 'medication',
    ),
    _Module(
      icon: Icons.health_and_safety_outlined,
      label: AppStrings.moduleMedicalHistory,
      description: AppStrings.moduleMedicalHistoryDesc,
      color: AppColors.moduleMedicalHistory,
      route: 'medical-history',
    ),
    _Module(
      icon: Icons.show_chart,
      label: AppStrings.moduleBehaviour,
      description: AppStrings.moduleBehaviourDesc,
      color: AppColors.moduleBehaviour,
      route: 'behaviour',
    ),
    _Module(
      icon: Icons.report_outlined,
      label: AppStrings.moduleIncidents,
      description: AppStrings.moduleIncidentsDesc,
      color: AppColors.moduleIncidents,
      route: 'incidents',
    ),
  ];

  static const _planning = [
    _Module(
      icon: Icons.description_outlined,
      label: AppStrings.moduleCarePlans,
      description: AppStrings.moduleCarePlansDesc,
      color: AppColors.moduleCarePlans,
      route: 'care-plans',
    ),
    _Module(
      icon: Icons.stairs_outlined,
      label: AppStrings.moduleSmartSteps,
      description: AppStrings.moduleSmartStepsDesc,
      color: AppColors.moduleSmartSteps,
      route: 'smart-steps',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenAsync = ref.watch(childrenProvider);
    final completion = ref.watch(shiftCompletionProvider(childId));
    // Supplementary — never blocks the screen; banners appear once it loads.
    final medical = ref.watch(medicalProfileProvider(childId)).valueOrNull;
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

        final allergies = medical?.allergies?.trim() ?? '';
        final conditions = medical?.conditions?.trim() ?? '';

        return Scaffold(
          appBar: AppBar(title: Text(child.name)),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.xxl,
            ),
            children: [
              // 1 ── Identity ──────────────────────────────────────────────
              _IdentityHeader(child: child),
              const SizedBox(height: AppSpacing.lg),

              // 2 ── Safety flags (loudest element on the page) ────────────
              if (allergies.isNotEmpty) ...[
                _SafetyBanner(
                  color: AppColors.red,
                  icon: Icons.warning_rounded,
                  title: AppStrings.profileAllergyFlag,
                  content: allergies,
                  onTap: () =>
                      context.push('/children/$childId/medical-history'),
                ),
                const SizedBox(height: AppSpacing.sm),
              ],
              if (conditions.isNotEmpty) ...[
                _SafetyBanner(
                  color: AppColors.amber,
                  icon: Icons.monitor_heart_outlined,
                  title: AppStrings.profileConditionsFlag,
                  content: conditions,
                  onTap: () =>
                      context.push('/children/$childId/medical-history'),
                ),
                const SizedBox(height: AppSpacing.sm),
              ],

              // 3 ── Today's documentation status ─────────────────────────
              if (completion.status != CompletionStatus.complete) ...[
                _IncompleteDocsAlert(completion: completion),
                const SizedBox(height: AppSpacing.sm),
              ],
              ShiftProgressBar(childId: childId),
              const SizedBox(height: AppSpacing.xl),

              // 4 ── Care record, grouped ─────────────────────────────────
              _ModuleSection(
                title: AppStrings.profileSectionDailyCare,
                modules: _dailyCare,
                childId: childId,
              ),
              const SizedBox(height: AppSpacing.xl),
              _ModuleSection(
                title: AppStrings.profileSectionHealthSafety,
                modules: _healthSafety,
                childId: childId,
              ),
              const SizedBox(height: AppSpacing.xl),
              _ModuleSection(
                title: AppStrings.profileSectionPlanning,
                modules: _planning,
                childId: childId,
              ),
            ],
          ),
        );
      },
    );
  }
}

// ── Identity header ───────────────────────────────────────────────────────────

class _IdentityHeader extends StatelessWidget {
  const _IdentityHeader({required this.child});

  final Child child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final accent = AppColors.avatarColorFor(child.id);
    final dob = DateTime.tryParse(child.dateOfBirth);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 34,
          backgroundColor: accent.withAlpha(38),
          backgroundImage: child.photoUrl != null
              ? NetworkImage(child.photoUrl!)
              : null,
          child: child.photoUrl == null
              ? Text(child.initials, style: AppTextStyles.h1(accent))
              : null,
        ),
        const SizedBox(width: AppSpacing.lg),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                child.name,
                style: AppTextStyles.h1(colors.onSurface),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: [
                  _MetaChip(
                    label: '${AppStrings.profileAgeLabel} ${child.ageYears}',
                  ),
                  _MetaChip(
                    label: '${AppStrings.profileRoomLabel} ${child.room}',
                  ),
                  if (dob != null)
                    _MetaChip(
                      label:
                          '${AppStrings.profileDobLabel} ${_dobFormat.format(dob)}',
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Small outlined pill for an identity meta value (age, room, DOB).
class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Text(label, style: AppTextStyles.small(colors.onSurfaceVariant)),
    );
  }
}

// ── Safety banner (allergies / conditions) ────────────────────────────────────

/// A loud, glanceable safety flag. Deliberately not muted — these are the most
/// important things on the screen and must read at arm's length, in both
/// themes. Tapping opens the full Medical History record.
class _SafetyBanner extends StatelessWidget {
  const _SafetyBanner({
    required this.color,
    required this.icon,
    required this.title,
    required this.content,
    this.onTap,
  });

  final Color color;
  final IconData icon;
  final String title;
  final String content;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final fill = color.withAlpha(isDark ? 48 : 26);

    return Semantics(
      button: onTap != null,
      child: Material(
        color: fill,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.card),
              border: Border.all(color: color.withAlpha(150), width: 1.5),
            ),
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: color, size: 22),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.label(
                          color,
                        ).copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        content,
                        style: AppTextStyles.body(
                          colors.onSurface,
                        ).copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                if (onTap != null) ...[
                  const SizedBox(width: AppSpacing.xs),
                  Icon(Icons.chevron_right, color: color, size: 18),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Incomplete-documentation alert ────────────────────────────────────────────

class _IncompleteDocsAlert extends StatelessWidget {
  const _IncompleteDocsAlert({required this.completion});

  final ShiftCompletion completion;

  @override
  Widget build(BuildContext context) {
    final incomplete = completion.sections.where((s) => !s.complete).toList();
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
                Text(
                  AppStrings.alertNotRecordedThisShift,
                  style: AppTextStyles.label(color),
                ),
                Text(sectionNames, style: AppTextStyles.small(color)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Care-module section + card ────────────────────────────────────────────────

class _ModuleSection extends StatelessWidget {
  const _ModuleSection({
    required this.title,
    required this.modules,
    required this.childId,
  });

  final String title;
  final List<_Module> modules;
  final String childId;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.label(colors.onSurfaceVariant)),
        const SizedBox(height: AppSpacing.sm),
        for (var i = 0; i < modules.length; i++) ...[
          if (i > 0) const SizedBox(height: AppSpacing.xs),
          _ModuleCard(
            module: modules[i],
            onTap: () => context.push('/children/$childId/${modules[i].route}'),
          ),
        ],
      ],
    );
  }
}

class _ModuleCard extends StatelessWidget {
  const _ModuleCard({required this.module, this.onTap});

  final _Module module;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Semantics(
      button: true,
      label: module.label,
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
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        module.color.withAlpha(46),
                        module.color.withAlpha(28),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(AppRadius.button),
                  ),
                  child: Icon(module.icon, color: module.color, size: 22),
                ),
                const SizedBox(width: AppSpacing.lg),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        module.label,
                        style: AppTextStyles.h3(colors.onSurface),
                      ),
                      Text(
                        module.description,
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
