import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/behaviour/domain/behaviour_incident.dart';
import '../../../features/behaviour/presentation/providers/behaviour_provider.dart';
import '../../../features/children/domain/child.dart';
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/models/shift_type.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';

/// Behaviour Pattern Tracking Dashboard — visual analytics for managers
/// and team leaders. Shows trends over time, shift patterns, severity
/// breakdown, per-child counts, and common antecedents.
class BehaviourPatternScreen extends ConsumerStatefulWidget {
  const BehaviourPatternScreen({super.key});

  @override
  ConsumerState<BehaviourPatternScreen> createState() =>
      _BehaviourPatternScreenState();
}

class _BehaviourPatternScreenState
    extends ConsumerState<BehaviourPatternScreen> {
  // Ephemeral filter state — StatefulWidget is appropriate here.
  int _days = 30;
  String? _selectedChildId; // null = all children

  @override
  Widget build(BuildContext context) {
    final childrenAsync = ref.watch(childrenProvider);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.behaviourPatternsTitle)),
      body: childrenAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(childrenProvider),
        ),
        data: (children) {
          if (children.isEmpty) {
            return Center(
              child: Text(AppStrings.noChildren,
                  style: AppTextStyles.body(colors.onSurfaceVariant)),
            );
          }

          // Gather incidents for the selected child(ren).
          final targetChildren = _selectedChildId == null
              ? children
              : children.where((c) => c.id == _selectedChildId).toList();

          final cutoff =
              DateTime.now().subtract(Duration(days: _days)).toLocal();

          final allIncidents = <BehaviourIncident>[];
          for (final child in targetChildren) {
            final raw =
                ref.watch(behaviourIncidentsProvider(child.id)).valueOrNull ??
                    [];
            allIncidents.addAll(
                raw.where((b) => b.occurredAt.toLocal().isAfter(cutoff)));
          }

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              // ── Filters ──────────────────────────────────────────────────
              _FiltersRow(
                days: _days,
                children: children,
                selectedChildId: _selectedChildId,
                onDaysChanged: (d) => setState(() => _days = d),
                onChildChanged: (id) => setState(() => _selectedChildId = id),
              ),
              const SizedBox(height: AppSpacing.lg),

              // ── Empty state ───────────────────────────────────────────────
              if (allIncidents.isEmpty)
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppSpacing.xl),
                    child: Text(
                      AppStrings.behaviourPatternsNoData,
                      style: AppTextStyles.body(colors.onSurfaceVariant),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              else ...[
                // ── Summary stats ─────────────────────────────────────────
                _SummaryRow(incidents: allIncidents),
                const SizedBox(height: AppSpacing.lg),

                // ── Daily trend chart ─────────────────────────────────────
                _TrendCard(incidents: allIncidents, days: _days),
                const SizedBox(height: AppSpacing.md),

                // ── Shift breakdown ────────────────────────────────────────
                _ShiftBreakdownCard(incidents: allIncidents),
                const SizedBox(height: AppSpacing.md),

                // ── Severity breakdown ─────────────────────────────────────
                _SeverityBreakdownCard(incidents: allIncidents),
                const SizedBox(height: AppSpacing.md),

                // ── Per-child breakdown (only when "all children") ─────────
                if (_selectedChildId == null && children.length > 1) ...[
                  _ChildBreakdownCard(
                      incidents: allIncidents, children: children),
                  const SizedBox(height: AppSpacing.md),
                ],

                // ── Common antecedents ─────────────────────────────────────
                _AntecedentsCard(incidents: allIncidents),
              ],
              const SizedBox(height: 80),
            ],
          );
        },
      ),
    );
  }
}

// ── Filters row ───────────────────────────────────────────────────────────────

class _FiltersRow extends StatelessWidget {
  const _FiltersRow({
    required this.days,
    required this.children,
    required this.selectedChildId,
    required this.onDaysChanged,
    required this.onChildChanged,
  });

  final int days;
  final List<Child> children;
  final String? selectedChildId;
  final ValueChanged<int> onDaysChanged;
  final ValueChanged<String?> onChildChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Period chips
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            for (final d in [7, 14, 30])
              ChoiceChip(
                label: Text(_daysLabel(d)),
                selected: days == d,
                onSelected: (_) => onDaysChanged(d),
                selectedColor: AppColors.teal50,
                checkmarkColor: AppColors.teal600,
              ),
          ],
        ),
        if (children.length > 1) ...[
          const SizedBox(height: AppSpacing.sm),
          // Child filter dropdown
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: colors.outline),
              borderRadius: BorderRadius.circular(AppRadius.input),
            ),
            child: DropdownButton<String?>(
              value: selectedChildId,
              isExpanded: true,
              underline: const SizedBox.shrink(),
              items: [
                const DropdownMenuItem<String?>(
                  value: null,
                  child: Text(AppStrings.behaviourPatternsAllChildren),
                ),
                ...children.map((c) => DropdownMenuItem<String?>(
                      value: c.id,
                      child: Text(c.name),
                    )),
              ],
              onChanged: onChildChanged,
            ),
          ),
        ],
      ],
    );
  }

  String _daysLabel(int d) => switch (d) {
        7 => AppStrings.behaviourPatternsDays7,
        14 => AppStrings.behaviourPatternsDays14,
        _ => AppStrings.behaviourPatternsDays30,
      };
}

// ── Summary stat row ──────────────────────────────────────────────────────────

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.incidents});
  final List<BehaviourIncident> incidents;

  @override
  Widget build(BuildContext context) {
    final interventions =
        incidents.where((b) => b.physicalIntervention).length;
    final injuries = incidents.where((b) => b.injuryOccurred).length;

    return Row(
      children: [
        Expanded(
            child: _StatBox(
                label: AppStrings.behaviourPatternsTotalLabel,
                value: '${incidents.length}',
                color: AppColors.amber)),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
            child: _StatBox(
                label: AppStrings.behaviourPatternsInterventionsLabel,
                value: '$interventions',
                color: interventions > 0 ? AppColors.red : AppColors.green)),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
            child: _StatBox(
                label: AppStrings.behaviourPatternsInjuriesLabel,
                value: '$injuries',
                color: injuries > 0 ? AppColors.red : AppColors.green)),
      ],
    );
  }
}

class _StatBox extends StatelessWidget {
  const _StatBox(
      {required this.label, required this.value, required this.color});
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: color.withAlpha(20),
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.md, horizontal: AppSpacing.sm),
        child: Column(
          children: [
            Text(value, style: AppTextStyles.h1(color)),
            const SizedBox(height: AppSpacing.xs),
            Text(label,
                style: AppTextStyles.small(colors.onSurfaceVariant),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

// ── Daily trend bar chart ─────────────────────────────────────────────────────

class _TrendCard extends StatelessWidget {
  const _TrendCard({required this.incidents, required this.days});
  final List<BehaviourIncident> incidents;
  final int days;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final now = DateTime.now();

    // Build a count map keyed by 'yyyy-MM-dd'.
    final countByDay = <String, int>{};
    for (final b in incidents) {
      final key = _dayKey(b.occurredAt.toLocal());
      countByDay[key] = (countByDay[key] ?? 0) + 1;
    }

    final maxCount = countByDay.values.fold(0, (a, b) => a > b ? a : b);

    return _SectionCard(
      title: AppStrings.behaviourPatternsTrendTitle,
      child: SizedBox(
        height: 160,
        child: BarChart(
          BarChartData(
            maxY: (maxCount + 1).toDouble(),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 1,
              getDrawingHorizontalLine: (_) => FlLine(
                color: colors.outlineVariant,
                strokeWidth: 1,
              ),
            ),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  reservedSize: 24,
                  getTitlesWidget: (v, _) => v == v.roundToDouble() && v > 0
                      ? Text(v.toInt().toString(),
                          style: AppTextStyles.small(colors.onSurfaceVariant))
                      : const SizedBox.shrink(),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 22,
                  interval: days <= 7 ? 1 : days <= 14 ? 2 : 5,
                  getTitlesWidget: (v, _) {
                    final idx = v.toInt();
                    if (idx < 0 || idx >= days) return const SizedBox.shrink();
                    final date =
                        now.subtract(Duration(days: days - 1 - idx));
                    return Text(
                      DateFormat('d/M').format(date),
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                    );
                  },
                ),
              ),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            barGroups: List.generate(days, (i) {
              final date = now.subtract(Duration(days: days - 1 - i));
              final count = countByDay[_dayKey(date)] ?? 0;
              return BarChartGroupData(
                x: i,
                barRods: [
                  BarChartRodData(
                    toY: count.toDouble(),
                    color: count == 0
                        ? colors.outlineVariant
                        : AppColors.amber,
                    width: days <= 7 ? 18 : days <= 14 ? 12 : 6,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  String _dayKey(DateTime d) => '${d.year}-${d.month}-${d.day}';
}

// ── Shift breakdown card ──────────────────────────────────────────────────────

class _ShiftBreakdownCard extends StatelessWidget {
  const _ShiftBreakdownCard({required this.incidents});
  final List<BehaviourIncident> incidents;

  @override
  Widget build(BuildContext context) {
    final total = incidents.length;
    final byCounts = {
      for (final s in ShiftType.values)
        s: incidents.where((b) => b.shift == s).length,
    };

    return _SectionCard(
      title: AppStrings.behaviourPatternsShiftTitle,
      child: Column(
        children: ShiftType.values.map((s) {
          final count = byCounts[s]!;
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: _HorizBar(
              label: s.displayName,
              count: count,
              total: total,
              color: AppColors.amber,
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ── Severity breakdown card ───────────────────────────────────────────────────

class _SeverityBreakdownCard extends StatelessWidget {
  const _SeverityBreakdownCard({required this.incidents});
  final List<BehaviourIncident> incidents;

  @override
  Widget build(BuildContext context) {
    final total = incidents.length;
    final severityColors = {
      BehaviourSeverity.mild: AppColors.green,
      BehaviourSeverity.moderate: AppColors.amber,
      BehaviourSeverity.severe: AppColors.red,
    };

    return _SectionCard(
      title: AppStrings.behaviourPatternsSeverityTitle,
      child: Column(
        children: BehaviourSeverity.values.map((s) {
          final count = incidents.where((b) => b.severity == s).length;
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: _HorizBar(
              label: s.displayName,
              count: count,
              total: total,
              color: severityColors[s]!,
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ── Per-child breakdown card ──────────────────────────────────────────────────

class _ChildBreakdownCard extends StatelessWidget {
  const _ChildBreakdownCard(
      {required this.incidents, required this.children});
  final List<BehaviourIncident> incidents;
  final List<Child> children;

  @override
  Widget build(BuildContext context) {
    final total = incidents.length;
    final byChild = <String, int>{};
    for (final b in incidents) {
      byChild[b.childId] = (byChild[b.childId] ?? 0) + 1;
    }

    // Sort children by incident count descending; show top 8.
    final sorted = children
        .where((c) => (byChild[c.id] ?? 0) > 0)
        .toList()
      ..sort((a, b) => (byChild[b.id] ?? 0).compareTo(byChild[a.id] ?? 0));
    final display = sorted.take(8).toList();

    if (display.isEmpty) return const SizedBox.shrink();

    return _SectionCard(
      title: AppStrings.behaviourPatternsChildTitle,
      child: Column(
        children: display.map((c) {
          final count = byChild[c.id] ?? 0;
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: _HorizBar(
              label: c.name,
              count: count,
              total: total,
              color: AppColors.teal400,
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ── Common antecedents card ───────────────────────────────────────────────────

class _AntecedentsCard extends StatelessWidget {
  const _AntecedentsCard({required this.incidents});
  final List<BehaviourIncident> incidents;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Count antecedent snippets (first 60 chars, lowercased for grouping).
    final freq = <String, int>{};
    for (final b in incidents) {
      final snippet = b.antecedent.trim();
      if (snippet.isEmpty) continue;
      final key = snippet.length > 60 ? snippet.substring(0, 60) : snippet;
      freq[key] = (freq[key] ?? 0) + 1;
    }

    if (freq.isEmpty) return const SizedBox.shrink();

    final sorted = freq.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final top = sorted.take(5).toList();

    return _SectionCard(
      title: AppStrings.behaviourPatternsTriggersTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: top.asMap().entries.map((entry) {
          final rank = entry.key + 1;
          final text = entry.value.key;
          final count = entry.value.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                  child: Text(
                    '$rank.',
                    style: AppTextStyles.label(colors.onSurfaceVariant),
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Expanded(
                  child: Text(
                    text.length > 60 ? '${text.substring(0, 60)}…' : text,
                    style: AppTextStyles.small(colors.onSurface),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  '×$count',
                  style: AppTextStyles.label(colors.onSurfaceVariant),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ── Shared helper widgets ─────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.label(colors.onSurface)),
            const SizedBox(height: AppSpacing.md),
            child,
          ],
        ),
      ),
    );
  }
}

class _HorizBar extends StatelessWidget {
  const _HorizBar({
    required this.label,
    required this.count,
    required this.total,
    required this.color,
  });

  final String label;
  final int count;
  final int total;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final ratio = total == 0 ? 0.0 : count / total;

    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: AppTextStyles.small(colors.onSurfaceVariant),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 8,
              backgroundColor: colors.outlineVariant,
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        SizedBox(
          width: 28,
          child: Text(
            '$count',
            style: AppTextStyles.small(colors.onSurface),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
