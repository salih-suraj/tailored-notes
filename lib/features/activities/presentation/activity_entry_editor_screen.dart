import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/time/uk_time.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../shared/models/app_strings.dart';
import '../domain/activity_entry.dart';
import 'providers/activities_provider.dart';

class ActivityEntryEditorScreen extends ConsumerStatefulWidget {
  const ActivityEntryEditorScreen({
    super.key,
    required this.childId,
    this.existing,
  });

  final String childId;
  final ActivityEntry? existing;

  @override
  ConsumerState<ActivityEntryEditorScreen> createState() =>
      _ActivityEntryEditorScreenState();
}

class _ActivityEntryEditorScreenState
    extends ConsumerState<ActivityEntryEditorScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _durationController = TextEditingController();
  final _achievementController = TextEditingController();

  ShiftType _shift = ShiftType.forTime(DateTime.now());
  ActivityCategory _category = ActivityCategory.social;
  bool _rewardEarned = false;
  DateTime _date = UkTime.now();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _titleController.text = e.title;
      _descriptionController.text = e.description ?? '';
      _durationController.text = e.durationMinutes != null
          ? '${e.durationMinutes}'
          : '';
      _achievementController.text = e.achievement ?? '';
      _shift = e.shift;
      _category = e.category;
      _rewardEarned = e.rewardEarned;
      final parts = e.date.split('-');
      if (parts.length == 3) {
        _date = DateTime(
          int.parse(parts[0]),
          int.parse(parts[1]),
          int.parse(parts[2]),
        );
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _durationController.dispose();
    _achievementController.dispose();
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
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.activitiesTitleRequired)),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final existing = widget.existing;
      final entry = ActivityEntry(
        id: existing?.id ?? const Uuid().v4(),
        homeId: user?.homeId ?? 'dev-home-001',
        childId: widget.childId,
        date: _dateStr(_date),
        shift: _shift,
        category: _category,
        title: title,
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        durationMinutes: int.tryParse(_durationController.text.trim()),
        rewardEarned: _rewardEarned,
        achievement: _achievementController.text.trim().isEmpty
            ? null
            : _achievementController.text.trim(),
        recordedById: user?.id ?? 'dev-user-001',
        recordedByName: user?.displayName ?? user?.email ?? 'Unknown',
        createdById: existing?.createdById ?? user?.id,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      );
      await ref.read(activityEntriesRepositoryProvider).save(entry);
      if (mounted) context.pop();
    } catch (e, st) {
      log(
        'Activity save failed',
        error: e,
        stackTrace: st,
        name: 'ActivityEditor',
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
              ? AppStrings.activitiesEditEntry
              : AppStrings.activitiesNewEntry,
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
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                decoration: BoxDecoration(
                  border: Border.all(color: colors.outline),
                  borderRadius: BorderRadius.circular(AppRadius.input),
                ),
                child: DropdownButton<ShiftType>(
                  value: _shift,
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
                    if (v != null) setState(() => _shift = v);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          // Category
          _Label(AppStrings.activitiesCategory, colors),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: ActivityCategory.values.map((c) {
              final sel = _category == c;
              final col = _categoryColor(c);
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
          _Label(AppStrings.activitiesTitle_, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _titleController,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              hintText: AppStrings.activitiesTitleHint,
              border: OutlineInputBorder(),
            ),
            autofocus: widget.existing == null,
          ),
          const SizedBox(height: AppSpacing.lg),

          // Description
          _Label(AppStrings.activitiesDescription, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _descriptionController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: AppStrings.activitiesDescriptionHint,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Duration
          _Label(AppStrings.activitiesDuration, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _durationController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              hintText: '30',
              suffixText: AppStrings.activitiesDurationUnit,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Reward earned toggle
          Container(
            decoration: BoxDecoration(
              color: _rewardEarned ? AppColors.amber.withAlpha(15) : null,
              border: Border.all(
                color: _rewardEarned
                    ? AppColors.amber.withAlpha(80)
                    : colors.outline,
              ),
              borderRadius: BorderRadius.circular(AppRadius.card),
            ),
            child: SwitchListTile(
              value: _rewardEarned,
              onChanged: (v) => setState(() => _rewardEarned = v),
              title: Text(
                AppStrings.activitiesRewardEarned,
                style: AppTextStyles.body(
                  _rewardEarned ? AppColors.amber : colors.onSurface,
                ),
              ),
              subtitle: Text(
                AppStrings.activitiesRewardSubtitle,
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
              secondary: Icon(
                Icons.star,
                color: _rewardEarned
                    ? AppColors.amber
                    : colors.onSurfaceVariant,
              ),
              activeThumbColor: AppColors.amber,
              dense: true,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Achievement highlight
          _Label(AppStrings.activitiesAchievement, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _achievementController,
            maxLines: 2,
            decoration: const InputDecoration(
              hintText: AppStrings.activitiesAchievementHint,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),

          FilledButton(
            onPressed: _saving ? null : _save,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.amber,
              minimumSize: const Size.fromHeight(AppTapTarget.min),
            ),
            child: const Text(AppStrings.save),
          ),
        ],
      ),
    );
  }

  Color _categoryColor(ActivityCategory c) => switch (c) {
    ActivityCategory.physical => AppColors.green,
    ActivityCategory.creative => AppColors.blue,
    ActivityCategory.educational => AppColors.teal400,
    ActivityCategory.social => AppColors.amber,
    ActivityCategory.community => AppColors.roleSupportWorker,
    ActivityCategory.lifeSkills => AppColors.purple,
    ActivityCategory.other => AppColors.slate400,
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
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: colors.outline),
        borderRadius: BorderRadius.circular(AppRadius.input),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: colors.onSurfaceVariant),
          const SizedBox(width: AppSpacing.sm),
          Text(label, style: AppTextStyles.small(colors.onSurface)),
        ],
      ),
    ),
  );
}
