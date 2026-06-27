import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../domain/inspector_grant.dart';
import '../domain/inspector_module.dart';
import 'providers/inspector_provider.dart';

/// Lists the homes the signed-in inspector currently has access to.
class InspectorPortalScreen extends ConsumerWidget {
  const InspectorPortalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final grantsAsync = ref.watch(myActiveGrantsProvider);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.inspectorPortalTitle)),
      body: grantsAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          error: e,
          onRetry: () => ref.invalidate(myActiveGrantsProvider),
        ),
        data: (grants) {
          if (grants.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified_user_outlined,
                      size: 56,
                      color: colors.onSurfaceVariant,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      AppStrings.inspectorNoGrants,
                      style: AppTextStyles.body(colors.onSurfaceVariant),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      AppStrings.inspectorNoGrantsHint,
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: grants.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (_, i) => _GrantCard(
              grant: grants[i],
              onTap: () => context.push('/inspector/${grants[i].id}'),
            ),
          );
        },
      ),
    );
  }
}

class _GrantCard extends StatelessWidget {
  const _GrantCard({required this.grant, required this.onTap});

  final InspectorGrant grant;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final days = grant.daysRemaining;
    final String expiryLabel;
    if (days <= 0) {
      expiryLabel = AppStrings.inspectorExpiresToday;
    } else if (days == 1) {
      expiryLabel = '${AppStrings.inspectorExpiresInPrefix} 1 day';
    } else {
      expiryLabel = '${AppStrings.inspectorExpiresInPrefix} $days days';
    }

    return Semantics(
      button: true,
      label: 'Open review for ${grant.displayName}',
      child: Material(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.home_work_outlined,
                      color: AppColors.roleInspector,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        grant.displayName,
                        style: AppTextStyles.h3(colors.onSurface),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(Icons.chevron_right, color: colors.onSurfaceVariant),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  expiryLabel,
                  style: AppTextStyles.small(colors.onSurfaceVariant),
                ),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.xs,
                  runSpacing: AppSpacing.xs,
                  children: [
                    for (final scopeKey in grant.scope)
                      if (InspectorModule.fromScopeKey(scopeKey) case final m?)
                        _ScopeChip(module: m),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ScopeChip extends StatelessWidget {
  const _ScopeChip({required this.module});

  final InspectorModule module;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
    decoration: BoxDecoration(
      color: AppColors.roleInspector.withAlpha(20),
      borderRadius: BorderRadius.circular(AppRadius.pill),
      border: Border.all(color: AppColors.roleInspector.withAlpha(60)),
    ),
    child: Text(
      module.displayName,
      style: AppTextStyles.label(AppColors.roleInspector),
    ),
  );
}
