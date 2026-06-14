import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/models/app_strings.dart';

/// Home-level checklists hub — entry point for the Checklists nav tab.
/// Links to Visitor Log and Home Cleaning (not child-specific).
class ChecklistsHubScreen extends StatelessWidget {
  const ChecklistsHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.navChecklists)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          _HubCard(
            icon: Icons.badge_outlined,
            color: AppColors.teal400,
            title: AppStrings.visitorLogTitle,
            description: AppStrings.checklistsHubVisitorDesc,
            onTap: () => context.push('/checklists/visitors'),
          ),
          const SizedBox(height: AppSpacing.md),
          _HubCard(
            icon: Icons.cleaning_services_outlined,
            color: AppColors.blue,
            title: AppStrings.moduleCleaning,
            description: AppStrings.checklistsHubCleaningDesc,
            onTap: () => context.push('/checklists/cleaning'),
          ),
        ],
      ),
    );
  }
}

class _HubCard extends StatelessWidget {
  const _HubCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              Container(
                width: AppTapTarget.min,
                height: AppTapTarget.min,
                decoration: BoxDecoration(
                  color: color.withAlpha(25),
                  borderRadius: BorderRadius.circular(AppRadius.button),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: AppSpacing.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.h3(colors.onSurface)),
                    Text(
                      description,
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: colors.onSurfaceVariant,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
