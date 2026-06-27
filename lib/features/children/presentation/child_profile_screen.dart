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

final _dobFormat = DateFormat('d MMM yyyy', 'en_GB');
final _todayFormat = DateFormat('EEE d MMM', 'en_GB');

/// One care-record entry on the profile.
class _Record {
  const _Record(this.icon, this.label, this.route);
  final IconData icon;
  final String label;
  final String route;
}

/// Child profile — "operational calm": neutral chrome, one serif identity
/// moment, loud safety signals, a glanceable status panel, and the records as
/// a single refined list. Colour is reserved for safety and compliance.
class ChildProfileScreen extends ConsumerWidget {
  const ChildProfileScreen({super.key, required this.childId});

  final String childId;

  static const _records = [
    _Record(
      Icons.edit_note_outlined,
      AppStrings.moduleDailyNotes,
      'daily-notes',
    ),
    _Record(
      Icons.medication_outlined,
      AppStrings.moduleMedication,
      'medication',
    ),
    _Record(Icons.show_chart, AppStrings.moduleBehaviour, 'behaviour'),
    _Record(Icons.report_outlined, AppStrings.moduleIncidents, 'incidents'),
    _Record(
      Icons.health_and_safety_outlined,
      AppStrings.moduleMedicalHistory,
      'medical-history',
    ),
    _Record(
      Icons.description_outlined,
      AppStrings.moduleCarePlans,
      'care-plans',
    ),
    _Record(Icons.stairs_outlined, AppStrings.moduleSmartSteps, 'smart-steps'),
    _Record(Icons.thermostat_outlined, AppStrings.bathTempModule, 'bath-temp'),
    _Record(
      Icons.restaurant_outlined,
      AppStrings.moduleFoodDiary,
      'food-diary',
    ),
    _Record(Icons.bedtime_outlined, AppStrings.moduleSleepDiary, 'sleep-diary'),
    _Record(Icons.star_outline, AppStrings.moduleActivities, 'activities'),
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
        appBar: AppBar(),
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
          // Minimal bar — the name is the serif hero in the body.
          appBar: AppBar(toolbarHeight: 48),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              0,
              AppSpacing.lg,
              AppSpacing.xxl,
            ),
            children: [
              _Hero(child: child),
              const SizedBox(height: AppSpacing.lg),

              if (allergies.isNotEmpty) ...[
                _SafetyFlag(
                  title: AppStrings.profileAllergyFlag,
                  body: allergies,
                  critical: true,
                  onTap: () =>
                      context.push('/children/$childId/medical-history'),
                ),
                const SizedBox(height: AppSpacing.sm),
              ],
              if (conditions.isNotEmpty) ...[
                _SafetyFlag(
                  title: AppStrings.profileConditionsFlag,
                  body: conditions,
                  critical: false,
                  onTap: () =>
                      context.push('/children/$childId/medical-history'),
                ),
                const SizedBox(height: AppSpacing.sm),
              ],

              const SizedBox(height: AppSpacing.xs),
              _TodayPanel(completion: completion),
              const SizedBox(height: AppSpacing.xl),

              Padding(
                padding: const EdgeInsets.only(
                  left: AppSpacing.xs,
                  bottom: AppSpacing.sm,
                ),
                child: Text(
                  AppStrings.careRecordSection,
                  style: AppTextStyles.label(colors.onSurfaceVariant),
                ),
              ),
              _RecordsList(records: _records, childId: childId),
            ],
          ),
        );
      },
    );
  }
}

// ── Identity hero ─────────────────────────────────────────────────────────────

class _Hero extends StatelessWidget {
  const _Hero({required this.child});

  final Child child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final accent = AppColors.avatarColorFor(child.id);
    final dob = DateTime.tryParse(child.dateOfBirth);
    final meta = [
      '${AppStrings.profileAgeLabel} ${child.ageYears}',
      '${AppStrings.profileRoomLabel} ${child.room}',
      if (dob != null)
        '${AppStrings.profileDobLabel} ${_dobFormat.format(dob)}',
    ].join('  ·  ');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: accent.withAlpha(28),
          backgroundImage: child.photoUrl != null
              ? NetworkImage(child.photoUrl!)
              : null,
          child: child.photoUrl == null
              ? Text(
                  child.initials,
                  style: AppTextStyles.h2(accent).copyWith(letterSpacing: 0.5),
                )
              : null,
        ),
        const SizedBox(width: AppSpacing.lg),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                child.name,
                style: AppTextStyles.display(
                  colors.onSurface,
                ).copyWith(fontSize: 26, height: 1.1),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(meta, style: AppTextStyles.small(colors.onSurfaceVariant)),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Safety flag ───────────────────────────────────────────────────────────────

/// The one place the calm breaks on purpose. [critical] = solid red (allergy);
/// otherwise a tinted accent-bar panel (condition). Tap opens Medical History.
class _SafetyFlag extends StatelessWidget {
  const _SafetyFlag({
    required this.title,
    required this.body,
    required this.critical,
    this.onTap,
  });

  final String title;
  final String body;
  final bool critical;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (critical) {
      return _tappable(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(AppRadius.card),
          ),
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.white.withAlpha(56),
                  borderRadius: BorderRadius.circular(AppRadius.button),
                ),
                child: const Icon(
                  Icons.priority_high_rounded,
                  color: AppColors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.label(
                        AppColors.white,
                      ).copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      body,
                      style: AppTextStyles.body(
                        AppColors.white,
                      ).copyWith(fontWeight: FontWeight.w600, height: 1.4),
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
      );
    }

    return _tappable(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.amber.withAlpha(isDark ? 36 : 22),
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: const Border(
            left: BorderSide(color: AppColors.amber, width: 4),
          ),
        ),
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.label(
                AppColors.amber,
              ).copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              body,
              style: AppTextStyles.small(
                colors.onSurface,
              ).copyWith(height: 1.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tappable({required Widget child}) {
    if (onTap == null) return child;
    return Semantics(
      button: true,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: child,
        ),
      ),
    );
  }
}

// ── Today panel ───────────────────────────────────────────────────────────────

class _TodayPanel extends StatelessWidget {
  const _TodayPanel({required this.completion});

  final ShiftCompletion completion;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final done = completion.completedCount;
    final total = completion.totalCount;
    final remaining = total - done;
    final allDone = completion.status == CompletionStatus.complete;
    final remainingColor = completion.status == CompletionStatus.none
        ? AppColors.red
        : AppColors.amber;
    final outstanding = completion.sections
        .where((s) => !s.complete)
        .map((s) => s.label)
        .join(' · ');

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
          const SizedBox(height: AppSpacing.md),
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
              if (allDone)
                const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.green,
                  size: 22,
                )
              else
                _Pill(
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
                    child: Container(height: 6, color: AppColors.green),
                  ),
                if (remaining > 0)
                  Expanded(
                    flex: remaining,
                    child: Container(height: 6, color: remainingColor),
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

class _Pill extends StatelessWidget {
  const _Pill({required this.label, required this.color});

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

// ── Records (one inset list) ──────────────────────────────────────────────────

class _RecordsList extends StatelessWidget {
  const _RecordsList({required this.records, required this.childId});

  final List<_Record> records;
  final String childId;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (var i = 0; i < records.length; i++) ...[
            if (i > 0)
              Divider(
                height: 1,
                thickness: 1,
                indent: AppSpacing.lg + 22 + AppSpacing.lg,
                color: colors.outlineVariant,
              ),
            _RecordRow(record: records[i], childId: childId),
          ],
        ],
      ),
    );
  }
}

class _RecordRow extends StatelessWidget {
  const _RecordRow({required this.record, required this.childId});

  final _Record record;
  final String childId;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Semantics(
      button: true,
      label: record.label,
      child: InkWell(
        onTap: () => context.push('/children/$childId/${record.route}'),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md + 2,
          ),
          child: Row(
            children: [
              Icon(record.icon, size: 22, color: colors.onSurfaceVariant),
              const SizedBox(width: AppSpacing.lg),
              Expanded(
                child: Text(
                  record.label,
                  style: AppTextStyles.body(
                    colors.onSurface,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 18,
                color: colors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
