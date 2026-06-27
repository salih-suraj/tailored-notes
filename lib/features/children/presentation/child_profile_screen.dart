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
import '../../medical_history/presentation/providers/medical_history_provider.dart';
import '../domain/child.dart';
import 'providers/children_provider.dart';

final _dobFormat = DateFormat('dd·MM·yyyy', 'en_GB');
final _todayFormat = DateFormat('EEE d MMM', 'en_GB');

/// One care-module entry on the profile grid.
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
  final String route;
}

/// Overview of a single child — identity, safety flags, today's documentation
/// status, then a grid of entry points into each care record.
class ChildProfileScreen extends ConsumerWidget {
  const ChildProfileScreen({super.key, required this.childId});

  final String childId;

  // Flat grid order — safety-relevant modules first, daily records after.
  static const _modules = [
    _Module(
      icon: Icons.medication_outlined,
      label: AppStrings.moduleMedication,
      description: AppStrings.moduleMedicationDesc,
      color: AppColors.moduleMedication,
      route: 'medication',
    ),
    _Module(
      icon: Icons.thermostat_outlined,
      label: AppStrings.bathTempModule,
      description: AppStrings.bathTempModuleDesc,
      color: AppColors.moduleBathTemp,
      route: 'bath-temp',
    ),
    _Module(
      icon: Icons.report_outlined,
      label: AppStrings.moduleIncidents,
      description: AppStrings.moduleIncidentsDesc,
      color: AppColors.moduleIncidents,
      route: 'incidents',
    ),
    _Module(
      icon: Icons.description_outlined,
      label: AppStrings.moduleCarePlans,
      description: AppStrings.moduleCarePlansDesc,
      color: AppColors.moduleCarePlans,
      route: 'care-plans',
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
      icon: Icons.star_outline,
      label: AppStrings.moduleActivities,
      description: AppStrings.moduleActivitiesDesc,
      color: AppColors.moduleActivities,
      route: 'activities',
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
    final medical = ref.watch(medicalProfileProvider(childId)).valueOrNull;
    final colors = Theme.of(context).colorScheme;

    return childrenAsync.when(
      loading: () => const Scaffold(body: LoadingSkeleton()),
      error: (error, _) => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.childProfile)),
        body: ErrorView(
          error: error,
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
              _IdentityCard(child: child),
              const SizedBox(height: AppSpacing.md),

              if (allergies.isNotEmpty) ...[
                _AllergyBanner(
                  text: allergies,
                  onTap: () =>
                      context.push('/children/$childId/medical-history'),
                ),
                const SizedBox(height: AppSpacing.sm),
              ],
              if (conditions.isNotEmpty) ...[
                _ConditionBanner(
                  text: conditions,
                  onTap: () =>
                      context.push('/children/$childId/medical-history'),
                ),
                const SizedBox(height: AppSpacing.sm),
              ],

              _DocumentationCard(completion: completion),
              const SizedBox(height: AppSpacing.lg),

              _ModuleGrid(modules: _modules, childId: childId),
            ],
          ),
        );
      },
    );
  }
}

// ── Identity ──────────────────────────────────────────────────────────────────

class _IdentityCard extends StatelessWidget {
  const _IdentityCard({required this.child});

  final Child child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final accent = AppColors.avatarColorFor(child.id);
    final dob = DateTime.tryParse(child.dateOfBirth);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: accent.withAlpha(38),
            backgroundImage: child.photoUrl != null
                ? NetworkImage(child.photoUrl!)
                : null,
            child: child.photoUrl == null
                ? Text(child.initials, style: AppTextStyles.h2(accent))
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
                const SizedBox(height: AppSpacing.xs),
                Text(
                  dob != null
                      ? '${AppStrings.profileAgeLabel} ${child.ageYears}  ·  '
                            '${AppStrings.profileDobLabel} ${_dobFormat.format(dob)}'
                      : '${AppStrings.profileAgeLabel} ${child.ageYears}',
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                ),
                Text(
                  '${AppStrings.profileRoomLabel} ${child.room}',
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Safety banners ────────────────────────────────────────────────────────────

/// Solid-red, white-on-red allergy banner — the loudest element on the screen.
class _AllergyBanner extends StatelessWidget {
  const _AllergyBanner({required this.text, this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: onTap != null,
      child: Material(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.white.withAlpha(60),
                    borderRadius: BorderRadius.circular(AppRadius.button),
                  ),
                  child: const Icon(
                    Icons.priority_high_rounded,
                    color: AppColors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.profileAllergyFlag,
                        style: AppTextStyles.label(
                          AppColors.white,
                        ).copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        text,
                        style: AppTextStyles.body(
                          AppColors.white,
                        ).copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                if (onTap != null)
                  const Icon(
                    Icons.chevron_right,
                    color: AppColors.white,
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

/// Tinted condition banner with a left accent bar (serious, but below the
/// solid allergy banner in the loudness ladder).
class _ConditionBanner extends StatelessWidget {
  const _ConditionBanner({required this.text, this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    const color = AppColors.red;

    return Semantics(
      button: onTap != null,
      child: Material(
        color: color.withAlpha(isDark ? 38 : 20),
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.card),
              border: const Border(left: BorderSide(color: color, width: 4)),
            ),
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.profileConditionsFlag,
                  style: AppTextStyles.label(
                    color,
                  ).copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(text, style: AppTextStyles.small(colors.onSurface)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Documentation summary ─────────────────────────────────────────────────────

class _DocumentationCard extends StatelessWidget {
  const _DocumentationCard({required this.completion});

  final ShiftCompletion completion;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final done = completion.completedCount;
    final total = completion.totalCount;
    final remaining = total - done;
    final outstanding = completion.sections
        .where((s) => !s.complete)
        .map((s) => s.label)
        .join(' · ');
    final remainingColor = completion.status == CompletionStatus.none
        ? AppColors.red
        : AppColors.amber;

    return Container(
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
              Expanded(
                child: Text(
                  AppStrings.profileDocHeader,
                  style: AppTextStyles.label(colors.onSurfaceVariant),
                ),
              ),
              Text(
                _todayFormat.format(DateTime.now()),
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('$done', style: AppTextStyles.display(colors.onSurface)),
              Text('/$total', style: AppTextStyles.h2(colors.onSurfaceVariant)),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  AppStrings.profileLogsComplete,
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                ),
              ),
              if (remaining > 0)
                _CountPill(
                  label: '$remaining ${AppStrings.profileOutstanding}',
                  color: remainingColor,
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            child: Row(
              children: [
                if (done > 0)
                  Expanded(
                    flex: done,
                    child: Container(height: 8, color: AppColors.green),
                  ),
                if (remaining > 0)
                  Expanded(
                    flex: remaining,
                    child: Container(height: 8, color: remainingColor),
                  ),
              ],
            ),
          ),
          if (outstanding.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              '${AppStrings.profileOutstandingPrefix}: $outstanding',
              style: AppTextStyles.small(colors.onSurfaceVariant),
            ),
          ],
        ],
      ),
    );
  }
}

class _CountPill extends StatelessWidget {
  const _CountPill({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        label,
        style: AppTextStyles.label(color).copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}

// ── Module grid ───────────────────────────────────────────────────────────────

class _ModuleGrid extends StatelessWidget {
  const _ModuleGrid({required this.modules, required this.childId});

  final List<_Module> modules;
  final String childId;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < modules.length; i += 2) {
      final left = modules[i];
      final right = i + 1 < modules.length ? modules[i + 1] : null;
      if (i > 0) rows.add(const SizedBox(height: AppSpacing.sm));
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _GridCard(module: left, childId: childId),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: right == null
                    ? const SizedBox()
                    : _GridCard(module: right, childId: childId),
              ),
            ],
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}

class _GridCard extends StatelessWidget {
  const _GridCard({required this.module, required this.childId});

  final _Module module;
  final String childId;

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
          onTap: () => context.push('/children/$childId/${module.route}'),
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: module.color.withAlpha(36),
                        borderRadius: BorderRadius.circular(AppRadius.button),
                      ),
                      child: Icon(module.icon, color: module.color, size: 18),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.chevron_right,
                      color: colors.onSurfaceVariant,
                      size: 18,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  module.label,
                  style: AppTextStyles.h3(colors.onSurface),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  module.description,
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
