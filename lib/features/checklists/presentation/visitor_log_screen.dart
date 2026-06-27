import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/time/uk_time.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/visitor_log_entry.dart';
import 'providers/visitor_log_provider.dart';

class VisitorLogScreen extends ConsumerWidget {
  const VisitorLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entriesAsync = ref.watch(visitorLogTodayProvider);
    final colors = Theme.of(context).colorScheme;
    final today = DateFormat('d MMM yyyy').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.visitorLogTitle),
            Text(today, style: AppTextStyles.small(colors.onSurfaceVariant)),
          ],
        ),
      ),
      body: entriesAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          error: e,
          onRetry: () => ref.invalidate(visitorLogTodayProvider),
        ),
        data: (entries) {
          if (entries.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.badge_outlined,
                    size: 56,
                    color: colors.onSurfaceVariant,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    AppStrings.visitorLogNoEntries,
                    style: AppTextStyles.body(colors.onSurfaceVariant),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    AppStrings.visitorLogNoEntriesHint,
                    style: AppTextStyles.small(colors.onSurfaceVariant),
                  ),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: entries.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (_, i) => _VisitorCard(
              entry: entries[i],
              onEdit: () => context.push(
                '/checklists/${entries[i].id}/edit',
                extra: entries[i],
              ),
              onRecordDeparture: entries[i].departedAt == null
                  ? () => _confirmDeparture(context, ref, entries[i].id)
                  : null,
              onDelete: () => _confirmDelete(context, ref, entries[i].id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/checklists/new'),
        backgroundColor: AppColors.teal400,
        foregroundColor: AppColors.white,
        icon: const Icon(Icons.person_add_outlined),
        label: const Text(AppStrings.visitorLogNewEntry),
      ),
    );
  }

  Future<void> _confirmDeparture(
    BuildContext context,
    WidgetRef ref,
    String id,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.visitorRecordDeparture),
        content: const Text(AppStrings.visitorRecordDepartureConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text(AppStrings.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text(AppStrings.visitorRecordDeparture),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(visitorLogRepositoryProvider).recordDeparture(id);
    }
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    String id,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.visitorLogDeleteTitle),
        content: const Text(AppStrings.visitorLogDeleteConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text(AppStrings.delete),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(visitorLogRepositoryProvider).delete(id);
    }
  }
}

// ── Visitor card ─────────────────────────────────────────────────────────────

class _VisitorCard extends StatelessWidget {
  const _VisitorCard({
    required this.entry,
    required this.onEdit,
    required this.onDelete,
    this.onRecordDeparture,
  });

  final VisitorLogEntry entry;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback? onRecordDeparture;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final fmt = DateFormat('HH:mm', 'en_GB');
    final arrivedStr = fmt.format(entry.arrivedAt.toUk());
    final departedStr = entry.departedAt != null
        ? fmt.format(entry.departedAt!.toUk())
        : null;
    final onSite = entry.departedAt == null;

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: InkWell(
        onTap: onEdit,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      entry.visitorName,
                      style: AppTextStyles.h3(colors.onSurface),
                    ),
                  ),
                  if (onSite)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.green.withAlpha(25),
                        borderRadius: BorderRadius.circular(AppRadius.pill),
                      ),
                      child: Text(
                        AppStrings.visitorOnSite,
                        style: AppTextStyles.label(AppColors.green),
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
                      if (v == 'edit') onEdit();
                      if (v == 'depart') onRecordDeparture?.call();
                      if (v == 'delete') onDelete();
                    },
                    itemBuilder: (_) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text(AppStrings.edit),
                      ),
                      if (onRecordDeparture != null)
                        const PopupMenuItem(
                          value: 'depart',
                          child: Text(AppStrings.visitorRecordDeparture),
                        ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text(AppStrings.delete),
                      ),
                    ],
                  ),
                ],
              ),
              if (entry.relation != null) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  entry.relation!,
                  style: AppTextStyles.small(colors.primary),
                ),
              ],
              const SizedBox(height: AppSpacing.xs),
              Text(entry.purpose, style: AppTextStyles.body(colors.onSurface)),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Icon(
                    Icons.login,
                    size: 14,
                    color: colors.onSurfaceVariant,
                    semanticLabel: AppStrings.visitorArrived,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    arrivedStr,
                    style: AppTextStyles.small(colors.onSurfaceVariant),
                  ),
                  if (departedStr != null) ...[
                    const SizedBox(width: AppSpacing.md),
                    Icon(
                      Icons.logout,
                      size: 14,
                      color: colors.onSurfaceVariant,
                      semanticLabel: AppStrings.visitorDeparted,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      departedStr,
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                    ),
                  ],
                  const Spacer(),
                  Text(
                    '${AppStrings.visitorAuthorisedBy}: ${entry.authorisedBy}',
                    style: AppTextStyles.small(colors.onSurfaceVariant),
                  ),
                ],
              ),
              if (entry.notes != null && entry.notes!.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  entry.notes!,
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
