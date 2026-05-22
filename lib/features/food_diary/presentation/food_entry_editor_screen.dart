import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../shared/models/app_strings.dart';
import '../domain/food_entry.dart';
import 'providers/food_diary_provider.dart';

class FoodEntryEditorScreen extends ConsumerStatefulWidget {
  const FoodEntryEditorScreen({
    super.key,
    required this.childId,
    this.existing,
  });

  final String childId;
  final FoodEntry? existing;

  @override
  ConsumerState<FoodEntryEditorScreen> createState() =>
      _FoodEntryEditorScreenState();
}

class _FoodEntryEditorScreenState
    extends ConsumerState<FoodEntryEditorScreen> {
  final _descriptionController = TextEditingController();
  final _concernsController = TextEditingController();
  final _notesController = TextEditingController();

  ShiftType _shift = ShiftType.forTime(DateTime.now());
  MealType _mealType = MealType.lunch;
  Appetite _appetite = Appetite.good;
  DateTime _date = DateTime.now();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _descriptionController.text = e.description;
      _concernsController.text = e.concerns ?? '';
      _notesController.text = e.notes ?? '';
      _shift = e.shift;
      _mealType = e.mealType;
      _appetite = e.appetite;
      final parts = e.date.split('-');
      if (parts.length == 3) {
        _date = DateTime(
            int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
      }
    } else {
      // Default meal type based on time of day
      final hour = DateTime.now().hour;
      _mealType = hour < 10
          ? MealType.breakfast
          : hour < 14
              ? MealType.lunch
              : hour < 18
                  ? MealType.afternoonSnack
                  : MealType.dinner;
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _concernsController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String _dateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (picked != null && mounted) setState(() => _date = picked);
  }

  Future<void> _save() async {
    final description = _descriptionController.text.trim();
    if (description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(AppStrings.foodDescriptionRequired)),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final existing = widget.existing;
      final entry = FoodEntry(
        id: existing?.id ?? const Uuid().v4(),
        homeId: user?.homeId ?? 'dev-home-001',
        childId: widget.childId,
        date: _dateStr(_date),
        shift: _shift,
        mealType: _mealType,
        description: description,
        appetite: _appetite,
        concerns: _concernsController.text.trim().isEmpty
            ? null
            : _concernsController.text.trim(),
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        recordedById: user?.id ?? 'dev-user-001',
        recordedByName:
            user?.displayName ?? user?.email ?? 'Unknown',
        createdById: existing?.createdById ?? user?.id,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      );
      await ref.read(foodEntriesRepositoryProvider).save(entry);
      if (mounted) context.pop();
    } catch (e, st) {
      log('Food entry save failed',
          error: e, stackTrace: st, name: 'FoodEntryEditor');
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
        title: Text(
            isEditing ? AppStrings.foodEditEntry : AppStrings.foodNewEntry),
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
          // Date + shift
          Row(
            children: [
              Expanded(
                child: _PickerTile(
                  icon: Icons.calendar_today_outlined,
                  label: '${_date.day}/${_date.month}/${_date.year}',
                  onTap: _pickDate,
                  colors: colors,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xs),
                decoration: BoxDecoration(
                  border: Border.all(color: colors.outline),
                  borderRadius: BorderRadius.circular(AppRadius.input),
                ),
                child: DropdownButton<ShiftType>(
                  value: _shift,
                  underline: const SizedBox(),
                  items: ShiftType.values
                      .map((s) => DropdownMenuItem(
                            value: s,
                            child: Text(s.displayName,
                                style: AppTextStyles.small(
                                    colors.onSurface)),
                          ))
                      .toList(),
                  onChanged: (v) {
                    if (v != null) setState(() => _shift = v);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          // Meal type
          _Label(AppStrings.foodMealType, colors),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: MealType.values.map((m) {
              final sel = _mealType == m;
              final col = _mealColor(m);
              return FilterChip(
                label: Text(m.displayName),
                selected: sel,
                onSelected: (_) => setState(() => _mealType = m),
                selectedColor: col.withAlpha(40),
                checkmarkColor: col,
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Description
          _Label(AppStrings.foodDescription, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _descriptionController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: AppStrings.foodDescriptionHint,
              border: OutlineInputBorder(),
            ),
            autofocus: widget.existing == null,
          ),
          const SizedBox(height: AppSpacing.lg),

          // Appetite
          _Label(AppStrings.foodAppetite, colors),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            children: Appetite.values.map((a) {
              final sel = _appetite == a;
              final col = _appetiteColor(a);
              return FilterChip(
                label: Text(a.displayName),
                selected: sel,
                onSelected: (_) => setState(() => _appetite = a),
                selectedColor: col.withAlpha(40),
                checkmarkColor: col,
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Concerns
          _Label(AppStrings.foodConcerns, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _concernsController,
            maxLines: 2,
            decoration: const InputDecoration(
              hintText: AppStrings.foodConcernsHint,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Notes
          _Label(AppStrings.notesOptional, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _notesController,
            maxLines: 2,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),

          FilledButton(
            onPressed: _saving ? null : _save,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.green,
              minimumSize: const Size.fromHeight(AppTapTarget.min),
            ),
            child: const Text(AppStrings.save),
          ),
        ],
      ),
    );
  }

  Color _mealColor(MealType m) => switch (m) {
        MealType.breakfast => AppColors.amber,
        MealType.morningSnack => const Color(0xFFD4892A),
        MealType.lunch => AppColors.teal400,
        MealType.afternoonSnack => AppColors.blue,
        MealType.dinner => AppColors.green,
        MealType.eveningSnack => AppColors.roleSupportWorker,
        MealType.other => AppColors.slate400,
      };

  Color _appetiteColor(Appetite a) => switch (a) {
        Appetite.good => AppColors.green,
        Appetite.fair => AppColors.amber,
        Appetite.poor => AppColors.red,
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

class _PickerTile extends StatelessWidget {
  const _PickerTile({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.colors,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
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
              Icon(icon, size: 16, color: colors.onSurfaceVariant),
              const SizedBox(width: AppSpacing.sm),
              Text(label,
                  style: AppTextStyles.small(colors.onSurface)),
            ],
          ),
        ),
      );
}
