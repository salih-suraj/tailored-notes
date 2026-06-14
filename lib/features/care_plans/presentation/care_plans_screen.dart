import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/care_plan.dart';
import 'providers/care_plans_provider.dart';

class CarePlansScreen extends ConsumerWidget {
  const CarePlansScreen({super.key, required this.childId});

  final String childId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plansAsync = ref.watch(carePlansProvider(childId));
    final childrenAsync = ref.watch(childrenProvider);
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
            const Text(AppStrings.carePlansTitle),
            if (childName.isNotEmpty)
              Text(
                childName,
                style: AppTextStyles.small(colors.onSurfaceVariant),
              ),
          ],
        ),
      ),
      body: plansAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(carePlansProvider(childId)),
        ),
        data: (plans) {
          if (plans.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.description_outlined,
                    size: 56,
                    color: colors.onSurfaceVariant,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    AppStrings.carePlanNoPlans,
                    style: AppTextStyles.body(colors.onSurfaceVariant),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    AppStrings.carePlanNoPlansHint,
                    style: AppTextStyles.small(colors.onSurfaceVariant),
                  ),
                ],
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: plans.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (_, i) => _CarePlanCard(
              plan: plans[i],
              onTap: () => context.push(
                '/children/$childId/care-plans/${plans[i].id}',
                extra: plans[i],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/children/$childId/care-plans/new'),
        backgroundColor: AppColors.teal400,
        foregroundColor: AppColors.white,
        icon: const Icon(Icons.add),
        label: const Text(AppStrings.carePlanNew),
      ),
    );
  }
}

class _CarePlanCard extends StatelessWidget {
  const _CarePlanCard({required this.plan, required this.onTap});

  final CarePlan plan;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final statusColor = _statusColor(plan.status);

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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(plan.title, style: AppTextStyles.h3(colors.onSurface)),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        _StatusBadge(
                          label: plan.status.displayName,
                          color: statusColor,
                        ),
                        if (plan.reviewDate != null) ...[
                          const SizedBox(width: AppSpacing.sm),
                          Icon(
                            Icons.event_outlined,
                            size: 12,
                            color: colors.onSurfaceVariant,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            _formatDate(plan.reviewDate!),
                            style: AppTextStyles.small(colors.onSurfaceVariant),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      plan.authorName,
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

  Color _statusColor(CarePlanStatus s) => switch (s) {
    CarePlanStatus.active => AppColors.green,
    CarePlanStatus.draft => AppColors.amber,
    CarePlanStatus.underReview => AppColors.blue,
    CarePlanStatus.archived => AppColors.slate400,
  };

  String _formatDate(String d) {
    final parts = d.split('-');
    if (parts.length != 3) return d;
    final dt = DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
    return DateFormat('d MMM yyyy').format(dt);
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
    decoration: BoxDecoration(
      color: color.withAlpha(25),
      borderRadius: BorderRadius.circular(AppRadius.pill),
    ),
    child: Text(label, style: AppTextStyles.label(color)),
  );
}
