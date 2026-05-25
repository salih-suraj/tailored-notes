import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../core/dev_mode.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/models/app_strings.dart';
import '../../auth/presentation/providers/auth_provider.dart';
import '../domain/child.dart';
import 'providers/children_provider.dart';

class AddChildScreen extends ConsumerStatefulWidget {
  const AddChildScreen({super.key});

  @override
  ConsumerState<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends ConsumerState<AddChildScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _room = TextEditingController();
  final _notes = TextEditingController();
  DateTime? _dob;
  bool _isSaving = false;

  @override
  void dispose() {
    _name.dispose();
    _room.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _pickDob() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dob ?? DateTime(2012),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      helpText: AppStrings.addChildDobLabel,
    );
    if (picked != null) setState(() => _dob = picked);
  }

  String _toDobString(DateTime dob) =>
      '${dob.year}-'
      '${dob.month.toString().padLeft(2, '0')}-'
      '${dob.day.toString().padLeft(2, '0')}';

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_dob == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.addChildDobRequired)),
      );
      return;
    }

    if (kDevMode) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Saved (dev mode — list is seeded)')),
        );
        context.pop();
      }
      return;
    }

    setState(() => _isSaving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final child = Child(
        id: const Uuid().v4(),
        homeId: user?.homeId ?? '',
        name: _name.text.trim(),
        dateOfBirth: _toDobString(_dob!),
        room: _room.text.trim(),
        notes: _notes.text.trim().isEmpty ? null : _notes.text.trim(),
        createdAt: now,
        updatedAt: now,
        createdById: user?.id,
        updatedById: user?.id,
      );

      await ref.read(childrenRepositoryProvider).save(child);
      if (mounted) context.pop();
    } catch (e, st) {
      log('AddChild save failed', error: e, stackTrace: st, name: 'AddChildScreen');
      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(AppStrings.saveFailed),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addChildTitle),
        actions: [
          if (_isSaving)
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
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            _label(AppStrings.addChildNameLabel, colors),
            const SizedBox(height: AppSpacing.xs),
            TextFormField(
              controller: _name,
              textCapitalization: TextCapitalization.words,
              style: AppTextStyles.body(colors.onSurface),
              decoration: _inputDecoration(AppStrings.addChildNameHint, colors),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? AppStrings.addChildNameRequired : null,
            ),
            const SizedBox(height: AppSpacing.lg),
            _label(AppStrings.addChildDobLabel, colors),
            const SizedBox(height: AppSpacing.xs),
            _DobField(
              dob: _dob,
              onTap: _pickDob,
              colors: colors,
            ),
            const SizedBox(height: AppSpacing.lg),
            _label(AppStrings.addChildRoomLabel, colors),
            const SizedBox(height: AppSpacing.xs),
            TextFormField(
              controller: _room,
              textCapitalization: TextCapitalization.characters,
              style: AppTextStyles.body(colors.onSurface),
              decoration: _inputDecoration(AppStrings.addChildRoomHint, colors),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? AppStrings.addChildRoomRequired : null,
            ),
            const SizedBox(height: AppSpacing.lg),
            _label(AppStrings.addChildNotesLabel, colors),
            const SizedBox(height: AppSpacing.xs),
            TextFormField(
              controller: _notes,
              maxLines: 4,
              style: AppTextStyles.body(colors.onSurface),
              decoration: _inputDecoration(AppStrings.addChildNotesHint, colors),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text, ColorScheme colors) => Text(
        text,
        style: AppTextStyles.label(colors.onSurfaceVariant),
      );

  InputDecoration _inputDecoration(String hint, ColorScheme colors) =>
      InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.body(colors.onSurfaceVariant),
        filled: true,
        fillColor: colors.surfaceContainerLow,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
      );
}

class _DobField extends StatelessWidget {
  const _DobField({required this.dob, required this.onTap, required this.colors});

  final DateTime? dob;
  final VoidCallback onTap;
  final ColorScheme colors;

  String get _label => dob != null
      ? '${dob!.day.toString().padLeft(2, '0')} / '
        '${dob!.month.toString().padLeft(2, '0')} / '
        '${dob!.year}'
      : AppStrings.addChildSelectDob;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        decoration: BoxDecoration(
          color: colors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _label,
                style: dob != null
                    ? AppTextStyles.body(colors.onSurface)
                    : AppTextStyles.body(colors.onSurfaceVariant),
              ),
            ),
            Icon(Icons.calendar_today_outlined,
                size: 18, color: colors.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}
