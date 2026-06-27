import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/time/uk_time.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/inspector_module.dart';
import 'providers/inspector_provider.dart';

final _dateTimeFormat = DateFormat('EEE d MMM · HH:mm', 'en_GB');
final _dateFormat = DateFormat('d MMM yyyy', 'en_GB');

String _fmtDateTime(dynamic value) {
  if (value is! String) return '';
  final parsed = DateTime.tryParse(value);
  if (parsed == null) return value;
  return _dateTimeFormat.format(parsed.toUk());
}

String _fmtDate(dynamic value) {
  if (value is! String) return '';
  final parsed = DateTime.tryParse(value);
  if (parsed == null) return value;
  return _dateFormat.format(parsed);
}

String _label(dynamic value) {
  if (value is! String || value.isEmpty) return '';
  return value
      .split('_')
      .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
      .join(' ');
}

/// Generic read-only viewer for a single inspector module. Renders raw
/// Supabase rows as formatted cards — no edit/delete affordances.
class InspectorRecordsScreen extends ConsumerStatefulWidget {
  const InspectorRecordsScreen({
    super.key,
    required this.grantId,
    required this.moduleKey,
    this.childId,
  });

  final String grantId;
  final String moduleKey;
  final String? childId;

  @override
  ConsumerState<InspectorRecordsScreen> createState() =>
      _InspectorRecordsScreenState();
}

class _InspectorRecordsScreenState
    extends ConsumerState<InspectorRecordsScreen> {
  bool _viewLogged = false;

  void _logViewOnce(String homeId, InspectorModule module) {
    if (_viewLogged) return;
    _viewLogged = true;
    Future.microtask(
      () => ref
          .read(inspectorAuditServiceProvider)
          .recordView(
            homeId: homeId,
            entityTable: module.scopeKey,
            recordId: widget.childId,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final module = InspectorModule.fromScopeKey(widget.moduleKey);
    if (module == null) {
      return Scaffold(
        appBar: AppBar(title: const Text(AppStrings.inspectorSectionsLabel)),
        body: const ErrorView(message: AppStrings.unknownError),
      );
    }

    final grantAsync = ref.watch(grantByIdProvider(widget.grantId));

    return Scaffold(
      appBar: AppBar(title: Text(module.displayName)),
      body: grantAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(error: e),
        data: (grant) {
          if (grant == null) {
            return const ErrorView(message: AppStrings.inspectorExpired);
          }
          final recordsAsync = ref.watch(
            inspectorRecordsProvider(grant.homeId, module, widget.childId),
          );
          return recordsAsync.when(
            loading: () => const LoadingSkeleton(),
            error: (e, _) => ErrorView(
              error: e,
              onRetry: () => ref.invalidate(
                inspectorRecordsProvider(grant.homeId, module, widget.childId),
              ),
            ),
            data: (records) {
              _logViewOnce(grant.homeId, module);
              if (records.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          module.icon,
                          size: 56,
                          color: colors.onSurfaceVariant,
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        Text(
                          AppStrings.inspectorNoRecords,
                          style: AppTextStyles.body(colors.onSurfaceVariant),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.all(AppSpacing.lg),
                itemCount: records.length + 1,
                separatorBuilder: (_, _) =>
                    const SizedBox(height: AppSpacing.sm),
                itemBuilder: (_, i) {
                  if (i == 0) {
                    return Text(
                      AppStrings.inspectorRecordsLimitNote,
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                    );
                  }
                  return _RecordCard(module: module, record: records[i - 1]);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _RecordCard extends StatelessWidget {
  const _RecordCard({required this.module, required this.record});

  final InspectorModule module;
  final Map<String, dynamic> record;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: switch (module) {
          InspectorModule.dailyNotes => _DailyNoteCard(record: record),
          InspectorModule.carePlans => _CarePlanCard(record: record),
          InspectorModule.incidents => _IncidentCard(record: record),
          InspectorModule.behaviour => _BehaviourCard(record: record),
          InspectorModule.medication => _MedicationCard(record: record),
          InspectorModule.medicalHistory => _MedicalHistoryCard(record: record),
        },
      ),
    );
  }
}

// ── Daily notes ──────────────────────────────────────────────────────────

class _DailyNoteCard extends StatelessWidget {
  const _DailyNoteCard({required this.record});

  final Map<String, dynamic> record;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _Badge(label: _label(record['shift']), color: AppColors.teal400),
            const Spacer(),
            Text(
              _fmtDateTime(record['occurred_at']),
              style: AppTextStyles.small(colors.onSurfaceVariant),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          record['content'] as String? ?? '',
          style: AppTextStyles.body(colors.onSurface),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          '${AppStrings.managerFeedbackFrom} ${record['author_name'] ?? ''}',
          style: AppTextStyles.small(colors.onSurfaceVariant),
        ),
      ],
    );
  }
}

// ── Care plans ───────────────────────────────────────────────────────────

class _CarePlanCard extends StatelessWidget {
  const _CarePlanCard({required this.record});

  final Map<String, dynamic> record;

  Color _statusColor(String? status) => switch (status) {
    'active' => AppColors.green,
    'under_review' => AppColors.amber,
    'archived' => AppColors.slate400,
    _ => AppColors.blue, // draft
  };

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final goals =
        (record['care_plan_goals'] as List?)?.cast<Map<String, dynamic>>() ??
        const [];
    final reviewDate = record['review_date'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                record['title'] as String? ?? '',
                style: AppTextStyles.h3(colors.onSurface),
              ),
            ),
            _Badge(
              label: _label(record['status']),
              color: _statusColor(record['status'] as String?),
            ),
          ],
        ),
        if (reviewDate != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Review date: ${_fmtDate(reviewDate)}',
            style: AppTextStyles.small(colors.onSurfaceVariant),
          ),
        ],
        if ((record['notes'] as String? ?? '').isNotEmpty) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            record['notes'] as String,
            style: AppTextStyles.small(colors.onSurface),
          ),
        ],
        if (goals.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.md),
          Text(
            AppStrings.inspectorGoalsLabel,
            style: AppTextStyles.label(colors.onSurfaceVariant),
          ),
          const SizedBox(height: AppSpacing.xs),
          for (final goal in goals) _GoalTile(goal: goal),
        ],
      ],
    );
  }
}

class _GoalTile extends StatelessWidget {
  const _GoalTile({required this.goal});

  final Map<String, dynamic> goal;

  Color _statusColor(String? status) => switch (status) {
    'achieved' => AppColors.green,
    'in_progress' => AppColors.blue,
    'discontinued' => AppColors.slate400,
    _ => AppColors.amber, // not_started
  };

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.input),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    goal['title'] as String? ?? '',
                    style: AppTextStyles.h3(colors.onSurface),
                  ),
                ),
                _Badge(
                  label: _label(goal['status']),
                  color: _statusColor(goal['status'] as String?),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            _MiniChip(label: _label(goal['category']), color: AppColors.purple),
            if ((goal['strategy'] as String? ?? '').isNotEmpty) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                goal['strategy'] as String,
                style: AppTextStyles.small(colors.onSurface),
              ),
            ],
            if ((goal['progress_notes'] as String? ?? '').isNotEmpty) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                goal['progress_notes'] as String,
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ── Incidents ────────────────────────────────────────────────────────────

class _IncidentCard extends StatelessWidget {
  const _IncidentCard({required this.record});

  final Map<String, dynamic> record;

  Color _typeColor(String? type) => switch (type) {
    'behaviour' => AppColors.amber,
    'medical' => AppColors.blue,
    'accident' => AppColors.orange,
    'property_damage' => AppColors.slate400,
    'missing_person' => AppColors.red,
    'safeguarding' => AppColors.roleInspector,
    _ => AppColors.slate400,
  };

  Color _severityColor(String? severity) => switch (severity) {
    'low' => AppColors.green,
    'medium' => AppColors.amber,
    'high' => AppColors.orange,
    'critical' => AppColors.red,
    _ => AppColors.slate400,
  };

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _Badge(
              label: _label(record['incident_type']),
              color: _typeColor(record['incident_type'] as String?),
            ),
            const SizedBox(width: AppSpacing.sm),
            _Badge(
              label: _label(record['severity']),
              color: _severityColor(record['severity'] as String?),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          record['title'] as String? ?? '',
          style: AppTextStyles.h3(colors.onSurface),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          _fmtDateTime(record['occurred_at']),
          style: AppTextStyles.small(colors.onSurfaceVariant),
        ),
        if ((record['location'] as String? ?? '').isNotEmpty)
          Text(
            'Location: ${record['location']}',
            style: AppTextStyles.small(colors.onSurfaceVariant),
          ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          record['description'] as String? ?? '',
          style: AppTextStyles.body(colors.onSurface),
        ),
        if ((record['immediate_action'] as String? ?? '').isNotEmpty) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Immediate action:',
            style: AppTextStyles.label(colors.onSurfaceVariant),
          ),
          Text(
            record['immediate_action'] as String,
            style: AppTextStyles.small(colors.onSurface),
          ),
        ],
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: [
            if (record['police_notified'] == true)
              const _MiniChip(label: 'Police notified', color: AppColors.blue),
            if (record['parent_notified'] == true)
              const _MiniChip(
                label: 'Parent notified',
                color: AppColors.teal400,
              ),
            if (record['manager_notified'] == true)
              const _MiniChip(
                label: 'Manager notified',
                color: AppColors.slate400,
              ),
            if (record['follow_up_required'] == true)
              const _MiniChip(
                label: 'Follow-up required',
                color: AppColors.amber,
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          '${AppStrings.managerFeedbackFrom} ${record['reported_by_name'] ?? ''}',
          style: AppTextStyles.small(colors.onSurfaceVariant),
        ),
      ],
    );
  }
}

// ── Behaviour ────────────────────────────────────────────────────────────

class _BehaviourCard extends StatelessWidget {
  const _BehaviourCard({required this.record});

  final Map<String, dynamic> record;

  Color _severityColor(String? severity) => switch (severity) {
    'mild' => AppColors.green,
    'moderate' => AppColors.amber,
    'severe' => AppColors.red,
    _ => AppColors.slate400,
  };

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final duration = record['duration_minutes'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _Badge(
              label: _label(record['severity']),
              color: _severityColor(record['severity'] as String?),
            ),
            const SizedBox(width: AppSpacing.sm),
            _Badge(label: _label(record['shift']), color: AppColors.teal400),
            const Spacer(),
            Text(
              _fmtDateTime(record['occurred_at']),
              style: AppTextStyles.small(colors.onSurfaceVariant),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text('Antecedent', style: AppTextStyles.label(colors.onSurfaceVariant)),
        Text(
          record['antecedent'] as String? ?? '',
          style: AppTextStyles.small(colors.onSurface),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text('Behaviour', style: AppTextStyles.label(colors.onSurfaceVariant)),
        Text(
          record['behaviour'] as String? ?? '',
          style: AppTextStyles.small(colors.onSurface),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Consequence',
          style: AppTextStyles.label(colors.onSurfaceVariant),
        ),
        Text(
          record['consequence'] as String? ?? '',
          style: AppTextStyles.small(colors.onSurface),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: [
            if (duration != null)
              _MiniChip(label: '$duration min', color: AppColors.slate400),
            if ((record['location'] as String? ?? '').isNotEmpty)
              _MiniChip(
                label: record['location'] as String,
                color: AppColors.slate400,
              ),
            if (record['physical_intervention'] == true)
              const _MiniChip(
                label: 'Physical intervention',
                color: AppColors.orange,
              ),
            if (record['injury_occurred'] == true)
              const _MiniChip(label: 'Injury occurred', color: AppColors.red),
          ],
        ),
        if ((record['notes'] as String? ?? '').isNotEmpty) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            record['notes'] as String,
            style: AppTextStyles.small(colors.onSurface),
          ),
        ],
        const SizedBox(height: AppSpacing.xs),
        Text(
          '${AppStrings.managerFeedbackFrom} ${record['recorded_by_name'] ?? ''}',
          style: AppTextStyles.small(colors.onSurfaceVariant),
        ),
      ],
    );
  }
}

// ── Medication ───────────────────────────────────────────────────────────

class _MedicationCard extends StatelessWidget {
  const _MedicationCard({required this.record});

  final Map<String, dynamic> record;

  Color _outcomeColor(String? outcome) => switch (outcome) {
    'administered' => AppColors.green,
    'refused' => AppColors.red,
    'held' => AppColors.amber,
    _ => AppColors.slate400,
  };

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    if (record['_kind'] == 'administration') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  record['medication_name'] as String? ?? '',
                  style: AppTextStyles.h3(colors.onSurface),
                ),
              ),
              _Badge(
                label: _label(record['outcome']),
                color: _outcomeColor(record['outcome'] as String?),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Dose: ${record['dose'] ?? ''}',
            style: AppTextStyles.small(colors.onSurface),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            _fmtDateTime(record['administered_at']),
            style: AppTextStyles.small(colors.onSurfaceVariant),
          ),
          if ((record['reason'] as String? ?? '').isNotEmpty)
            Text(
              'Reason: ${record['reason']}',
              style: AppTextStyles.small(colors.onSurface),
            ),
          if ((record['notes'] as String? ?? '').isNotEmpty)
            Text(
              record['notes'] as String,
              style: AppTextStyles.small(colors.onSurface),
            ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            '${AppStrings.managerFeedbackFrom} ${record['administered_by_name'] ?? ''}',
            style: AppTextStyles.small(colors.onSurfaceVariant),
          ),
        ],
      );
    }

    // Prescribed medication
    final isActive = record['is_active'] == true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                record['medication_name'] as String? ?? '',
                style: AppTextStyles.h3(colors.onSurface),
              ),
            ),
            _Badge(
              label: isActive ? 'Active' : 'Inactive',
              color: isActive ? AppColors.green : AppColors.slate400,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          '${record['dose'] ?? ''} · ${_label(record['route'])} · ${_label(record['frequency'])}',
          style: AppTextStyles.small(colors.onSurface),
        ),
        if ((record['instructions'] as String? ?? '').isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            record['instructions'] as String,
            style: AppTextStyles.small(colors.onSurface),
          ),
        ],
        const SizedBox(height: AppSpacing.xs),
        Text(
          'From ${_fmtDate(record['start_date'])}'
          '${record['end_date'] != null ? ' to ${_fmtDate(record['end_date'])}' : ''}',
          style: AppTextStyles.small(colors.onSurfaceVariant),
        ),
        if ((record['prescribed_by'] as String? ?? '').isNotEmpty)
          Text(
            'Prescribed by ${record['prescribed_by']}',
            style: AppTextStyles.small(colors.onSurfaceVariant),
          ),
      ],
    );
  }
}

// ── Medical history ──────────────────────────────────────────────────────

class _MedicalHistoryCard extends StatelessWidget {
  const _MedicalHistoryCard({required this.record});

  final Map<String, dynamic> record;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    if (record['_kind'] == 'contact') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  record['name'] as String? ?? '',
                  style: AppTextStyles.h3(colors.onSurface),
                ),
              ),
              _Badge(
                label: _label(record['contact_type']),
                color: AppColors.blue,
              ),
            ],
          ),
          if ((record['role'] as String? ?? '').isNotEmpty)
            Text(
              record['role'] as String,
              style: AppTextStyles.small(colors.onSurfaceVariant),
            ),
          const SizedBox(height: AppSpacing.xs),
          if ((record['phone'] as String? ?? '').isNotEmpty)
            Text(
              'Phone: ${record['phone']}',
              style: AppTextStyles.small(colors.onSurface),
            ),
          if ((record['email'] as String? ?? '').isNotEmpty)
            Text(
              'Email: ${record['email']}',
              style: AppTextStyles.small(colors.onSurface),
            ),
          if ((record['address'] as String? ?? '').isNotEmpty)
            Text(
              record['address'] as String,
              style: AppTextStyles.small(colors.onSurface),
            ),
          if ((record['notes'] as String? ?? '').isNotEmpty) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              record['notes'] as String,
              style: AppTextStyles.small(colors.onSurface),
            ),
          ],
        ],
      );
    }

    // Medical profile
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Medical Profile', style: AppTextStyles.h3(colors.onSurface)),
        const SizedBox(height: AppSpacing.sm),
        if ((record['nhs_number'] as String? ?? '').isNotEmpty)
          Text(
            'NHS number: ${record['nhs_number']}',
            style: AppTextStyles.small(colors.onSurface),
          ),
        if ((record['blood_type'] as String? ?? '').isNotEmpty)
          Text(
            'Blood type: ${record['blood_type']}',
            style: AppTextStyles.small(colors.onSurface),
          ),
        if ((record['allergies'] as String? ?? '').isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Allergies',
            style: AppTextStyles.label(colors.onSurfaceVariant),
          ),
          Text(
            record['allergies'] as String,
            style: AppTextStyles.small(colors.onSurface),
          ),
        ],
        if ((record['conditions'] as String? ?? '').isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Conditions',
            style: AppTextStyles.label(colors.onSurfaceVariant),
          ),
          Text(
            record['conditions'] as String,
            style: AppTextStyles.small(colors.onSurface),
          ),
        ],
        if ((record['immunisation_notes'] as String? ?? '').isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Immunisations',
            style: AppTextStyles.label(colors.onSurfaceVariant),
          ),
          Text(
            record['immunisation_notes'] as String,
            style: AppTextStyles.small(colors.onSurface),
          ),
        ],
        if ((record['notes'] as String? ?? '').isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            record['notes'] as String,
            style: AppTextStyles.small(colors.onSurface),
          ),
        ],
      ],
    );
  }
}

// ── Shared small widgets ─────────────────────────────────────────────────

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
    decoration: BoxDecoration(
      color: color.withAlpha(25),
      borderRadius: BorderRadius.circular(AppRadius.pill),
    ),
    child: Text(label, style: AppTextStyles.label(color)),
  );
}

class _MiniChip extends StatelessWidget {
  const _MiniChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
    decoration: BoxDecoration(
      color: color.withAlpha(20),
      borderRadius: BorderRadius.circular(AppRadius.pill),
      border: Border.all(color: color.withAlpha(60)),
    ),
    child: Text(
      label,
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: color),
    ),
  );
}
