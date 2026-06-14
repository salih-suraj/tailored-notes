import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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
import '../domain/bath_temp_record.dart';
import 'providers/bath_temp_provider.dart';

class BathTempScreen extends ConsumerWidget {
  const BathTempScreen({super.key, required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenAsync = ref.watch(childrenProvider);
    final recordsAsync = ref.watch(bathTempTodayProvider(childId));
    final colors = Theme.of(context).colorScheme;

    final childName =
        childrenAsync.valueOrNull
            ?.where((c) => c.id == childId)
            .firstOrNull
            ?.name ??
        '';

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.bathTempTitle),
            if (childName.isNotEmpty)
              Text(
                childName,
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
          ],
        ),
      ),
      body: recordsAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(bathTempTodayProvider(childId)),
        ),
        data: (records) {
          if (records.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.thermostat_outlined,
                    size: 56,
                    color: colors.onSurfaceVariant,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    AppStrings.bathTempNoRecords,
                    style: AppTextStyles.body(colors.onSurfaceVariant),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    AppStrings.bathTempNoRecordsHint,
                    style: AppTextStyles.small(colors.onSurfaceVariant),
                  ),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: records.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (_, i) => _BathTempCard(
              record: records[i],
              onDelete: () => _confirmDelete(context, ref, records[i].id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showEntrySheet(context, ref),
        backgroundColor: AppColors.teal400,
        foregroundColor: AppColors.white,
        icon: const Icon(Icons.add),
        label: const Text(AppStrings.bathTempRecord),
      ),
    );
  }

  Future<void> _showEntrySheet(BuildContext context, WidgetRef ref) =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (_) => _BathTempEntrySheet(childId: childId),
      );

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    String id,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.bathTempDeleteTitle),
        content: const Text(AppStrings.bathTempDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(dialogContext).colorScheme.error,
            ),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      try {
        await ref.read(bathTempRepositoryProvider).delete(id);
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
  }
}

// ── Record card ──────────────────────────────────────────────────────────────

class _BathTempCard extends StatelessWidget {
  const _BathTempCard({required this.record, required this.onDelete});

  final BathTempRecord record;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final status = bathTempStatus(record.temperatureCelsius);
    final indicatorColor = _statusColor(status);
    final statusLabel = _statusLabel(status);
    final timeStr = DateFormat(
      'HH:mm',
      'en_GB',
    ).format(record.recordedAt.toUk());
    final shiftColor = switch (record.shift) {
      ShiftType.morning => AppColors.amber,
      ShiftType.afternoon => AppColors.teal400,
      ShiftType.night => AppColors.roleSupportWorker,
    };

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: indicatorColor.withAlpha(20),
                borderRadius: BorderRadius.circular(AppRadius.card),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    record.temperatureCelsius.toStringAsFixed(1),
                    style: AppTextStyles.h2(indicatorColor),
                  ),
                  Text('°C', style: AppTextStyles.small(indicatorColor)),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _ShiftBadge(
                        label: record.shift.displayName,
                        color: shiftColor,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        timeStr,
                        style: AppTextStyles.small(colors.onSurfaceVariant),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(statusLabel, style: AppTextStyles.body(indicatorColor)),
                  Text(
                    record.recordedByName,
                    style: AppTextStyles.small(colors.onSurfaceVariant),
                  ),
                  if (record.notes != null && record.notes!.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      record.notes!,
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert,
                size: 18,
                color: colors.onSurfaceVariant,
              ),
              tooltip: AppStrings.recordOptions,
              onSelected: (v) {
                if (v == 'delete') onDelete();
              },
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: 'delete',
                  child: Text(AppStrings.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _statusColor(BathTempStatus s) => switch (s) {
    BathTempStatus.safe => AppColors.green,
    BathTempStatus.tooCold => AppColors.blue,
    BathTempStatus.tooHot => AppColors.red,
  };

  String _statusLabel(BathTempStatus s) => switch (s) {
    BathTempStatus.safe => AppStrings.bathTempSafe,
    BathTempStatus.tooCold => AppStrings.bathTempCold,
    BathTempStatus.tooHot => AppStrings.bathTempHot,
  };
}

class _ShiftBadge extends StatelessWidget {
  const _ShiftBadge({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
    decoration: BoxDecoration(
      color: color.withAlpha(30),
      borderRadius: BorderRadius.circular(AppRadius.pill),
    ),
    child: Text(label, style: AppTextStyles.label(color)),
  );
}

// ── Entry bottom sheet ───────────────────────────────────────────────────────

class _BathTempEntrySheet extends ConsumerStatefulWidget {
  const _BathTempEntrySheet({required this.childId});
  final String childId;

  @override
  ConsumerState<_BathTempEntrySheet> createState() =>
      _BathTempEntrySheetState();
}

class _BathTempEntrySheetState extends ConsumerState<_BathTempEntrySheet> {
  final _tempController = TextEditingController();
  final _notesController = TextEditingController();
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _tempController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final raw = _tempController.text.trim();
    final temp = double.tryParse(raw);
    if (temp == null || temp < 20 || temp > 55) {
      setState(() => _error = AppStrings.bathTempInvalid);
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      final user = ref.read(currentUserProvider);
      final now = DateTime.now().toUtc();
      await ref
          .read(bathTempRepositoryProvider)
          .save(
            BathTempRecord(
              id: const Uuid().v4(),
              homeId: user?.homeId ?? 'dev-home-001',
              childId: widget.childId,
              temperatureCelsius: temp,
              shift: ShiftType.forTime(DateTime.now()),
              recordedAt: now,
              recordedById: user?.id ?? 'dev-user-001',
              recordedByName: user?.displayName ?? user?.email ?? 'Unknown',
              notes: _notesController.text.trim().isEmpty
                  ? null
                  : _notesController.text.trim(),
              createdAt: now,
              updatedAt: now,
            ),
          );
      if (mounted) Navigator.of(context).pop();
    } catch (e, st) {
      log(
        'Bath temp save failed',
        error: e,
        stackTrace: st,
        name: 'BathTempSheet',
      );
      if (mounted) {
        setState(() {
          _saving = false;
          _error = AppStrings.saveFailed;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final raw = _tempController.text.trim();
    final temp = double.tryParse(raw);
    final status = temp != null ? bathTempStatus(temp) : null;
    final indicatorColor = switch (status) {
      BathTempStatus.safe => AppColors.green,
      BathTempStatus.tooCold => AppColors.blue,
      BathTempStatus.tooHot => AppColors.red,
      null => colors.onSurfaceVariant,
    };

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.xl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                AppStrings.bathTempRecord,
                style: AppTextStyles.h3(colors.onSurface),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
                tooltip: AppStrings.cancel,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          TextField(
            controller: _tempController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d{0,2}\.?\d{0,1}')),
            ],
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSans(
              fontSize: 48,
              fontWeight: FontWeight.w600,
              color: indicatorColor,
            ),
            decoration: InputDecoration(
              hintText: '38.0',
              hintStyle: GoogleFonts.dmSans(
                fontSize: 48,
                fontWeight: FontWeight.w600,
                color: colors.onSurfaceVariant.withAlpha(80),
              ),
              suffix: Text('°C', style: AppTextStyles.h1(indicatorColor)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.input),
              ),
              errorText: _error,
            ),
            onChanged: (_) => setState(() => _error = null),
            autofocus: true,
          ),
          if (status != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Center(
              child: Text(switch (status) {
                BathTempStatus.safe => AppStrings.bathTempSafe,
                BathTempStatus.tooCold => AppStrings.bathTempCold,
                BathTempStatus.tooHot => AppStrings.bathTempHot,
              }, style: AppTextStyles.body(indicatorColor)),
            ),
          ],
          const SizedBox(height: AppSpacing.lg),
          TextField(
            controller: _notesController,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: AppStrings.notesOptional,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.input),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton(
            onPressed: _saving ? null : _save,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.teal400,
              minimumSize: const Size.fromHeight(AppTapTarget.min),
            ),
            child: _saving
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.white,
                    ),
                  )
                : const Text(AppStrings.save),
          ),
        ],
      ),
    );
  }
}
