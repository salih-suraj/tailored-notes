import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/time/uk_time.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/unsaved_changes_guard.dart';
import '../../daily_notes/domain/daily_note.dart';
import '../domain/behaviour_incident.dart';
import 'providers/behaviour_provider.dart';

class BehaviourIncidentEditorScreen extends ConsumerStatefulWidget {
  const BehaviourIncidentEditorScreen({
    super.key,
    required this.childId,
    this.existing,
  });

  final String childId;
  final BehaviourIncident? existing;

  @override
  ConsumerState<BehaviourIncidentEditorScreen> createState() =>
      _BehaviourIncidentEditorScreenState();
}

class _BehaviourIncidentEditorScreenState
    extends ConsumerState<BehaviourIncidentEditorScreen> {
  final _antecedentController = TextEditingController();
  final _behaviourController = TextEditingController();
  final _consequenceController = TextEditingController();
  final _locationController = TextEditingController();
  final _interventionDetailsController = TextEditingController();
  final _injuryDetailsController = TextEditingController();
  final _notesController = TextEditingController();
  final _durationController = TextEditingController();

  ShiftType _shift = ShiftType.forTime(DateTime.now());
  BehaviourSeverity _severity = BehaviourSeverity.mild;
  bool _physicalIntervention = false;
  bool _injuryOccurred = false;
  DateTime _occurredAt = DateTime.now();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _antecedentController.text = e.antecedent;
      _behaviourController.text = e.behaviour;
      _consequenceController.text = e.consequence;
      _locationController.text = e.location ?? '';
      _interventionDetailsController.text = e.interventionDetails ?? '';
      _injuryDetailsController.text = e.injuryDetails ?? '';
      _notesController.text = e.notes ?? '';
      _durationController.text = e.durationMinutes != null
          ? '${e.durationMinutes}'
          : '';
      _shift = e.shift;
      _severity = e.severity;
      _physicalIntervention = e.physicalIntervention;
      _injuryOccurred = e.injuryOccurred;
      _occurredAt = e.occurredAt.toUk();
    }
  }

  @override
  void dispose() {
    _antecedentController.dispose();
    _behaviourController.dispose();
    _consequenceController.dispose();
    _locationController.dispose();
    _interventionDetailsController.dispose();
    _injuryDetailsController.dispose();
    _notesController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  Future<void> _pickTime() async {
    final picked = await showDateTimePicker(context, _occurredAt);
    if (picked != null && mounted) setState(() => _occurredAt = picked);
  }

  Future<DateTime?> showDateTimePicker(
    BuildContext context,
    DateTime initial,
  ) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (date == null || !context.mounted) return null;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
    );
    if (time == null) return null;
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  Future<void> _save() async {
    final antecedent = _antecedentController.text.trim();
    final behaviour = _behaviourController.text.trim();
    final consequence = _consequenceController.text.trim();
    if (antecedent.isEmpty || behaviour.isEmpty || consequence.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.behaviourRequiredFields)),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final existing = widget.existing;
      final incident = BehaviourIncident(
        id: existing?.id ?? const Uuid().v4(),
        homeId: user?.homeId ?? 'dev-home-001',
        childId: widget.childId,
        shift: _shift,
        occurredAt: _occurredAt.toUtc(),
        severity: _severity,
        antecedent: antecedent,
        behaviour: behaviour,
        consequence: consequence,
        durationMinutes: int.tryParse(_durationController.text.trim()),
        location: _locationController.text.trim().isEmpty
            ? null
            : _locationController.text.trim(),
        physicalIntervention: _physicalIntervention,
        interventionDetails:
            _physicalIntervention &&
                _interventionDetailsController.text.trim().isNotEmpty
            ? _interventionDetailsController.text.trim()
            : null,
        injuryOccurred: _injuryOccurred,
        injuryDetails:
            _injuryOccurred && _injuryDetailsController.text.trim().isNotEmpty
            ? _injuryDetailsController.text.trim()
            : null,
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        recordedById: user?.id ?? 'dev-user-001',
        recordedByName: user?.displayName ?? user?.email ?? 'Unknown',
        createdById: existing?.createdById ?? user?.id,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      );
      await ref.read(behaviourRepositoryProvider).save(incident);
      if (mounted) context.pop();
    } catch (e, st) {
      log(
        'Behaviour save failed',
        error: e,
        stackTrace: st,
        name: 'BehaviourEditor',
      );
      if (mounted) {
        setState(() => _saving = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text(AppStrings.saveFailed)));
      }
    }
  }

  @override
  Widget build(BuildContext context) => UnsavedChangesGuard(
    controllers: [
      _antecedentController,
      _behaviourController,
      _consequenceController,
      _durationController,
      _injuryDetailsController,
      _interventionDetailsController,
      _locationController,
      _notesController,
    ],
    child: _buildScaffold(context),
  );

  Widget _buildScaffold(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isEditing = widget.existing != null;
    final severityColor = _severityColor(_severity);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing
              ? AppStrings.behaviourEditIncident
              : AppStrings.behaviourNewIncident,
        ),
        actions: [
          if (_saving)
            const Padding(
              padding: EdgeInsets.all(AppSpacing.lg),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else
            TextButton(
              onPressed: _save,
              child: Text(
                AppStrings.save,
                style: AppTextStyles.button(colors.primary),
              ),
            ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          // Date/time + shift
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: _pickTime,
                  borderRadius: BorderRadius.circular(AppRadius.input),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.outline),
                      borderRadius: BorderRadius.circular(AppRadius.input),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 18,
                          color: colors.onSurfaceVariant,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          DateFormat(
                            'd MMM · HH:mm',
                            'en_GB',
                          ).format(_occurredAt),
                          style: AppTextStyles.body(colors.onSurface),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              _ShiftSelector(
                selected: _shift,
                onChanged: (s) => setState(() => _shift = s),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          // Severity
          _Label(AppStrings.behaviourSeverity, colors),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            children: BehaviourSeverity.values.map((s) {
              final sel = _severity == s;
              final col = _severityColor(s);
              return FilterChip(
                label: Text(s.displayName),
                selected: sel,
                onSelected: (_) => setState(() => _severity = s),
                selectedColor: col.withAlpha(40),
                checkmarkColor: col,
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // ABC fields
          _AbcField(
            label: 'A — ${AppStrings.behaviourAntecedent}',
            hint: AppStrings.behaviourAntecedentHint,
            controller: _antecedentController,
            color: AppColors.blue,
          ),
          const SizedBox(height: AppSpacing.md),
          _AbcField(
            label: 'B — ${AppStrings.behaviourBehaviour}',
            hint: AppStrings.behaviourBehaviourHint,
            controller: _behaviourController,
            color: severityColor,
          ),
          const SizedBox(height: AppSpacing.md),
          _AbcField(
            label: 'C — ${AppStrings.behaviourConsequence}',
            hint: AppStrings.behaviourConsequenceHint,
            controller: _consequenceController,
            color: AppColors.green,
          ),
          const SizedBox(height: AppSpacing.lg),

          // Duration + location
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Label(AppStrings.behaviourDuration, colors),
                    const SizedBox(height: AppSpacing.sm),
                    TextField(
                      controller: _durationController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        hintText: AppStrings.behaviourDurationHint,
                        suffixText: AppStrings.behaviourDurationUnit,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Label(AppStrings.behaviourLocation, colors),
                    const SizedBox(height: AppSpacing.sm),
                    TextField(
                      controller: _locationController,
                      decoration: const InputDecoration(
                        hintText: AppStrings.behaviourLocationHint,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          // Physical intervention — safety flag
          _SafetyToggle(
            title: AppStrings.behaviourPhysicalIntervention,
            subtitle: AppStrings.behaviourPhysicalInterventionSubtitle,
            value: _physicalIntervention,
            color: AppColors.red,
            onChanged: (v) => setState(() => _physicalIntervention = v),
          ),
          if (_physicalIntervention) ...[
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _interventionDetailsController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: AppStrings.behaviourInterventionDetails,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red.withAlpha(120)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red),
                ),
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.md),

          // Injury occurred — safety flag
          _SafetyToggle(
            title: AppStrings.behaviourInjury,
            subtitle: AppStrings.behaviourInjurySubtitle,
            value: _injuryOccurred,
            color: AppColors.red,
            onChanged: (v) => setState(() => _injuryOccurred = v),
          ),
          if (_injuryOccurred) ...[
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _injuryDetailsController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: AppStrings.behaviourInjuryDetails,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red.withAlpha(120)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red),
                ),
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.lg),

          // Additional notes
          _Label(AppStrings.notesOptional, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _notesController,
            maxLines: 3,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          const SizedBox(height: AppSpacing.xxl),

          FilledButton(
            onPressed: _saving ? null : _save,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.teal400,
              minimumSize: const Size.fromHeight(AppTapTarget.min),
            ),
            child: _saving
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.white,
                    ),
                  )
                : const Text(AppStrings.save),
          ),
        ],
      ),
    );
  }

  Color _severityColor(BehaviourSeverity s) => switch (s) {
    BehaviourSeverity.mild => AppColors.amber,
    BehaviourSeverity.moderate => AppColors.orange,
    BehaviourSeverity.severe => AppColors.red,
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

class _AbcField extends StatelessWidget {
  const _AbcField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.color,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final Color color;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: AppTextStyles.label(color)),
      const SizedBox(height: AppSpacing.sm),
      TextField(
        controller: controller,
        maxLines: 3,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: color.withAlpha(80)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
        ),
      ),
    ],
  );
}

class _SafetyToggle extends StatelessWidget {
  const _SafetyToggle({
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
            : Theme.of(context).colorScheme.outline,
      ),
      borderRadius: BorderRadius.circular(AppRadius.card),
    ),
    child: SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: AppTextStyles.body(
          value ? color : Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.small(
          Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
      activeThumbColor: color,
      dense: true,
    ),
  );
}

class _ShiftSelector extends StatelessWidget {
  const _ShiftSelector({required this.selected, required this.onChanged});

  final ShiftType selected;
  final ValueChanged<ShiftType> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      decoration: BoxDecoration(
        border: Border.all(color: colors.outline),
        borderRadius: BorderRadius.circular(AppRadius.input),
      ),
      child: DropdownButton<ShiftType>(
        value: selected,
        underline: const SizedBox(),
        items: ShiftType.values
            .map(
              (s) => DropdownMenuItem(
                value: s,
                child: Text(
                  s.displayName,
                  style: AppTextStyles.small(colors.onSurface),
                ),
              ),
            )
            .toList(),
        onChanged: (v) {
          if (v != null) onChanged(v);
        },
      ),
    );
  }
}
