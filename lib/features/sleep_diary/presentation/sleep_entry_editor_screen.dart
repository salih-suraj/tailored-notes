import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../shared/models/app_strings.dart';
import '../domain/sleep_entry.dart';
import 'providers/sleep_diary_provider.dart';

class SleepEntryEditorScreen extends ConsumerStatefulWidget {
  const SleepEntryEditorScreen({
    super.key,
    required this.childId,
    this.existing,
  });

  final String childId;
  final SleepEntry? existing;

  @override
  ConsumerState<SleepEntryEditorScreen> createState() =>
      _SleepEntryEditorScreenState();
}

class _SleepEntryEditorScreenState
    extends ConsumerState<SleepEntryEditorScreen> {
  final _notesController = TextEditingController();
  final _wakingsController = TextEditingController();

  ShiftType _shift = ShiftType.night;
  SleepQuality _quality = SleepQuality.fair;
  String? _bedTime;
  String? _settledTime;
  String? _wakeTime;
  DateTime _date = DateTime.now();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _notesController.text = e.notes ?? '';
      _wakingsController.text =
          e.numberOfWakings > 0 ? '${e.numberOfWakings}' : '';
      _shift = e.shift;
      _quality = e.quality;
      _bedTime = e.bedTime;
      _settledTime = e.settledTime;
      _wakeTime = e.wakeTime;
      final parts = e.date.split('-');
      if (parts.length == 3) {
        _date = DateTime(
            int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
      }
    } else {
      _shift = ShiftType.forTime(DateTime.now());
    }
  }

  @override
  void dispose() {
    _notesController.dispose();
    _wakingsController.dispose();
    super.dispose();
  }

  String _dateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  String _timeStr(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (picked != null && mounted) setState(() => _date = picked);
  }

  Future<void> _pickTime(
      String label, String? current, ValueSetter<String?> onPicked) async {
    TimeOfDay initial = TimeOfDay.now();
    if (current != null) {
      final parts = current.split(':');
      if (parts.length == 2) {
        initial = TimeOfDay(
            hour: int.parse(parts[0]), minute: int.parse(parts[1]));
      }
    }
    final picked =
        await showTimePicker(context: context, initialTime: initial);
    if (picked != null && mounted) onPicked(_timeStr(picked));
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final existing = widget.existing;
      final entry = SleepEntry(
        id: existing?.id ?? const Uuid().v4(),
        homeId: user?.homeId ?? 'dev-home-001',
        childId: widget.childId,
        date: _dateStr(_date),
        shift: _shift,
        bedTime: _bedTime,
        settledTime: _settledTime,
        wakeTime: _wakeTime,
        numberOfWakings:
            int.tryParse(_wakingsController.text.trim()) ?? 0,
        quality: _quality,
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
      await ref.read(sleepEntriesRepositoryProvider).save(entry);
      if (mounted) context.pop();
    } catch (e, st) {
      log('Sleep entry save failed',
          error: e, stackTrace: st, name: 'SleepEntryEditor');
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
            ? AppStrings.sleepEditEntry
            : AppStrings.sleepNewEntry),
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
          // Date + shift row
          Row(
            children: [
              Expanded(
                child: _PickerRow(
                  icon: Icons.calendar_today_outlined,
                  label: _date.day == DateTime.now().day &&
                          _date.month == DateTime.now().month
                      ? AppStrings.sleepTonight
                      : '${_date.day}/${_date.month}/${_date.year}',
                  onTap: _pickDate,
                  colors: colors,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              _ShiftChips(
                selected: _shift,
                onChanged: (s) => setState(() => _shift = s),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          // Sleep quality
          _Label(AppStrings.sleepQuality, colors),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            children: SleepQuality.values.map((q) {
              final sel = _quality == q;
              final col = _qualityColor(q);
              return FilterChip(
                label: Text(q.displayName),
                selected: sel,
                onSelected: (_) => setState(() => _quality = q),
                selectedColor: col.withAlpha(40),
                checkmarkColor: col,
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Time pickers
          _Label(AppStrings.sleepTimes, colors),
          const SizedBox(height: AppSpacing.sm),
          _TimeRow(
            icon: Icons.bedtime_outlined,
            label: AppStrings.sleepBedTime,
            value: _bedTime,
            onTap: () => _pickTime(
                AppStrings.sleepBedTime, _bedTime,
                (t) => setState(() => _bedTime = t)),
            onClear: _bedTime != null
                ? () => setState(() => _bedTime = null)
                : null,
            colors: colors,
          ),
          const SizedBox(height: AppSpacing.sm),
          _TimeRow(
            icon: Icons.nights_stay_outlined,
            label: AppStrings.sleepSettledTime,
            value: _settledTime,
            onTap: () => _pickTime(
                AppStrings.sleepSettledTime, _settledTime,
                (t) => setState(() => _settledTime = t)),
            onClear: _settledTime != null
                ? () => setState(() => _settledTime = null)
                : null,
            colors: colors,
          ),
          const SizedBox(height: AppSpacing.sm),
          _TimeRow(
            icon: Icons.wb_sunny_outlined,
            label: AppStrings.sleepWakeTime,
            value: _wakeTime,
            onTap: () => _pickTime(
                AppStrings.sleepWakeTime, _wakeTime,
                (t) => setState(() => _wakeTime = t)),
            onClear: _wakeTime != null
                ? () => setState(() => _wakeTime = null)
                : null,
            colors: colors,
          ),
          const SizedBox(height: AppSpacing.lg),

          // Number of wakings
          _Label(AppStrings.sleepWakingsLabel, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _wakingsController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              hintText: '0',
              suffixText: AppStrings.sleepWakingsSuffix,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Notes
          _Label(AppStrings.notesOptional, colors),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _notesController,
            maxLines: 3,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),

          FilledButton(
            onPressed: _saving ? null : _save,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.roleSupportWorker,
              minimumSize: const Size.fromHeight(AppTapTarget.min),
            ),
            child: const Text(AppStrings.save),
          ),
        ],
      ),
    );
  }

  Color _qualityColor(SleepQuality q) => switch (q) {
        SleepQuality.good => AppColors.green,
        SleepQuality.fair => AppColors.amber,
        SleepQuality.poor => AppColors.red,
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

class _PickerRow extends StatelessWidget {
  const _PickerRow({
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

class _TimeRow extends StatelessWidget {
  const _TimeRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
    required this.colors,
    this.onClear,
  });
  final IconData icon;
  final String label;
  final String? value;
  final VoidCallback onTap;
  final VoidCallback? onClear;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
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
              Icon(icon, size: 18, color: colors.onSurfaceVariant),
              const SizedBox(width: AppSpacing.sm),
              Text(label,
                  style: AppTextStyles.small(colors.onSurfaceVariant)),
              const Spacer(),
              if (value != null) ...[
                Text(value!,
                    style: AppTextStyles.body(colors.onSurface)),
                if (onClear != null) ...[
                  const SizedBox(width: AppSpacing.sm),
                  GestureDetector(
                    onTap: onClear,
                    child: Icon(Icons.clear,
                        size: 16, color: colors.onSurfaceVariant),
                  ),
                ],
              ] else
                Text(AppStrings.sleepTap,
                    style: AppTextStyles.small(colors.primary)),
            ],
          ),
        ),
      );
}

class _ShiftChips extends StatelessWidget {
  const _ShiftChips(
      {required this.selected, required this.onChanged});
  final ShiftType selected;
  final ValueChanged<ShiftType> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
      decoration: BoxDecoration(
        border: Border.all(color: colors.outline),
        borderRadius: BorderRadius.circular(AppRadius.input),
      ),
      child: DropdownButton<ShiftType>(
        value: selected,
        underline: const SizedBox(),
        items: ShiftType.values
            .map((s) => DropdownMenuItem(
                  value: s,
                  child: Text(s.displayName,
                      style: AppTextStyles.small(colors.onSurface)),
                ))
            .toList(),
        onChanged: (v) {
          if (v != null) onChanged(v);
        },
      ),
    );
  }
}
