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
import '../domain/incident_report.dart';
import 'providers/incidents_provider.dart';

class IncidentReportEditorScreen extends ConsumerStatefulWidget {
  const IncidentReportEditorScreen({
    super.key,
    required this.childId,
    this.existing,
  });

  final String childId;
  final IncidentReport? existing;

  @override
  ConsumerState<IncidentReportEditorScreen> createState() =>
      _IncidentReportEditorScreenState();
}

class _IncidentReportEditorScreenState
    extends ConsumerState<IncidentReportEditorScreen> {
  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _immediateActionController = TextEditingController();
  final _injuryDetailsController = TextEditingController();
  final _followUpDetailsController = TextEditingController();

  IncidentType _incidentType = IncidentType.accident;
  IncidentSeverity _severity = IncidentSeverity.medium;
  DateTime _occurredAt = DateTime.now();
  bool _policeNotified = false;
  bool _parentNotified = false;
  bool _managerNotified = false;
  bool _followUpRequired = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _titleController.text = e.title;
      _locationController.text = e.location ?? '';
      _descriptionController.text = e.description;
      _immediateActionController.text = e.immediateAction;
      _injuryDetailsController.text = e.injuryDetails ?? '';
      _followUpDetailsController.text = e.followUpDetails ?? '';
      _incidentType = e.incidentType;
      _severity = e.severity;
      _occurredAt = e.occurredAt.toLocal();
      _policeNotified = e.policeNotified;
      _parentNotified = e.parentNotified;
      _managerNotified = e.managerNotified;
      _followUpRequired = e.followUpRequired;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _immediateActionController.dispose();
    _injuryDetailsController.dispose();
    _followUpDetailsController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _occurredAt,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_occurredAt),
    );
    if (time == null || !mounted) return;
    setState(() {
      _occurredAt =
          DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  Future<void> _save() async {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    final immediateAction = _immediateActionController.text.trim();

    if (title.isEmpty || description.isEmpty || immediateAction.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.incidentRequiredFields)),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final existing = widget.existing;

      final report = IncidentReport(
        id: existing?.id ?? const Uuid().v4(),
        homeId: user?.homeId ?? 'dev-home-001',
        childId: widget.childId,
        incidentType: _incidentType,
        severity: _severity,
        title: title,
        occurredAt: _occurredAt.toUtc(),
        location: _locationController.text.trim().isEmpty
            ? null
            : _locationController.text.trim(),
        description: description,
        immediateAction: immediateAction,
        injuryDetails: _injuryDetailsController.text.trim().isEmpty
            ? null
            : _injuryDetailsController.text.trim(),
        policeNotified: _policeNotified,
        parentNotified: _parentNotified,
        managerNotified: _managerNotified,
        followUpRequired: _followUpRequired,
        followUpDetails: _followUpRequired &&
                _followUpDetailsController.text.trim().isNotEmpty
            ? _followUpDetailsController.text.trim()
            : null,
        reportedById: user?.id ?? 'dev-user-001',
        reportedByName: user?.displayName ?? user?.email ?? 'Unknown',
        createdById: existing?.createdById ?? user?.id,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      );

      await ref.read(incidentReportsRepositoryProvider).save(report);
      if (mounted) context.pop();
    } catch (e, st) {
      log('Incident save failed', error: e, stackTrace: st,
          name: 'IncidentEditor');
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
    final isEditing = widget.existing != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing
            ? AppStrings.incidentEdit
            : AppStrings.incidentNew),
        actions: [
          if (_saving)
            const Padding(
              padding: EdgeInsets.all(AppSpacing.lg),
              child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2)),
            )
          else
            TextButton(
              onPressed: _save,
              child: Text(AppStrings.save,
                  style: AppTextStyles.button(colors.primary)),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          // ── Date & time ───────────────────────────────────────────
          InkWell(
            onTap: _pickDateTime,
            borderRadius: BorderRadius.circular(AppRadius.input),
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md, vertical: AppSpacing.sm),
              decoration: BoxDecoration(
                border: Border.all(color: colors.outline),
                borderRadius: BorderRadius.circular(AppRadius.input),
              ),
              child: Row(
                children: [
                  Icon(Icons.access_time,
                      size: 18, color: colors.onSurfaceVariant),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    DateFormat('EEEE d MMMM · HH:mm', 'en_GB')
                        .format(_occurredAt),
                    style: AppTextStyles.body(colors.onSurface),
                  ),
                  const Spacer(),
                  Text(AppStrings.change,
                      style: AppTextStyles.small(colors.primary)),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // ── Incident type ─────────────────────────────────────────
          _Label(AppStrings.incidentTypeLabel, colors),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: IncidentType.values.map((t) {
              final sel = _incidentType == t;
              final col = _typeColor(t);
              return FilterChip(
                label: Text(t.displayName),
                selected: sel,
                onSelected: (_) => setState(() => _incidentType = t),
                selectedColor: col.withAlpha(40),
                checkmarkColor: col,
                labelStyle: AppTextStyles.small(
                    sel ? col : colors.onSurface),
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // ── Severity ──────────────────────────────────────────────
          _Label(AppStrings.incidentSeverityLabel, colors),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            children: IncidentSeverity.values.map((s) {
              final sel = _severity == s;
              final col = _severityColor(s);
              return FilterChip(
                label: Text(s.displayName),
                selected: sel,
                onSelected: (_) => setState(() => _severity = s),
                selectedColor: col.withAlpha(40),
                checkmarkColor: col,
                labelStyle: AppTextStyles.small(
                    sel ? col : colors.onSurface),
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // ── Title ─────────────────────────────────────────────────
          _Label(AppStrings.incidentTitleLabel, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _titleController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: AppStrings.incidentTitleHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // ── Location ──────────────────────────────────────────────
          _Label(AppStrings.incidentLocationLabel, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _locationController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: AppStrings.incidentLocationHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // ── What happened ─────────────────────────────────────────
          _Label(AppStrings.incidentDescriptionLabel, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _descriptionController,
            maxLines: 4,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: AppStrings.incidentDescriptionHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // ── Immediate action ──────────────────────────────────────
          _Label(AppStrings.incidentImmediateActionLabel, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _immediateActionController,
            maxLines: 3,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: AppStrings.incidentImmediateActionHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // ── Injury details ────────────────────────────────────────
          _Label(AppStrings.incidentInjuryDetails, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _injuryDetailsController,
            maxLines: 2,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: AppStrings.incidentInjuryDetailsHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // ── Notifications ─────────────────────────────────────────
          _SectionHeader(AppStrings.incidentNotifications, colors),
          const SizedBox(height: AppSpacing.sm),
          _NotifyToggle(
            title: AppStrings.incidentPoliceNotified,
            subtitle: AppStrings.incidentPoliceNotifiedSubtitle,
            value: _policeNotified,
            color: AppColors.blue,
            onChanged: (v) => setState(() => _policeNotified = v),
          ),
          const SizedBox(height: AppSpacing.sm),
          _NotifyToggle(
            title: AppStrings.incidentParentNotified,
            subtitle: AppStrings.incidentParentNotifiedSubtitle,
            value: _parentNotified,
            color: AppColors.teal400,
            onChanged: (v) => setState(() => _parentNotified = v),
          ),
          const SizedBox(height: AppSpacing.sm),
          _NotifyToggle(
            title: AppStrings.incidentManagerNotified,
            subtitle: AppStrings.incidentManagerNotifiedSubtitle,
            value: _managerNotified,
            color: AppColors.roleManager,
            onChanged: (v) => setState(() => _managerNotified = v),
          ),
          const SizedBox(height: AppSpacing.xl),

          // ── Follow-up ─────────────────────────────────────────────
          _SectionHeader(AppStrings.incidentFollowUpSection, colors),
          const SizedBox(height: AppSpacing.sm),
          _NotifyToggle(
            title: AppStrings.incidentFollowUpRequired,
            subtitle: AppStrings.incidentFollowUpRequiredSubtitle,
            value: _followUpRequired,
            color: AppColors.amber,
            onChanged: (v) => setState(() => _followUpRequired = v),
          ),
          if (_followUpRequired) ...[
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _followUpDetailsController,
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: AppStrings.incidentFollowUpDetails,
                hintText: AppStrings.incidentFollowUpDetailsHint,
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.amber.withAlpha(120)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.amber),
                ),
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.xxl),

          FilledButton(
            onPressed: _saving ? null : _save,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.red,
              minimumSize: const Size.fromHeight(AppTapTarget.min),
            ),
            child: _saving
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: AppColors.white))
                : const Text(AppStrings.save),
          ),
        ],
      ),
    );
  }

  Color _typeColor(IncidentType t) => switch (t) {
        IncidentType.behaviour => AppColors.amber,
        IncidentType.medical => AppColors.blue,
        IncidentType.accident => AppColors.orange,
        IncidentType.propertyDamage => AppColors.slate400,
        IncidentType.missingPerson => AppColors.red,
        IncidentType.safeguarding => AppColors.roleInspector,
      };

  Color _severityColor(IncidentSeverity s) => switch (s) {
        IncidentSeverity.low => AppColors.green,
        IncidentSeverity.medium => AppColors.amber,
        IncidentSeverity.high => AppColors.orange,
        IncidentSeverity.critical => AppColors.red,
      };
}

// ── Sub-widgets ───────────────────────────────────────────────────────────────

class _Label extends StatelessWidget {
  const _Label(this.text, this.colors);
  final String text;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) =>
      Text(text, style: AppTextStyles.label(colors.onSurfaceVariant));
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.text, this.colors);
  final String text;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.xs),
        child: Text(text, style: AppTextStyles.label(colors.onSurfaceVariant)),
      );
}

class _NotifyToggle extends StatelessWidget {
  const _NotifyToggle({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.color,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool value;
  final Color color;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: value ? color.withAlpha(15) : null,
          border: Border.all(
              color: value
                  ? color.withAlpha(80)
                  : Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        child: SwitchListTile(
          value: value,
          onChanged: onChanged,
          title: Text(title,
              style: AppTextStyles.body(
                  value ? color : Theme.of(context).colorScheme.onSurface)),
          subtitle: Text(subtitle,
              style: AppTextStyles.small(
                  Theme.of(context).colorScheme.onSurfaceVariant)),
          activeThumbColor: color,
          dense: true,
        ),
      );
}
