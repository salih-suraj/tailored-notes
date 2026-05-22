import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../shared/models/app_strings.dart';
import '../domain/smart_step.dart';
import 'providers/smart_steps_provider.dart';

class SmartStepEditorScreen extends ConsumerStatefulWidget {
  const SmartStepEditorScreen({
    super.key,
    required this.childId,
    this.existing,
  });

  final String childId;
  final SmartStep? existing;

  @override
  ConsumerState<SmartStepEditorScreen> createState() =>
      _SmartStepEditorScreenState();
}

class _SmartStepEditorScreenState
    extends ConsumerState<SmartStepEditorScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  StepCategory _category = StepCategory.independence;
  StepStatus _status = StepStatus.notStarted;
  DateTime? _targetDate;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _titleController.text = e.title;
      _descriptionController.text = e.description ?? '';
      _category = e.category;
      _status = e.status;
      if (e.targetDate != null) {
        final parts = e.targetDate!.split('-');
        if (parts.length == 3) {
          _targetDate = DateTime(int.parse(parts[0]),
              int.parse(parts[1]), int.parse(parts[2]));
        }
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  String _dateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  Future<void> _pickTargetDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate:
          _targetDate ?? DateTime.now().add(const Duration(days: 30)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
    );
    if (picked != null && mounted) setState(() => _targetDate = picked);
  }

  Future<void> _save() async {
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(AppStrings.smartStepsTitleRequired)),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final existing = widget.existing;
      final step = SmartStep(
        id: existing?.id ?? const Uuid().v4(),
        homeId: user?.homeId ?? 'dev-home-001',
        childId: widget.childId,
        category: _category,
        title: title,
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        targetDate:
            _targetDate != null ? _dateStr(_targetDate!) : null,
        status: _status,
        achievedDate: existing?.achievedDate,
        createdById: existing?.createdById ?? user?.id,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      );
      await ref.read(smartStepsRepositoryProvider).saveStep(step);
      if (mounted) context.pop();
    } catch (e, st) {
      log('Smart step save failed',
          error: e, stackTrace: st, name: 'SmartStepEditor');
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
            ? AppStrings.smartStepsEditStep
            : AppStrings.smartStepsNewStep),
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
          // Category
          _Label(AppStrings.smartStepsCategory, colors),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: StepCategory.values.map((c) {
              final sel = _category == c;
              final col = _catColor(c);
              return FilterChip(
                label: Text(c.displayName),
                selected: sel,
                onSelected: (_) => setState(() => _category = c),
                selectedColor: col.withAlpha(40),
                checkmarkColor: col,
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Title
          _Label(AppStrings.smartStepsStepTitle, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _titleController,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              hintText: AppStrings.smartStepsStepTitleHint,
              border: OutlineInputBorder(),
            ),
            autofocus: widget.existing == null,
          ),
          const SizedBox(height: AppSpacing.lg),

          // Description
          _Label(AppStrings.smartStepsDescription, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _descriptionController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: AppStrings.smartStepsDescriptionHint,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Status
          _Label(AppStrings.smartStepsStatus, colors),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            children: StepStatus.values.map((s) {
              final sel = _status == s;
              final col = _statusColor(s);
              return FilterChip(
                label: Text(s.displayName),
                selected: sel,
                onSelected: (_) => setState(() => _status = s),
                selectedColor: col.withAlpha(40),
                checkmarkColor: col,
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Target date
          _Label(AppStrings.smartStepsTargetDate, colors),
          const SizedBox(height: AppSpacing.sm),
          InkWell(
            onTap: _pickTargetDate,
            borderRadius: BorderRadius.circular(AppRadius.input),
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg, vertical: AppSpacing.md),
              decoration: BoxDecoration(
                border: Border.all(color: colors.outline),
                borderRadius: BorderRadius.circular(AppRadius.input),
              ),
              child: Row(
                children: [
                  Icon(Icons.flag_outlined,
                      size: 18, color: colors.onSurfaceVariant),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    _targetDate != null
                        ? '${_targetDate!.day}/${_targetDate!.month}/${_targetDate!.year}'
                        : AppStrings.smartStepsTargetDateHint,
                    style: AppTextStyles.body(
                      _targetDate != null
                          ? colors.onSurface
                          : colors.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  if (_targetDate != null)
                    GestureDetector(
                      onTap: () => setState(() => _targetDate = null),
                      child: Icon(Icons.clear,
                          size: 16, color: colors.onSurfaceVariant),
                    )
                  else
                    Text(AppStrings.change,
                        style: AppTextStyles.small(colors.primary)),
                ],
              ),
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

  Color _catColor(StepCategory c) => switch (c) {
        StepCategory.communication => AppColors.blue,
        StepCategory.selfCare => AppColors.teal400,
        StepCategory.independence => AppColors.green,
        StepCategory.social => AppColors.amber,
        StepCategory.emotional => const Color(0xFF9C27B0),
        StepCategory.learning => AppColors.roleSupportWorker,
        StepCategory.physical => const Color(0xFFE87510),
        StepCategory.other => AppColors.slate400,
      };

  Color _statusColor(StepStatus s) => switch (s) {
        StepStatus.notStarted => AppColors.slate400,
        StepStatus.inProgress => AppColors.amber,
        StepStatus.achieved => AppColors.green,
      };
}

class _Label extends StatelessWidget {
  const _Label(this.text, this.colors);
  final String text;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) =>
      Text(text, style: AppTextStyles.label(colors.onSurfaceVariant));
}
