import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/models/app_strings.dart';
import '../../../../shared/widgets/completion_dot.dart';
import '../../domain/child.dart';

/// A single row in the children roster. Designed to sit inside a list panel —
/// it carries no surface of its own, just the row content + a status dot.
class ChildListTile extends StatelessWidget {
  const ChildListTile({super.key, required this.child, this.onTap});

  final Child child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final accent = AppColors.avatarColorFor(child.id);

    return Semantics(
      button: true,
      label: 'Open ${child.name}\'s profile',
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: accent.withAlpha(28),
                backgroundImage: child.photoUrl != null
                    ? NetworkImage(child.photoUrl!)
                    : null,
                child: child.photoUrl == null
                    ? Text(child.initials, style: AppTextStyles.label(accent))
                    : null,
              ),
              const SizedBox(width: AppSpacing.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      child.name,
                      style: AppTextStyles.body(
                        colors.onSurface,
                      ).copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${AppStrings.profileAgeLabel} ${child.ageYears}  ·  '
                      '${AppStrings.profileRoomLabel} ${child.room}',
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              CompletionDot(childId: child.id),
              const SizedBox(width: AppSpacing.md),
              Icon(
                Icons.chevron_right,
                color: colors.onSurfaceVariant,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
