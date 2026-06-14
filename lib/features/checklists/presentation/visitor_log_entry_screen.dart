import 'dart:developer';

import 'package:flutter/material.dart';
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
import '../domain/visitor_log_entry.dart';
import 'providers/visitor_log_provider.dart';

class VisitorLogEntryScreen extends ConsumerStatefulWidget {
  const VisitorLogEntryScreen({super.key, this.existing});

  final VisitorLogEntry? existing;

  @override
  ConsumerState<VisitorLogEntryScreen> createState() =>
      _VisitorLogEntryScreenState();
}

class _VisitorLogEntryScreenState extends ConsumerState<VisitorLogEntryScreen> {
  final _nameController = TextEditingController();
  final _purposeController = TextEditingController();
  final _authorisedByController = TextEditingController();
  final _notesController = TextEditingController();
  String? _selectedRelation;
  // late: assigned unconditionally in initState before first use.
  late DateTime _arrivedAt;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    _nameController.text = e?.visitorName ?? '';
    _purposeController.text = e?.purpose ?? '';
    _authorisedByController.text = e?.authorisedBy ?? '';
    _notesController.text = e?.notes ?? '';
    _selectedRelation = e?.relation;
    _arrivedAt = e?.arrivedAt ?? DateTime.now();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _purposeController.dispose();
    _authorisedByController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickArrivalTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_arrivedAt),
    );
    if (picked != null && mounted) {
      setState(() {
        _arrivedAt = DateTime(
          _arrivedAt.year,
          _arrivedAt.month,
          _arrivedAt.day,
          picked.hour,
          picked.minute,
        );
      });
    }
  }

  Future<void> _save() async {
    final name = _nameController.text.trim();
    final purpose = _purposeController.text.trim();
    final authorisedBy = _authorisedByController.text.trim();

    if (name.isEmpty || purpose.isEmpty || authorisedBy.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.visitorRequiredFields)),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final existing = widget.existing;
      final entry = VisitorLogEntry(
        id: existing?.id ?? const Uuid().v4(),
        homeId: user?.homeId ?? 'dev-home-001',
        visitorName: name,
        relation: _selectedRelation,
        purpose: purpose,
        authorisedBy: authorisedBy,
        arrivedAt: _arrivedAt.toUtc(),
        departedAt: existing?.departedAt,
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        recordedById: user?.id ?? 'dev-user-001',
        recordedByName: user?.displayName ?? user?.email ?? 'Unknown',
        createdById: existing?.createdById ?? user?.id,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      );
      await ref.read(visitorLogRepositoryProvider).save(entry);
      if (mounted) context.pop();
    } catch (e, st) {
      log(
        'Visitor log save failed',
        error: e,
        stackTrace: st,
        name: 'VisitorLogEntry',
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
    final timeFmt = DateFormat('HH:mm', 'en_GB');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? AppStrings.visitorLogEdit : AppStrings.visitorLogNew,
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
          // Arrival time
          const _SectionLabel(AppStrings.visitorArrivalTime),
          const SizedBox(height: AppSpacing.sm),
          InkWell(
            onTap: _pickArrivalTime,
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
                    Icons.access_time,
                    color: colors.onSurfaceVariant,
                    size: 20,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    timeFmt.format(_arrivedAt.toUk()),
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

          // Visitor name
          const _SectionLabel(AppStrings.visitorName),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _nameController,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              hintText: AppStrings.visitorNameHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppRadius.input),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Relation chips
          const _SectionLabel(AppStrings.visitorRelation),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: visitorRelations.map((r) {
              final selected = _selectedRelation == r;
              return FilterChip(
                label: Text(r),
                selected: selected,
                onSelected: (_) =>
                    setState(() => _selectedRelation = selected ? null : r),
                selectedColor: colors.primaryContainer,
                checkmarkColor: colors.primary,
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Purpose
          const _SectionLabel(AppStrings.visitorPurpose),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _purposeController,
            decoration: const InputDecoration(
              hintText: AppStrings.visitorPurposeHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppRadius.input),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Authorised by
          const _SectionLabel(AppStrings.visitorAuthorisedBy),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _authorisedByController,
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              hintText: AppStrings.visitorAuthorisedByHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppRadius.input),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Notes
          const _SectionLabel(AppStrings.notesOptional),
          const SizedBox(height: AppSpacing.sm),
          TextField(
            controller: _notesController,
            maxLines: 3,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppRadius.input),
                ),
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
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: AppTextStyles.label(Theme.of(context).colorScheme.onSurfaceVariant),
  );
}
