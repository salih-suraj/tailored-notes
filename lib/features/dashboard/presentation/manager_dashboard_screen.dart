import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/routing/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/behaviour/domain/behaviour_incident.dart';
import '../../../features/behaviour/presentation/providers/behaviour_provider.dart';
import '../../../shared/models/shift_type.dart';
import '../../../features/children/domain/child.dart';
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../features/incidents/domain/incident_report.dart';
import '../../../features/incidents/presentation/providers/incidents_provider.dart';
import '../../../features/medication/domain/med_administration.dart';
import '../../../features/medication/presentation/providers/medication_provider.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/models/shift_completion.dart';
import '../../../shared/providers/shift_completion_provider.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';

/// Home-wide real-time overview for managers.
/// Aggregates today's incidents, behaviour, documentation, and medication
/// status across all children and surfaces critical alerts at the top.
class ManagerDashboardScreen extends ConsumerWidget {
  const ManagerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenAsync = ref.watch(childrenProvider);
    final shift = ShiftType.forTime(DateTime.now());
    final now = DateTime.now();
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.dashboardTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.insights_outlined),
            tooltip: AppStrings.dashboardViewBehaviourPatterns,
            onPressed: () => context.push(AppRoutes.behaviourPatterns),
          ),
          IconButton(
            icon: const Icon(Icons.fact_check_outlined),
            tooltip: AppStrings.managerInspectorAccessOpenTooltip,
            onPressed: () => context.push(AppRoutes.managerInspectorAccess),
          ),
          IconButton(
            icon: const Icon(Icons.family_restroom_outlined),
            tooltip: AppStrings.managerParentAccessOpenTooltip,
            onPressed: () => context.push(AppRoutes.managerParentAccess),
          ),
        ],
      ),
      body: childrenAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          message: e.toString(),
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

          // Build a lookup map for child names used in alert items.
          final childById = {for (final c in children) c.id: c};

          // Aggregate across all children.
          final allTodayIncidents = <IncidentReport>[];
          final allTodayBehaviour = <BehaviourIncident>[];
          final completions = <String, ShiftCompletion>{};
          final medRefusals = <_MedRefusalItem>[];

          for (final child in children) {
            final incidents =
                ref.watch(incidentReportsProvider(child.id)).valueOrNull ?? [];
            final behaviour =
                ref.watch(behaviourIncidentsProvider(child.id)).valueOrNull ?? [];
            final admins =
                ref.watch(todayAdminsProvider(child.id)).valueOrNull ?? [];
            final completion = ref.watch(shiftCompletionProvider(child.id));

            allTodayIncidents.addAll(
                incidents.where((i) => _isSameDay(i.occurredAt.toLocal(), now)));
            allTodayBehaviour.addAll(
                behaviour.where((b) => _isSameDay(b.occurredAt.toLocal(), now)));
            completions[child.id] = completion;

            for (final admin in admins) {
              if (admin.outcome == AdminOutcome.refused) {
                medRefusals.add(_MedRefusalItem(child: child, admin: admin));
              }
            }
          }

          // Derive alert lists.
          final safeguardingItems = allTodayIncidents
              .where((i) =>
                  i.incidentType == IncidentType.safeguarding ||
                  i.incidentType == IncidentType.missingPerson)
              .toList();

          final criticalItems = allTodayIncidents
              .where((i) =>
                  i.severity == IncidentSeverity.critical ||
                  i.severity == IncidentSeverity.high)
              // Avoid double-listing safeguarding as both critical and safeguarding.
              .where((i) =>
                  i.incidentType != IncidentType.safeguarding &&
                  i.incidentType != IncidentType.missingPerson)
              .toList();

          final physicalItems =
              allTodayBehaviour.where((b) => b.physicalIntervention).toList();

          final completeCount = completions.values
              .where((c) => c.status == CompletionStatus.complete)
              .length;
          final needsAttention = children
              .where((c) =>
                  completions[c.id]!.status != CompletionStatus.complete)
              .toList();

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              _HomeStatsCard(
                shift: shift,
                now: now,
                completeCount: completeCount,
                totalCount: children.length,
              ),
              const SizedBox(height: AppSpacing.lg),

              // ── Safeguarding (highest priority) ─────────────────────────
              if (safeguardingItems.isNotEmpty) ...[
                _AlertCard(
                  icon: Icons.shield_outlined,
                  title: AppStrings.dashboardAlertSafeguarding,
                  color: AppColors.red,
                  items: safeguardingItems
                      .map((i) =>
                          '${childById[i.childId]?.name ?? ''} · '
                          '${i.incidentType.displayName} · ${i.title}')
                      .toList(),
                ),
                const SizedBox(height: AppSpacing.md),
              ],

              // ── Critical / high severity incidents ───────────────────────
              if (criticalItems.isNotEmpty) ...[
                _AlertCard(
                  icon: Icons.priority_high_rounded,
                  title: AppStrings.dashboardAlertCritical,
                  color: AppColors.red,
                  items: criticalItems
                      .map((i) =>
                          '${childById[i.childId]?.name ?? ''} · '
                          '${i.severity.displayName} · ${i.incidentType.displayName}')
                      .toList(),
                ),
                const SizedBox(height: AppSpacing.md),
              ],

              // ── Physical interventions ───────────────────────────────────
              if (physicalItems.isNotEmpty) ...[
                _AlertCard(
                  icon: Icons.warning_amber_rounded,
                  title: AppStrings.dashboardAlertIntervention,
                  color: AppColors.red,
                  items: physicalItems
                      .map((b) =>
                          '${childById[b.childId]?.name ?? ''} · '
                          '${b.severity.displayName}'
                          '${b.injuryOccurred ? ' · injury recorded' : ''}')
                      .toList(),
                ),
                const SizedBox(height: AppSpacing.md),
              ],

              // ── Medication refusals ──────────────────────────────────────
              if (medRefusals.isNotEmpty) ...[
                _AlertCard(
                  icon: Icons.medication_outlined,
                  title: AppStrings.dashboardAlertMedRefusal,
                  color: AppColors.amber,
                  items: medRefusals
                      .map((r) =>
                          '${r.child.name} · ${r.admin.medicationName}')
                      .toList(),
                ),
                const SizedBox(height: AppSpacing.md),
              ],

              // ── Documentation completion ─────────────────────────────────
              _DocumentationCard(
                completeCount: completeCount,
                totalCount: children.length,
                needsAttention: needsAttention,
                onTap: () => context.push(AppRoutes.handover),
              ),
              const SizedBox(height: AppSpacing.md),

              // ── Incidents today ──────────────────────────────────────────
              _IncidentsSummaryCard(incidents: allTodayIncidents),
              const SizedBox(height: AppSpacing.md),

              // ── Behaviour today ──────────────────────────────────────────
              _BehaviourSummaryCard(behaviour: allTodayBehaviour),
              const SizedBox(height: 80),
            ],
          );
        },
      ),
    );
  }
}

// ── Internal data holder ──────────────────────────────────────────────────────

class _MedRefusalItem {
  const _MedRefusalItem({required this.child, required this.admin});
  final Child child;
  final MedAdministration admin;
}

// ── Home stats card ───────────────────────────────────────────────────────────

class _HomeStatsCard extends StatelessWidget {
  const _HomeStatsCard({
    required this.shift,
    required this.now,
    required this.completeCount,
    required this.totalCount,
  });

  final ShiftType shift;
  final DateTime now;
  final int completeCount;
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final allDone = completeCount == totalCount;
    final barColor = allDone ? AppColors.green : AppColors.amber;

    return Material(
      color: AppColors.teal400.withAlpha(20),
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${shift.displayName.toUpperCase()} SHIFT',
                        style: AppTextStyles.label(AppColors.teal400),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        DateFormat('EEEE d MMMM yyyy', 'en_GB').format(now),
                        style: AppTextStyles.h3(colors.onSurface),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$completeCount/$totalCount',
                      style: AppTextStyles.h1(barColor),
                    ),
                    Text(
                      AppStrings.dashboardDocumented,
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                    ),
                  ],
                ),
              ],
            ),
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
          ],
        ),
      ),
    );
  }
}

// ── Alert card ────────────────────────────────────────────────────────────────

class _AlertCard extends StatelessWidget {
  const _AlertCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.items,
  });

  final IconData icon;
  final String title;
  final Color color;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: color.withAlpha(20),
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 16, color: color),
                const SizedBox(width: AppSpacing.xs),
                Expanded(
                    child: Text(title, style: AppTextStyles.label(color))),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm, vertical: 2),
                  decoration: BoxDecoration(
                    color: color.withAlpha(40),
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                  child: Text('${items.length}',
                      style: AppTextStyles.small(color)),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xs),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration:
                            BoxDecoration(color: color, shape: BoxShape.circle),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                        child: Text(item,
                            style: AppTextStyles.small(colors.onSurface))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Documentation card ────────────────────────────────────────────────────────

class _DocumentationCard extends StatelessWidget {
  const _DocumentationCard({
    required this.completeCount,
    required this.totalCount,
    required this.needsAttention,
    required this.onTap,
  });

  final int completeCount;
  final int totalCount;
  final List<Child> needsAttention;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final allDone = needsAttention.isEmpty;

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
                  Icon(Icons.assignment_outlined,
                      size: 16, color: colors.onSurfaceVariant),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(AppStrings.dashboardDocumentation,
                        style: AppTextStyles.label(colors.onSurface)),
                  ),
                  Icon(Icons.chevron_right,
                      size: 16, color: colors.onSurfaceVariant),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              if (allDone)
                Text(AppStrings.dashboardAllDocumented,
                    style: AppTextStyles.small(AppColors.green))
              else ...[
                Text(
                  '${needsAttention.length} '
                  '${needsAttention.length == 1 ? 'child' : 'children'} outstanding',
                  style: AppTextStyles.small(AppColors.amber),
                ),
                const SizedBox(height: AppSpacing.xs),
                Wrap(
                  spacing: AppSpacing.xs,
                  runSpacing: AppSpacing.xs,
                  children: [
                    ...needsAttention.take(6).map((c) => _NameChip(c.name)),
                    if (needsAttention.length > 6)
                      _NameChip('+${needsAttention.length - 6} more'),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ── Incidents summary card ────────────────────────────────────────────────────

class _IncidentsSummaryCard extends StatelessWidget {
  const _IncidentsSummaryCard({required this.incidents});

  final List<IncidentReport> incidents;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    if (incidents.isEmpty) {
      return const _EmptySummaryRow(
        icon: Icons.report_outlined,
        title: AppStrings.dashboardIncidents,
        emptyText: AppStrings.dashboardNone,
      );
    }

    final bySeverity = <IncidentSeverity, int>{};
    for (final i in incidents) {
      bySeverity[i.severity] = (bySeverity[i.severity] ?? 0) + 1;
    }

    final highest = incidents
        .map((i) => i.severity)
        .reduce((a, b) => a.index > b.index ? a : b);
    final headerColor = switch (highest) {
      IncidentSeverity.critical || IncidentSeverity.high => AppColors.red,
      IncidentSeverity.medium => AppColors.amber,
      IncidentSeverity.low => colors.onSurface,
    };

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
                Icon(Icons.report_outlined,
                    size: 16, color: colors.onSurfaceVariant),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(AppStrings.dashboardIncidents,
                      style: AppTextStyles.label(colors.onSurface)),
                ),
                Text('${incidents.length} today',
                    style: AppTextStyles.small(headerColor)),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.xs,
              children: IncidentSeverity.values.reversed
                  .where((s) => (bySeverity[s] ?? 0) > 0)
                  .map((s) {
                final c = switch (s) {
                  IncidentSeverity.critical || IncidentSeverity.high =>
                    AppColors.red,
                  IncidentSeverity.medium => AppColors.amber,
                  IncidentSeverity.low => colors.onSurface,
                };
                return _StatChip('${bySeverity[s]} ${s.displayName}', c);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Behaviour summary card ────────────────────────────────────────────────────

class _BehaviourSummaryCard extends StatelessWidget {
  const _BehaviourSummaryCard({required this.behaviour});

  final List<BehaviourIncident> behaviour;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    if (behaviour.isEmpty) {
      return const _EmptySummaryRow(
        icon: Icons.psychology_outlined,
        title: AppStrings.dashboardBehaviour,
        emptyText: AppStrings.dashboardNone,
      );
    }

    final interventions =
        behaviour.where((b) => b.physicalIntervention).length;
    final highest = behaviour
        .map((b) => b.severity)
        .reduce((a, b) => a.index > b.index ? a : b);
    final headerColor = switch (highest) {
      BehaviourSeverity.severe => AppColors.red,
      BehaviourSeverity.moderate => AppColors.amber,
      BehaviourSeverity.mild => colors.onSurface,
    };

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
                Icon(Icons.psychology_outlined,
                    size: 16, color: colors.onSurfaceVariant),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(AppStrings.dashboardBehaviour,
                      style: AppTextStyles.label(colors.onSurface)),
                ),
                Text('${behaviour.length} today',
                    style: AppTextStyles.small(headerColor)),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.xs,
              children: [
                _StatChip(
                  '${behaviour.length} '
                  '${behaviour.length == 1 ? 'incident' : 'incidents'}',
                  headerColor,
                ),
                if (interventions > 0)
                  _StatChip(
                    '$interventions '
                    '${interventions == 1 ? 'intervention' : 'interventions'}',
                    AppColors.red,
                  ),
                _StatChip('Highest: ${highest.displayName}', headerColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── Helper widgets ────────────────────────────────────────────────────────────

class _EmptySummaryRow extends StatelessWidget {
  const _EmptySummaryRow({
    required this.icon,
    required this.title,
    required this.emptyText,
  });

  final IconData icon;
  final String title;
  final String emptyText;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            Icon(icon, size: 16, color: colors.onSurfaceVariant),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
                child: Text(title,
                    style: AppTextStyles.label(colors.onSurface))),
            Text(emptyText,
                style: AppTextStyles.small(colors.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}

class _NameChip extends StatelessWidget {
  const _NameChip(this.name);
  final String name;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(name, style: AppTextStyles.small(colors.onSurface)),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip(this.label, this.color);
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: color.withAlpha(80)),
      ),
      child: Text(label, style: AppTextStyles.small(color)),
    );
  }
}

bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
