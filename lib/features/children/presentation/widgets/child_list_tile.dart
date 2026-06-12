import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/completion_dot.dart';
import '../../domain/child.dart';

/// A single row in the children list with a live documentation status dot.
class ChildListTile extends ConsumerWidget {
  const ChildListTile({super.key, required this.child, this.onTap});

  final Child child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    return Semantics(
      button: true,
      label: 'Open ${child.name}\'s profile',
      child: Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 22,
                backgroundColor: colors.primaryContainer,
                backgroundImage: child.photoUrl != null
                    ? NetworkImage(child.photoUrl!)
                    : null,
                child: child.photoUrl == null
                    ? Text(
                        child.initials,
                        style: AppTextStyles.label(colors.onPrimaryContainer),
                      )
                    : null,
              ),
              const SizedBox(width: AppSpacing.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      child.name,
                      style: AppTextStyles.h3(colors.onSurface),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'Age ${child.ageYears} · Room ${child.room}',
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              // Live completion dot
              CompletionDot(childId: child.id),
              const SizedBox(width: AppSpacing.sm),
              Icon(
                Icons.chevron_right,
                color: colors.onSurfaceVariant,
                size: 20,
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
