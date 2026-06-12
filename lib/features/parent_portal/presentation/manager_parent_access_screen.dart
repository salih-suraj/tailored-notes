import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../../auth/presentation/providers/auth_provider.dart';
import '../domain/parent_link.dart';
import 'providers/parent_portal_provider.dart';
import 'widgets/link_form_sheet.dart';

final _dateFormat = DateFormat('d MMM yyyy', 'en_GB');

/// Manager screen for linking parent/guardian accounts to children and
/// revoking access.
class ManagerParentAccessScreen extends ConsumerWidget {
  const ManagerParentAccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeId = ref.watch(currentUserProvider)?.homeId ?? '';
    final linksAsync = ref.watch(parentLinksForHomeProvider(homeId));
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.managerParentAccessTitle)),
      body: linksAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(parentLinksForHomeProvider(homeId)),
        ),
        data: (links) {
          if (links.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.family_restroom_outlined,
                        size: 56, color: colors.onSurfaceVariant),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      AppStrings.managerNoParentLinks,
                      style: AppTextStyles.body(colors.onSurfaceVariant),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: links.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (_, i) => _LinkTile(link: links[i], homeId: homeId),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showLinkFormSheet(context, homeId: homeId),
        icon: const Icon(Icons.add),
        label: const Text(AppStrings.managerNewParentLink),
      ),
    );
  }
}

class _LinkTile extends ConsumerWidget {
  const _LinkTile({required this.link, required this.homeId});

  final ParentLink link;
  final String homeId;

  Future<void> _confirmRevoke(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.managerRevokeParentLinkTitle),
        content: const Text(AppStrings.managerRevokeParentLinkConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(dialogContext).colorScheme.error),
            child: const Text(AppStrings.managerRevokeParentLink),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(parentLinksRepositoryProvider).revokeLink(link.id);
      ref.invalidate(parentLinksForHomeProvider(homeId));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final isActive = link.isActive;

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
                const Icon(Icons.person_outline, color: AppColors.roleParent),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    link.parentEmail ?? link.parentUserId,
                    style: AppTextStyles.h3(colors.onSurface),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _Badge(
                  label: isActive
                      ? AppStrings.managerParentLinkActive
                      : AppStrings.managerParentLinkRevoked,
                  color: isActive ? AppColors.green : AppColors.slate400,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              '${AppStrings.managerParentLinkedPrefix} '
              '${_dateFormat.format(link.createdAt.toLocal())}',
              style: AppTextStyles.small(colors.onSurfaceVariant),
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                _Badge(label: link.displayName, color: AppColors.roleParent),
                _Badge(
                  label: link.canViewPhotos
                      ? AppStrings.managerParentLinkPhotosOn
                      : AppStrings.managerParentLinkPhotosOff,
                  color: link.canViewPhotos ? AppColors.blue : AppColors.slate400,
                ),
              ],
            ),
            if (isActive) ...[
              const SizedBox(height: AppSpacing.sm),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => _confirmRevoke(context, ref),
                  style: TextButton.styleFrom(foregroundColor: colors.error),
                  child: const Text(AppStrings.managerRevokeParentLink),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm, vertical: 2),
        decoration: BoxDecoration(
          color: color.withAlpha(25),
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Text(label, style: AppTextStyles.label(color)),
      );
}
