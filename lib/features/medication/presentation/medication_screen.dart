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
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../features/daily_notes/domain/daily_note.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/med_administration.dart';
import '../domain/prescribed_med.dart';
import 'providers/medication_provider.dart';

class MedicationScreen extends ConsumerWidget {
  const MedicationScreen({super.key, required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medsAsync = ref.watch(prescribedMedsProvider(childId));
    final adminsAsync = ref.watch(todayAdminsProvider(childId));
    final childrenAsync = ref.watch(childrenProvider);
    final colors = Theme.of(context).colorScheme;

    final childName = childrenAsync.valueOrNull
            ?.where((c) => c.id == childId)
            .firstOrNull
            ?.name ??
        '';

    final today = DateFormat('d MMM yyyy').format(DateTime.now());
    final shift = ShiftType.forTime(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.medicationTitle),
            if (childName.isNotEmpty)
              Text(childName,
                  style: AppTextStyles.small(colors.onSurfaceVariant)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            tooltip: AppStrings.medAddPrescribed,
            onPressed: () =>
                context.push('/children/$childId/medication/meds/new'),
          ),
        ],
      ),
      body: switch ((medsAsync, adminsAsync)) {
        (AsyncError(:final error), _) || (_, AsyncError(:final error)) =>
          ErrorView(
            message: error.toString(),
            onRetry: () {
              ref.invalidate(prescribedMedsProvider(childId));
              ref.invalidate(todayAdminsProvider(childId));
            },
          ),
        (AsyncLoading(), _) || (_, AsyncLoading()) =>
          const LoadingSkeleton(),
        (AsyncData(value: final meds), AsyncData(value: final admins)) =>
          _MARBody(
            childId: childId,
            meds: meds,
            todayAdmins: admins,
            today: today,
            shift: shift,
          ),
        _ => const LoadingSkeleton(),
      },
    );
  }
}

// ── MAR body ──────────────────────────────────────────────────────────────────

class _MARBody extends ConsumerWidget {
  const _MARBody({
    required this.childId,
    required this.meds,
    required this.todayAdmins,
    required this.today,
    required this.shift,
  });

  final String childId;
  final List<PrescribedMed> meds;
  final List<MedAdministration> todayAdmins;
  final String today;
  final ShiftType shift;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final scheduled = meds.where((m) => !m.frequency.isPrn).toList();
    final prn = meds.where((m) => m.frequency.isPrn).toList();

    if (meds.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.medication_outlined, size: 56,
                color: colors.onSurfaceVariant),
            const SizedBox(height: AppSpacing.lg),
            Text(AppStrings.medNoMeds,
                style: AppTextStyles.body(colors.onSurfaceVariant)),
            const SizedBox(height: AppSpacing.sm),
            Text(AppStrings.medNoMedsHint,
                style: AppTextStyles.small(colors.onSurfaceVariant)),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        // Date + shift header
        Row(
          children: [
            Text(today,
                style: AppTextStyles.body(colors.onSurfaceVariant)),
            const SizedBox(width: AppSpacing.sm),
            _ShiftBadge(shift: shift),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),

        if (scheduled.isNotEmpty) ...[
          Text(AppStrings.medScheduled,
              style: AppTextStyles.label(colors.onSurfaceVariant)),
          const SizedBox(height: AppSpacing.sm),
          ...scheduled.map((med) {
            final record = _latestRecordForMed(med.id, todayAdmins);
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: _MedCard(
                med: med,
                latestAdmin: record,
                onAdminister: () =>
                    _showAdminSheet(context, ref, med, record),
                onDelete: () => _confirmDelete(context, ref, med.id),
              ),
            );
          }),
          const SizedBox(height: AppSpacing.lg),
        ],

        if (prn.isNotEmpty) ...[
          Text(AppStrings.medPrn,
              style: AppTextStyles.label(colors.onSurfaceVariant)),
          const SizedBox(height: AppSpacing.sm),
          ...prn.map((med) {
            final records =
                todayAdmins.where((a) => a.prescribedMedId == med.id).toList();
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: _PrnMedCard(
                med: med,
                todayRecords: records,
                onAdminister: () =>
                    _showAdminSheet(context, ref, med, null),
                onDelete: () => _confirmDelete(context, ref, med.id),
              ),
            );
          }),
        ],

        const SizedBox(height: 80),
      ],
    );
  }

  MedAdministration? _latestRecordForMed(
      String medId, List<MedAdministration> admins) {
    final records = admins
        .where((a) => a.prescribedMedId == medId)
        .toList()
      ..sort((a, b) => b.administeredAt.compareTo(a.administeredAt));
    return records.isEmpty ? null : records.first;
  }

  Future<void> _showAdminSheet(
    BuildContext context,
    WidgetRef ref,
    PrescribedMed med,
    MedAdministration? existing,
  ) =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (_) => _AdminSheet(med: med, existing: existing),
      );

  Future<void> _confirmDelete(
      BuildContext context, WidgetRef ref, String id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.medDeleteTitle),
        content: const Text(AppStrings.medDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(foregroundColor: Theme.of(dialogContext).colorScheme.error),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(medicationRepositoryProvider).deleteMed(id);
    }
  }
}

// ── Scheduled med card ────────────────────────────────────────────────────────

class _MedCard extends StatelessWidget {
  const _MedCard({
    required this.med,
    required this.latestAdmin,
    required this.onAdminister,
    required this.onDelete,
  });

  final PrescribedMed med;
  final MedAdministration? latestAdmin;
  final VoidCallback onAdminister;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final outcome = latestAdmin?.outcome;
    final outcomeColor = switch (outcome) {
      AdminOutcome.administered => AppColors.green,
      AdminOutcome.refused => AppColors.red,
      AdminOutcome.held => AppColors.amber,
      null => colors.onSurfaceVariant,
    };
    final outcomeIcon = switch (outcome) {
      AdminOutcome.administered => Icons.check_circle,
      AdminOutcome.refused => Icons.cancel_outlined,
      AdminOutcome.held => Icons.pause_circle_outline,
      null => Icons.radio_button_unchecked,
    };

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: InkWell(
        onTap: onAdminister,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              Icon(outcomeIcon, color: outcomeColor, size: 28),
              const SizedBox(width: AppSpacing.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(med.medicationName,
                        style: AppTextStyles.h3(colors.onSurface)),
                    Text(
                      '${med.dose} · ${med.route.displayName} · ${med.frequency.displayName}',
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                    ),
                    if (med.instructions != null) ...[
                      const SizedBox(height: 2),
                      Text(med.instructions!,
                          style: AppTextStyles.small(colors.onSurfaceVariant),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                    if (latestAdmin != null) ...[
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        '${outcome!.displayName} · ${DateFormat('HH:mm').format(latestAdmin!.administeredAt.toUk())} · ${latestAdmin!.administeredByName}',
                        style: AppTextStyles.small(outcomeColor),
                      ),
                    ],
                  ],
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert,
                    size: 18, color: colors.onSurfaceVariant),
                tooltip: AppStrings.recordOptions,
                onSelected: (v) {
                  if (v == 'delete') onDelete();
                },
                itemBuilder: (_) => [
                  const PopupMenuItem(
                      value: 'delete', child: Text(AppStrings.delete)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── PRN med card ──────────────────────────────────────────────────────────────

class _PrnMedCard extends StatelessWidget {
  const _PrnMedCard({
    required this.med,
    required this.todayRecords,
    required this.onAdminister,
    required this.onDelete,
  });

  final PrescribedMed med;
  final List<MedAdministration> todayRecords;
  final VoidCallback onAdminister;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(med.medicationName,
                          style: AppTextStyles.h3(colors.onSurface)),
                      Text(
                        '${med.dose} · ${med.route.displayName}',
                        style: AppTextStyles.small(colors.onSurfaceVariant),
                      ),
                      if (med.instructions != null)
                        Text(med.instructions!,
                            style:
                                AppTextStyles.small(colors.onSurfaceVariant),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                FilledButton.icon(
                  onPressed: onAdminister,
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text(AppStrings.medRecord),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert,
                      size: 18,
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                  tooltip: AppStrings.recordOptions,
                  onSelected: (v) {
                    if (v == 'delete') onDelete();
                  },
                  itemBuilder: (_) => [
                    const PopupMenuItem(
                        value: 'delete', child: Text(AppStrings.delete)),
                  ],
                ),
              ],
            ),
            if (todayRecords.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.sm),
              const Divider(height: 1),
              const SizedBox(height: AppSpacing.sm),
              Text(
                '${AppStrings.medTodayCount}: ${todayRecords.length}',
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
              ...todayRecords.map(
                (r) => Text(
                  '${DateFormat('HH:mm').format(r.administeredAt.toUk())} · ${r.outcome.displayName}${r.reason != null ? ' · ${r.reason}' : ''}',
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ── Administration bottom sheet ───────────────────────────────────────────────

class _AdminSheet extends ConsumerStatefulWidget {
  const _AdminSheet({required this.med, this.existing});

  final PrescribedMed med;
  final MedAdministration? existing;

  @override
  ConsumerState<_AdminSheet> createState() => _AdminSheetState();
}

class _AdminSheetState extends ConsumerState<_AdminSheet> {
  final _reasonController = TextEditingController();
  final _notesController = TextEditingController();
  AdminOutcome _outcome = AdminOutcome.administered;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    if (widget.existing != null) {
      _outcome = widget.existing!.outcome;
      _reasonController.text = widget.existing!.reason ?? '';
      _notesController.text = widget.existing!.notes ?? '';
    }
  }

  @override
  void dispose() {
    _reasonController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  bool get _reasonRequired =>
      _outcome != AdminOutcome.administered || widget.med.frequency.isPrn;

  Future<void> _save() async {
    if (_reasonRequired && _reasonController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.medReasonRequired)),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      final existing = widget.existing;
      final admin = MedAdministration(
        id: existing?.id ?? const Uuid().v4(),
        homeId: user?.homeId ?? 'dev-home-001',
        childId: widget.med.childId,
        prescribedMedId: widget.med.id,
        medicationName: widget.med.medicationName,
        dose: widget.med.dose,
        outcome: _outcome,
        shift: ShiftType.forTime(DateTime.now()),
        administeredAt: existing?.administeredAt ?? now,
        administeredById: user?.id ?? 'dev-user-001',
        administeredByName:
            user?.displayName ?? user?.email ?? 'Unknown',
        reason: _reasonController.text.trim().isEmpty
            ? null
            : _reasonController.text.trim(),
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        createdById: existing?.createdById ?? user?.id,
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      );
      await ref
          .read(medicationRepositoryProvider)
          .recordAdministration(admin);
      if (mounted) Navigator.of(context).pop();
    } catch (e, st) {
      log('Admin save failed', error: e, stackTrace: st,
          name: 'AdminSheet');
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

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.xl,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.med.medicationName,
                          style: AppTextStyles.h3(colors.onSurface)),
                      Text(
                        '${widget.med.dose} · ${widget.med.route.displayName}',
                        style: AppTextStyles.small(colors.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                  tooltip: AppStrings.cancel,
                ),
              ],
            ),
            if (widget.med.instructions != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.amber.withAlpha(20),
                  borderRadius: BorderRadius.circular(AppRadius.button),
                ),
                child: Text(
                  widget.med.instructions!,
                  style: AppTextStyles.small(AppColors.amber),
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.lg),

            // Outcome selector
            Text(AppStrings.medOutcome,
                style: AppTextStyles.label(colors.onSurfaceVariant)),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: AdminOutcome.values.map((o) {
                final sel = _outcome == o;
                final col = _outcomeColor(o);
                return FilterChip(
                  label: Text(o.displayName),
                  selected: sel,
                  onSelected: (_) => setState(() => _outcome = o),
                  selectedColor: col.withAlpha(40),
                  checkmarkColor: col,
                );
              }).toList(),
            ),
            const SizedBox(height: AppSpacing.md),

            // Reason
            Text(
              _reasonRequired
                  ? AppStrings.medReasonLabel
                  : AppStrings.medReasonOptional,
              style: AppTextStyles.label(colors.onSurfaceVariant),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _reasonController,
              maxLines: 2,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              autofocus: _outcome != AdminOutcome.administered,
            ),
            const SizedBox(height: AppSpacing.md),

            // Notes
            Text(AppStrings.notesOptional,
                style: AppTextStyles.label(colors.onSurfaceVariant)),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _notesController,
              maxLines: 2,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: AppSpacing.lg),

            FilledButton(
              onPressed: _saving ? null : _save,
              style: FilledButton.styleFrom(
                backgroundColor: _outcomeColor(_outcome),
                minimumSize: const Size.fromHeight(AppTapTarget.min),
              ),
              child: _saving
                  ? const SizedBox(
                      width: 20, height: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: AppColors.white))
                  : Text(_outcome.displayName),
            ),
          ],
        ),
      ),
    );
  }

  Color _outcomeColor(AdminOutcome o) => switch (o) {
        AdminOutcome.administered => AppColors.green,
        AdminOutcome.refused => AppColors.red,
        AdminOutcome.held => AppColors.amber,
      };
}

class _ShiftBadge extends StatelessWidget {
  const _ShiftBadge({required this.shift});
  final ShiftType shift;

  @override
  Widget build(BuildContext context) {
    final color = switch (shift) {
      ShiftType.morning => AppColors.amber,
      ShiftType.afternoon => AppColors.teal400,
      ShiftType.night => AppColors.roleSupportWorker,
    };
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(shift.displayName, style: AppTextStyles.label(color)),
    );
  }
}

