import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../../../shared/models/app_strings.dart';
import '../../daily_notes/domain/daily_note.dart';
import 'providers/daily_notes_provider.dart';
import 'widgets/daily_note_card.dart';

/// Lists all observations for a single child.
/// Reached from the child profile screen.
class DailyNotesListScreen extends ConsumerStatefulWidget {
  const DailyNotesListScreen({super.key, required this.childId});

  final String childId;

  @override
  ConsumerState<DailyNotesListScreen> createState() =>
      _DailyNotesListScreenState();
}

class _DailyNotesListScreenState extends ConsumerState<DailyNotesListScreen> {
  ShiftType? _filterShift; // null = show all

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final notesAsync = ref.watch(dailyNotesProvider(widget.childId));
    final childrenAsync = ref.watch(childrenProvider);

    final childName = childrenAsync.maybeWhen(
      data: (list) =>
          list.where((c) => c.id == widget.childId).firstOrNull?.name ??
          AppStrings.navChildren,
      orElse: () => AppStrings.dailyNotesTitle,
    );

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.dailyNotesTitle),
            Text(
              childName,
              style: AppTextStyles.small(colors.onSurfaceVariant),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Shift filter chips
          _ShiftFilter(
            selected: _filterShift,
            onSelected: (shift) => setState(
              () => _filterShift = _filterShift == shift ? null : shift,
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: notesAsync.when(
              loading: () => const LoadingSkeleton(),
              error: (e, _) => ErrorView(
                message: e.toString(),
                onRetry: () =>
                    ref.invalidate(dailyNotesProvider(widget.childId)),
              ),
              data: (notes) {
                final filtered = _filterShift == null
                    ? notes
                    : notes.where((n) => n.shift == _filterShift).toList();

                if (filtered.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.edit_note_outlined,
                          size: 56,
                          color: colors.onSurfaceVariant,
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        Text(
                          _filterShift == null
                              ? AppStrings.noObservations
                              : AppStrings.noObservationsForShift,
                          style: AppTextStyles.body(colors.onSurfaceVariant),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          AppStrings.noObservationsHint,
                          style: AppTextStyles.small(colors.onSurfaceVariant),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  itemCount: filtered.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: AppSpacing.sm),
                  itemBuilder: (context, i) {
                    final note = filtered[i];
                    return DailyNoteCard(
                      note: note,
                      onEdit: () => context.push(
                        '/children/${widget.childId}/daily-notes/${note.id}/edit',
                        extra: note,
                      ),
                      onDelete: () => _confirmDelete(context, note),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            context.push('/children/${widget.childId}/daily-notes/new'),
        backgroundColor: AppColors.teal400,
        foregroundColor: AppColors.white,
        icon: const Icon(Icons.add),
        label: const Text(AppStrings.addObservation),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, DailyNote note) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.deleteObservation),
        content: const Text(AppStrings.deleteObservationConfirm),
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
    if (confirmed == true && mounted) {
      await ref.read(dailyNotesRepositoryProvider).delete(note.id);
    }
  }
}

class _ShiftFilter extends StatelessWidget {
  const _ShiftFilter({required this.selected, required this.onSelected});

  final ShiftType? selected;
  final ValueChanged<ShiftType> onSelected;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        children: ShiftType.values.map((shift) {
          final isSelected = selected == shift;
          return Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: FilterChip(
              label: Text(shift.displayName),
              selected: isSelected,
              onSelected: (_) => onSelected(shift),
              selectedColor: colors.primaryContainer,
              checkmarkColor: colors.primary,
            ),
          );
        }).toList(),
      ),
    );
  }
}
