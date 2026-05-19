import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/daily_note.dart';

/// Displays a single daily observation in a card.
class DailyNoteCard extends StatelessWidget {
  const DailyNoteCard({
    super.key,
    required this.note,
    this.onEdit,
    this.onDelete,
  });

  final DailyNote note;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final timeStr = DateFormat('HH:mm', 'en_GB').format(note.occurredAt.toLocal());
    final dateStr = DateFormat('EEE d MMM', 'en_GB').format(note.occurredAt.toLocal());

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
                  _ShiftBadge(shift: note.shift),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    '$dateStr · $timeStr',
                    style: AppTextStyles.small(colors.onSurfaceVariant),
                  ),
                  const Spacer(),
                  if (!note.isSynced)
                    Icon(
                      Icons.cloud_off_outlined,
                      size: 14,
                      color: colors.onSurfaceVariant,
                      semanticLabel: 'Not yet synced',
                    ),
                  if (onEdit != null || onDelete != null)
                    _NoteMenu(onEdit: onEdit, onDelete: onDelete),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                note.content,
                style: AppTextStyles.body(colors.onSurface),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                note.authorName,
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShiftBadge extends StatelessWidget {
  const _ShiftBadge({required this.shift});
  final ShiftType shift;

  Color _color(ShiftType s) => switch (s) {
        ShiftType.morning => AppColors.green,
        ShiftType.afternoon => AppColors.blue,
        ShiftType.night => AppColors.roleSupportWorker,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: _color(shift).withAlpha(30),
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        shift.displayName,
        style: AppTextStyles.label(_color(shift)),
      ),
    );
  }
}

class _NoteMenu extends StatelessWidget {
  const _NoteMenu({this.onEdit, this.onDelete});
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, size: 18, color: colors.onSurfaceVariant),
      tooltip: 'Note options',
      onSelected: (value) {
        if (value == 'edit') onEdit?.call();
        if (value == 'delete') onDelete?.call();
      },
      itemBuilder: (_) => [
        if (onEdit != null)
          const PopupMenuItem(value: 'edit', child: Text('Edit')),
        if (onDelete != null)
          const PopupMenuItem(value: 'delete', child: Text('Delete')),
      ],
    );
  }
}
