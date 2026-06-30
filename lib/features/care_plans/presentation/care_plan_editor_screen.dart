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
import '../../../shared/widgets/unsaved_changes_guard.dart';
import '../domain/care_plan.dart';
import 'providers/care_plans_provider.dart';

class CarePlanEditorScreen extends ConsumerStatefulWidget {
  const CarePlanEditorScreen({super.key, required this.childId, this.existing});

  final String childId;
  final CarePlan? existing;

  @override
  ConsumerState<CarePlanEditorScreen> createState() =>
      _CarePlanEditorScreenState();
}

class _CarePlanEditorScreenState extends ConsumerState<CarePlanEditorScreen> {
  final _titleController = TextEditingController();
  final _notesController = TextEditingController();
  CarePlanStatus _status = CarePlanStatus.draft;
  DateTime? _reviewDate;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final p = widget.existing;
    if (p != null) {
      _titleController.text = p.title;
      _notesController.text = p.notes ?? '';
      _status = p.status;
      if (p.reviewDate != null) {
        final parts = p.reviewDate!.split('-');
        if (parts.length == 3) {
          _reviewDate = DateTime(
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
    _titleController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickReviewDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _reviewDate ?? DateTime.now().add(const Duration(days: 90)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 3)),
    );
    if (picked != null && mounted) {
      setState(() => _reviewDate = picked);
    }
  }

  Future<void> _save() async {
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.carePlanTitleRequired)),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final existing = widget.existing;
      final reviewDateStr = _reviewDate != null
          ? '${_reviewDate!.year}-${_reviewDate!.month.toString().padLeft(2, '0')}-${_reviewDate!.day.toString().padLeft(2, '0')}'
          : null;

      final plan = CarePlan(
        id: existing?.id ?? const Uuid().v4(),
        homeId: user?.homeId ?? 'dev-home-001',
        childId: widget.childId,
        title: title,
        status: _status,
        reviewDate: reviewDateStr,
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        authorId: existing?.authorId ?? user?.id ?? 'dev-user-001',
        authorName:
            existing?.authorName ??
            user?.displayName ??
            user?.email ??
            'Unknown',
        approvedById: existing?.approvedById,
        approvedByName: existing?.approvedByName,
        approvedAt: existing?.approvedAt,
        createdById: existing?.createdById ?? user?.id,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      );

      await ref.read(carePlansRepositoryProvider).savePlan(plan);
      if (mounted) context.pop();
    } catch (e, st) {
      log(
        'Care plan save failed',
        error: e,
        stackTrace: st,
        name: 'CarePlanEditor',
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
    controllers: [_titleController, _notesController],
    child: _buildScaffold(context),
  );

  Widget _buildScaffold(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isEditing = widget.existing != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? AppStrings.carePlanEdit : AppStrings.carePlanNew,
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
          // Title
          Text(
            AppStrings.carePlanTitleLabel,
            style: AppTextStyles.label(colors.onSurfaceVariant),
          ),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _titleController,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              hintText: AppStrings.carePlanTitleHint,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Status
          Text(
            AppStrings.carePlanStatusLabel,
            style: AppTextStyles.label(colors.onSurfaceVariant),
          ),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: CarePlanStatus.values.map((s) {
              final sel = _status == s;
              return FilterChip(
                label: Text(s.displayName),
                selected: sel,
                onSelected: (_) => setState(() => _status = s),
                selectedColor: AppColors.teal400.withAlpha(40),
                checkmarkColor: AppColors.teal400,
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Review date
          Text(
            AppStrings.carePlanReviewDate,
            style: AppTextStyles.label(colors.onSurfaceVariant),
          ),
          const SizedBox(height: AppSpacing.sm),
          InkWell(
            onTap: _pickReviewDate,
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
                    _reviewDate != null
                        ? DateFormat('d MMM yyyy').format(_reviewDate!)
                        : AppStrings.carePlanReviewDateHint,
                    style: AppTextStyles.body(
                      _reviewDate != null
                          ? colors.onSurface
                          : colors.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  if (_reviewDate != null)
                    GestureDetector(
                      onTap: () => setState(() => _reviewDate = null),
                      child: Icon(
                        Icons.clear,
                        size: 16,
                        color: colors.onSurfaceVariant,
                      ),
                    )
                  else
                    Text(
                      AppStrings.change,
                      style: AppTextStyles.small(colors.primary),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Notes
          Text(
            AppStrings.carePlanNotesLabel,
            style: AppTextStyles.label(colors.onSurfaceVariant),
          ),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _notesController,
            maxLines: 4,
            decoration: const InputDecoration(border: OutlineInputBorder()),
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
