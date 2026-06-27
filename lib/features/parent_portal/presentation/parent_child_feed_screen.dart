import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import 'providers/parent_portal_provider.dart';

final _dateFormat = DateFormat('EEEE d MMMM yyyy', 'en_GB');

/// Read-only feed of a linked child's activities, rewards, and achievements.
class ParentChildFeedScreen extends ConsumerWidget {
  const ParentChildFeedScreen({super.key, required this.linkId});

  final String linkId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final linkAsync = ref.watch(parentLinkByIdProvider(linkId));
    final colors = Theme.of(context).colorScheme;

    return linkAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.parentFeedTitle)),
        body: const LoadingSkeleton(),
      ),
      error: (e, _) => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.parentFeedTitle)),
        body: ErrorView(
          error: e,
          onRetry: () => ref.invalidate(parentLinkByIdProvider(linkId)),
        ),
      ),
      data: (link) {
        if (link == null) {
          return Scaffold(
            appBar: AppBar(title: const Text(AppStrings.parentFeedTitle)),
            body: Center(
              child: Text(
                AppStrings.parentNoLinks,
                style: AppTextStyles.body(colors.onSurfaceVariant),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(title: Text(link.displayName)),
          body: _ActivityFeed(childId: link.childId),
        );
      },
    );
  }
}

class _ActivityFeed extends ConsumerWidget {
  const _ActivityFeed({required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activitiesAsync = ref.watch(parentChildActivitiesProvider(childId));
    final colors = Theme.of(context).colorScheme;

    return activitiesAsync.when(
      loading: () => const LoadingSkeleton(),
      error: (e, _) => ErrorView(
        error: e,
        onRetry: () => ref.invalidate(parentChildActivitiesProvider(childId)),
      ),
      data: (entries) {
        if (entries.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.celebration_outlined,
                    size: 56,
                    color: colors.onSurfaceVariant,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    AppStrings.parentNoActivities,
                    style: AppTextStyles.body(colors.onSurfaceVariant),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    AppStrings.parentNoActivitiesHint,
                    style: AppTextStyles.small(colors.onSurfaceVariant),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        // Group by date, preserving the newest-first order from the query.
        final byDate = <String, List<Map<String, dynamic>>>{};
        for (final entry in entries) {
          byDate.putIfAbsent(entry['date'] as String, () => []).add(entry);
        }
        final dates = byDate.keys.toList();

        return ListView.builder(
          padding: const EdgeInsets.all(AppSpacing.lg),
          itemCount: dates.length + 1,
          itemBuilder: (context, i) {
            if (i == dates.length) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                child: Text(
                  AppStrings.parentRecordsLimitNote,
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                  textAlign: TextAlign.center,
                ),
              );
            }
            final date = dates[i];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: AppSpacing.sm,
                    bottom: AppSpacing.sm,
                  ),
                  child: Text(
                    _formatDate(date),
                    style: AppTextStyles.label(colors.onSurfaceVariant),
                  ),
                ),
                for (final entry in byDate[date]!) ...[
                  _ActivityCard(entry: entry),
                  const SizedBox(height: AppSpacing.sm),
                ],
              ],
            );
          },
        );
      },
    );
  }

  String _formatDate(String date) {
    final parsed = DateTime.tryParse(date);
    return parsed == null ? date : _dateFormat.format(parsed);
  }
}

class _ActivityCard extends StatelessWidget {
  const _ActivityCard({required this.entry});

  final Map<String, dynamic> entry;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final title = entry['title'] as String? ?? '';
    final description = entry['description'] as String?;
    final category = entry['category'] as String?;
    final durationMinutes = entry['duration_minutes'] as int?;
    final rewardEarned = entry['reward_earned'] as bool? ?? false;
    final achievement = entry['achievement'] as String?;
    final hasAchievement = achievement != null && achievement.isNotEmpty;

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
                  child: Text(title, style: AppTextStyles.h3(colors.onSurface)),
                ),
                if (rewardEarned)
                  const Tooltip(
                    message: AppStrings.parentRewardBadge,
                    child: Icon(Icons.star, color: AppColors.amber, size: 20),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                if (category != null) _Chip(label: _categoryLabel(category)),
                if (durationMinutes != null)
                  _Chip(
                    label:
                        '$durationMinutes ${AppStrings.parentDurationSuffix}',
                  ),
              ],
            ),
            if (description != null && description.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(description, style: AppTextStyles.body(colors.onSurface)),
            ],
            if (hasAchievement) ...[
              const SizedBox(height: AppSpacing.sm),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.amber.withAlpha(25),
                  borderRadius: BorderRadius.circular(AppRadius.input),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('🏆'),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.parentAchievementLabel,
                            style: AppTextStyles.label(AppColors.amber),
                          ),
                          Text(
                            achievement,
                            style: AppTextStyles.body(colors.onSurface),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Cloud rows carry the raw category key; map to the same display names
  /// as ActivityCategory without coupling to the Drift-wired domain model.
  String _categoryLabel(String key) => switch (key) {
    'physical' => 'Physical',
    'creative' => 'Creative',
    'educational' => 'Educational',
    'social' => 'Social',
    'community' => 'Community',
    'life_skills' => 'Life Skills',
    _ => 'Other',
  };
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.roleParent.withAlpha(20),
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: AppColors.roleParent.withAlpha(60)),
      ),
      child: Text(label, style: AppTextStyles.label(colors.onSurfaceVariant)),
    );
  }
}
