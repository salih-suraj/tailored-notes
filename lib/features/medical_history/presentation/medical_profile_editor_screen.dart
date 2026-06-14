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
import '../domain/medical_profile.dart';
import 'providers/medical_history_provider.dart';

class MedicalProfileEditorScreen extends ConsumerStatefulWidget {
  const MedicalProfileEditorScreen({
    super.key,
    required this.childId,
    this.existing,
  });

  final String childId;
  final MedicalProfile? existing;

  @override
  ConsumerState<MedicalProfileEditorScreen> createState() =>
      _MedicalProfileEditorScreenState();
}

class _MedicalProfileEditorScreenState
    extends ConsumerState<MedicalProfileEditorScreen> {
  final _nhsController = TextEditingController();
  final _bloodTypeController = TextEditingController();
  final _allergiesController = TextEditingController();
  final _conditionsController = TextEditingController();
  final _immunisationController = TextEditingController();
  final _notesController = TextEditingController();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final p = widget.existing;
    if (p != null) {
      _nhsController.text = p.nhsNumber ?? '';
      _bloodTypeController.text = p.bloodType ?? '';
      _allergiesController.text = p.allergies ?? '';
      _conditionsController.text = p.conditions ?? '';
      _immunisationController.text = p.immunisationNotes ?? '';
      _notesController.text = p.notes ?? '';
    }
  }

  @override
  void dispose() {
    _nhsController.dispose();
    _bloodTypeController.dispose();
    _allergiesController.dispose();
    _conditionsController.dispose();
    _immunisationController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final existing = widget.existing;
      final profile = MedicalProfile(
        id: existing?.id ?? const Uuid().v4(),
        homeId: user?.homeId ?? 'dev-home-001',
        childId: widget.childId,
        nhsNumber: _nhsController.text.trim().isEmpty
            ? null
            : _nhsController.text.trim(),
        bloodType: _bloodTypeController.text.trim().isEmpty
            ? null
            : _bloodTypeController.text.trim(),
        allergies: _allergiesController.text.trim().isEmpty
            ? null
            : _allergiesController.text.trim(),
        conditions: _conditionsController.text.trim().isEmpty
            ? null
            : _conditionsController.text.trim(),
        immunisationNotes: _immunisationController.text.trim().isEmpty
            ? null
            : _immunisationController.text.trim(),
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        createdById: existing?.createdById ?? user?.id,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      );
      await ref.read(medicalHistoryRepositoryProvider).saveProfile(profile);
      if (mounted) context.pop();
    } catch (e, st) {
      log(
        'Medical profile save failed',
        error: e,
        stackTrace: st,
        name: 'MedicalProfileEditor',
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

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.medHistoryEditProfile),
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
          // Allergies first — most critical
          Text(
            AppStrings.medHistoryAllergies,
            style: AppTextStyles.label(AppColors.red),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            AppStrings.medHistoryAllergiesHint,
            style: AppTextStyles.small(colors.onSurfaceVariant),
          ),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _allergiesController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: AppStrings.medHistoryAllergiesHintField,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red.withAlpha(120)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red.withAlpha(80)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          _Label(AppStrings.medHistoryConditions, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _conditionsController,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: AppStrings.medHistoryConditionsHint,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          _Label(AppStrings.medHistoryNhs, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _nhsController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: AppStrings.medHistoryNhsHint,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          _Label(AppStrings.medHistoryBloodType, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _bloodTypeController,
            decoration: const InputDecoration(
              hintText: AppStrings.medHistoryBloodTypeHint,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          _Label(AppStrings.medHistoryImmunisation, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _immunisationController,
            maxLines: 3,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          const SizedBox(height: AppSpacing.lg),

          _Label(AppStrings.medHistoryNotes, colors),
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
