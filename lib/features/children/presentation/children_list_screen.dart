import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/theme.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/models/shift_completion.dart';
import '../../../shared/providers/shift_completion_provider.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../../../shared/widgets/status_banner.dart';
import '../../auth/domain/user_role.dart';
import '../../auth/presentation/providers/auth_provider.dart';
import '../domain/child.dart';
import 'providers/children_provider.dart';
import 'widgets/child_list_tile.dart';

class _IncompleteDocsBanner extends StatelessWidget {
  const _IncompleteDocsBanner({required this.incomplete});

  final List<Child> incomplete;

  @override
  Widget build(BuildContext context) {
    final names = incomplete.map((c) => c.name.split(' ').first).toList();
    final subtitle = names.length <= 3
        ? names.join(' · ')
        : '${names.take(2).join(' · ')} and ${names.length - 2} others';

    return StatusBanner(
      color: AppColors.amber,
      icon: Icons.warning_amber_rounded,
      title: AppStrings.alertIncompleteTitle,
      message: subtitle,
    );
  }
}

/// Lists all children in the home. Entry point to child profiles.
class ChildrenListScreen extends ConsumerWidget {
  const ChildrenListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenAsync = ref.watch(childrenProvider);
    final colors = Theme.of(context).colorScheme;
    final isManager = ref.watch(currentUserProvider)?.role == UserRole.manager;

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.childrenTitle),
        actions: [
          if (isManager)
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: AppStrings.addChild,
              onPressed: () => context.push('/children/new'),
            ),
        ],
      ),
      body: childrenAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (error, _) => ErrorView(
          error: error,
          onRetry: () => ref.invalidate(childrenProvider),
        ),
        data: (children) {
          if (children.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 64,
                    color: colors.onSurfaceVariant,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    AppStrings.noChildren,
                    style: AppTextStyles.body(colors.onSurfaceVariant),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          final incomplete = children.where((c) {
            final s = ref.watch(shiftCompletionProvider(c.id));
            return s.status != CompletionStatus.complete;
          }).toList();

          return ListView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.xxl,
            ),
            children: [
              if (incomplete.isNotEmpty) ...[
                _IncompleteDocsBanner(incomplete: incomplete),
                const SizedBox(height: AppSpacing.lg),
              ],
              // One refined roster panel — neutral chrome, hairline dividers,
              // each child's documentation status carried by the colour dot.
              Material(
                color: colors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(AppRadius.card),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    for (var i = 0; i < children.length; i++) ...[
                      if (i > 0)
                        Divider(
                          height: 1,
                          thickness: 1,
                          indent: 72,
                          color: colors.outlineVariant,
                        ),
                      ChildListTile(
                        child: children[i],
                        onTap: () =>
                            context.push('/children/${children[i].id}'),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
