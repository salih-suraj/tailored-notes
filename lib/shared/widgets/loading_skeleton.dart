import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

/// Full-screen list skeleton shown while data loads.
class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: itemCount,
      separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
      itemBuilder: (_, _) => const _SkeletonTile(),
    );
  }
}

class _SkeletonTile extends StatelessWidget {
  const _SkeletonTile();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final shimmer = colors.onSurface.withValues(alpha: 0.08);
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: [
          CircleAvatar(radius: 20, backgroundColor: shimmer),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 14,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: shimmer,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Container(
                  height: 11,
                  width: 120,
                  decoration: BoxDecoration(
                    color: shimmer,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
