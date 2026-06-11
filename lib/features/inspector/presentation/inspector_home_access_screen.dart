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

/// Read-only overview of a granted home: children, and the modules the
/// inspector has been given access to.
class InspectorHomeAccessScreen extends ConsumerStatefulWidget {
  const InspectorHomeAccessScreen({super.key, required this.grantId});

  final String grantId;

  @override
  ConsumerState<InspectorHomeAccessScreen> createState() =>
      _InspectorHomeAccessScreenState();
}

class _InspectorHomeAccessScreenState
    extends ConsumerState<InspectorHomeAccessScreen> {
  bool _viewLogged = false;

  void _logViewOnce(InspectorGrant grant) {
    if (_viewLogged) return;
    _viewLogged = true;
    Future.microtask(() => ref.read(inspectorAuditServiceProvider).recordView(
          homeId: grant.homeId,
          entityTable: 'children',
        ));
  }

  @override
  Widget build(BuildContext context) {
    final grantAsync = ref.watch(grantByIdProvider(widget.grantId));
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.inspectorPortalTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.rate_review_outlined),
            tooltip: AppStrings.inspectorFeedbackTitle,
            onPressed: () =>
                context.push('/inspector/${widget.grantId}/feedback/new'),
          ),
        ],
      ),
      body: grantAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(grantByIdProvider(widget.grantId)),
        ),
        data: (grant) {
          if (grant == null) {
            return ErrorView(
              message: AppStrings.inspectorExpired,
              onRetry: () => context.pop(),
            );
          }
          _logViewOnce(grant);

          final modules = [
            for (final scopeKey in grant.scope)
              if (InspectorModule.fromScopeKey(scopeKey) case final m?) m,
          ];
          final childrenAsync =
              ref.watch(inspectorChildrenProvider(grant.homeId));

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              _ExpiryBanner(grant: grant),
              const SizedBox(height: AppSpacing.xl),
              Text(AppStrings.inspectorChildrenSection,
                  style: AppTextStyles.h2(colors.onSurface)),
              const SizedBox(height: AppSpacing.sm),
              childrenAsync.when(
                loading: () => const LoadingSkeleton(itemCount: 2),
                error: (e, _) => ErrorView(message: e.toString()),
                data: (children) {
                  if (children.isEmpty) {
                    return Text(AppStrings.inspectorNoRecords,
                        style: AppTextStyles.small(colors.onSurfaceVariant));
                  }
                  return Column(
                    children: [
                      for (final child in children)
                        _ChildTile(
                          child: child,
                          onTap: modules.isEmpty
                              ? null
                              : () => _showChildSections(
                                    context,
                                    grantId: widget.grantId,
                                    child: child,
                                    modules: modules,
                                  ),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(AppStrings.inspectorSectionsLabel,
                  style: AppTextStyles.h2(colors.onSurface)),
              const SizedBox(height: AppSpacing.sm),
              if (modules.isEmpty)
                Text(AppStrings.inspectorNoRecords,
                    style: AppTextStyles.small(colors.onSurfaceVariant))
              else
                Column(
                  children: [
                    for (final module in modules)
                      _SectionTile(
                        module: module,
                        onTap: () => context.push(
                          '/inspector/${widget.grantId}/${module.scopeKey}',
                        ),
                      ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }

  void _showChildSections(
    BuildContext context, {
    required String grantId,
    required Map<String, dynamic> child,
    required List<InspectorModule> modules,
  }) {
    final name = child['name'] as String? ?? '';
    final childId = child['id'] as String;
    showModalBottomSheet<void>(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Text(name,
                  style: AppTextStyles.h3(
                      Theme.of(sheetContext).colorScheme.onSurface)),
            ),
            for (final module in modules)
              ListTile(
                leading: Icon(module.icon, color: AppColors.roleInspector),
                title: Text(module.displayName),
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  context.push(
                    '/inspector/$grantId/${module.scopeKey}/$childId',
                  );
                },
              ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ),
      ),
    );
  }
}

class _ExpiryBanner extends StatelessWidget {
  const _ExpiryBanner({required this.grant});

  final InspectorGrant grant;

  @override
  Widget build(BuildContext context) {
    final days = grant.daysRemaining;
    final String label;
    if (days <= 0) {
      label = AppStrings.inspectorExpiresToday;
    } else if (days == 1) {
      label = '${AppStrings.inspectorExpiresInPrefix} 1 day';
    } else {
      label = '${AppStrings.inspectorExpiresInPrefix} $days days';
    }

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.roleInspector.withAlpha(20),
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.roleInspector.withAlpha(60)),
      ),
      child: Row(
        children: [
          Icon(Icons.timer_outlined, color: AppColors.roleInspector),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              '${grant.displayName} · $label',
              style: AppTextStyles.body(AppColors.roleInspector),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChildTile extends StatelessWidget {
  const _ChildTile({required this.child, this.onTap});

  final Map<String, dynamic> child;
  final VoidCallback? onTap;

  int? _ageYears(String? dateOfBirth) {
    if (dateOfBirth == null) return null;
    final dob = DateTime.tryParse(dateOfBirth);
    if (dob == null) return null;
    final now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final name = child['name'] as String? ?? '';
    final room = child['room'] as String?;
    final age = _ageYears(child['date_of_birth'] as String?);
    final subtitle = [
      if (age != null) '$age yrs',
      if (room != null && room.isNotEmpty) room,
    ].join(' · ');

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Material(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.roleInspector.withAlpha(30),
                  child: Text(
                    name.isNotEmpty ? name[0].toUpperCase() : '?',
                    style: AppTextStyles.h3(AppColors.roleInspector),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: AppTextStyles.h3(colors.onSurface)),
                      if (subtitle.isNotEmpty)
                        Text(subtitle,
                            style:
                                AppTextStyles.small(colors.onSurfaceVariant)),
                    ],
                  ),
                ),
                if (onTap != null)
                  Icon(Icons.chevron_right, color: colors.onSurfaceVariant),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTile extends StatelessWidget {
  const _SectionTile({required this.module, required this.onTap});

  final InspectorModule module;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Material(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.card),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                Icon(module.icon, color: AppColors.roleInspector),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(module.displayName,
                      style: AppTextStyles.h3(colors.onSurface)),
                ),
                Icon(Icons.chevron_right, color: colors.onSurfaceVariant),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
