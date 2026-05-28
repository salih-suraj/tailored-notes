import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/children/presentation/providers/children_provider.dart';
import '../../../features/children/presentation/widgets/child_list_tile.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';

/// Hub screen for the Daily Notes tab.
/// Lists all children — tapping one opens their daily notes.
class DailyNotesHubScreen extends ConsumerWidget {
  const DailyNotesHubScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childrenAsync = ref.watch(childrenProvider);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.navDailyNotes)),
      body: childrenAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (error, _) => ErrorView(
          message: error.toString(),
          onRetry: () => ref.invalidate(childrenProvider),
        ),
        data: (children) {
          if (children.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.edit_note_outlined,
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

          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: children.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (context, index) {
              final child = children[index];
              return ChildListTile(
                child: child,
                onTap: () =>
                    context.push('/children/${child.id}/daily-notes'),
              );
            },
          );
        },
      ),
    );
  }
}
