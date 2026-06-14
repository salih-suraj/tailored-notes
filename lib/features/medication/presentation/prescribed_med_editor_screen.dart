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
import '../domain/prescribed_med.dart';
import 'providers/medication_provider.dart';

class PrescribedMedEditorScreen extends ConsumerStatefulWidget {
  const PrescribedMedEditorScreen({
    super.key,
    required this.childId,
    this.existing,
  });

  final String childId;
  final PrescribedMed? existing;

  @override
  ConsumerState<PrescribedMedEditorScreen> createState() =>
      _PrescribedMedEditorScreenState();
}

class _PrescribedMedEditorScreenState
    extends ConsumerState<PrescribedMedEditorScreen> {
  final _nameController = TextEditingController();
  final _doseController = TextEditingController();
  final _instructionsController = TextEditingController();
  final _prescribedByController = TextEditingController();
  MedRoute _route = MedRoute.oral;
  MedFrequency _frequency = MedFrequency.morning;
  DateTime _startDate = DateTime.now();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final m = widget.existing;
    if (m != null) {
      _nameController.text = m.medicationName;
      _doseController.text = m.dose;
      _instructionsController.text = m.instructions ?? '';
      _prescribedByController.text = m.prescribedBy ?? '';
      _route = m.route;
      _frequency = m.frequency;
      if (m.startDate.isNotEmpty) {
        final parts = m.startDate.split('-');
        if (parts.length == 3) {
          _startDate = DateTime(
            int.parse(parts[0]),
            int.parse(parts[1]),
            int.parse(parts[2]),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _doseController.dispose();
    _instructionsController.dispose();
    _prescribedByController.dispose();
    super.dispose();
  }

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && mounted) setState(() => _startDate = picked);
  }

  String _toDateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  Future<void> _save() async {
    final name = _nameController.text.trim();
    final dose = _doseController.text.trim();
    if (name.isEmpty || dose.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.medNameDoseRequired)),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final existing = widget.existing;
      final med = PrescribedMed(
        id: existing?.id ?? const Uuid().v4(),
        homeId: user?.homeId ?? 'dev-home-001',
        childId: widget.childId,
        medicationName: name,
        dose: dose,
        route: _route,
        frequency: _frequency,
        instructions: _instructionsController.text.trim().isEmpty
            ? null
            : _instructionsController.text.trim(),
        prescribedBy: _prescribedByController.text.trim().isEmpty
            ? null
            : _prescribedByController.text.trim(),
        startDate: _toDateStr(_startDate),
        createdById: existing?.createdById ?? user?.id,
        updatedById: user?.id,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      );
      await ref.read(medicationRepositoryProvider).saveMed(med);
      if (mounted) context.pop();
    } catch (e, st) {
      log(
        'Med save failed',
        error: e,
        stackTrace: st,
        name: 'PrescribedMedEditor',
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
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isEditing = widget.existing != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing
              ? AppStrings.medEditPrescribed
              : AppStrings.medAddPrescribed,
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
          _Label(AppStrings.medName, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _nameController,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              hintText: AppStrings.medNameHint,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          _Label(AppStrings.medDose, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _doseController,
            decoration: const InputDecoration(
              hintText: AppStrings.medDoseHint,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          _Label(AppStrings.medRoute, colors),
          const SizedBox(height: AppSpacing.sm),
          _StyledDropdown<MedRoute>(
            value: _route,
            items: MedRoute.values,
            labelOf: (r) => r.displayName,
            onChanged: (v) => setState(() => _route = v),
            colors: colors,
          ),
          const SizedBox(height: AppSpacing.lg),

          _Label(AppStrings.medFrequency, colors),
          const SizedBox(height: AppSpacing.sm),
          _StyledDropdown<MedFrequency>(
            value: _frequency,
            items: MedFrequency.values,
            labelOf: (f) => f.displayName,
            onChanged: (v) => setState(() => _frequency = v),
            colors: colors,
          ),
          const SizedBox(height: AppSpacing.lg),

          _Label(AppStrings.medStartDate, colors),
          const SizedBox(height: AppSpacing.sm),
          InkWell(
            onTap: _pickStartDate,
            borderRadius: BorderRadius.circular(AppRadius.input),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: colors.outline),
                borderRadius: BorderRadius.circular(AppRadius.input),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.event_outlined,
                    color: colors.onSurfaceVariant,
                    size: 20,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    DateFormat('d MMM yyyy').format(_startDate),
                    style: AppTextStyles.body(colors.onSurface),
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.change,
                    style: AppTextStyles.small(colors.primary),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          _Label(AppStrings.medInstructions, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _instructionsController,
            maxLines: 2,
            decoration: const InputDecoration(
              hintText: AppStrings.medInstructionsHint,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          _Label(AppStrings.medPrescribedBy, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _prescribedByController,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              hintText: AppStrings.medPrescribedByHint,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),

          FilledButton(
            onPressed: _saving ? null : _save,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.teal400,
              minimumSize: const Size.fromHeight(AppTapTarget.min),
            ),
            child: const Text(AppStrings.save),
          ),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text, this.colors);
  final String text;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) =>
      Text(text, style: AppTextStyles.label(colors.onSurfaceVariant));
}

class _StyledDropdown<T> extends StatelessWidget {
  const _StyledDropdown({
    required this.value,
    required this.items,
    required this.labelOf,
    required this.onChanged,
    required this.colors,
  });

  final T value;
  final List<T> items;
  final String Function(T) labelOf;
  final void Function(T) onChanged;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.xs,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: colors.outline),
      borderRadius: BorderRadius.circular(AppRadius.input),
    ),
    child: DropdownButton<T>(
      value: value,
      isExpanded: true,
      underline: const SizedBox(),
      items: items
          .map((i) => DropdownMenuItem<T>(value: i, child: Text(labelOf(i))))
          .toList(),
      onChanged: (v) {
        if (v != null) onChanged(v);
      },
    ),
  );
}
