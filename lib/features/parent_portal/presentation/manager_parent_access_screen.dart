import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/time/uk_time.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../../../shared/widgets/managed_account_tile.dart';
import '../../auth/presentation/providers/auth_provider.dart';
import '../domain/parent_link.dart';
import 'providers/parent_portal_provider.dart';
import 'widgets/link_form_sheet.dart';
import 'widgets/parent_form_sheet.dart';

final _dateFormat = DateFormat('d MMM yyyy', 'en_GB');

/// Manager screen for parent/guardian accounts: an Accounts tab (every parent
/// account in the home, with password reset) and a Links tab (parent↔child
/// links). Creating an account and linking it to a child are separate steps.
class ManagerParentAccessScreen extends ConsumerWidget {
  const ManagerParentAccessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeId = ref.watch(currentUserProvider)?.homeId ?? '';

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.managerParentAccessTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.person_add_alt_1_outlined),
              tooltip: AppStrings.managerAddParentTooltip,
              onPressed: () => showParentFormSheet(context),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: AppStrings.managerParentAccountsTab),
              Tab(text: AppStrings.managerParentLinksTab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _ParentAccountsTab(homeId: homeId),
            _ParentLinksTab(homeId: homeId),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showLinkFormSheet(context, homeId: homeId),
          icon: const Icon(Icons.add),
          label: const Text(AppStrings.managerNewParentLink),
        ),
      ),
    );
  }
}

class _ParentAccountsTab extends ConsumerWidget {
  const _ParentAccountsTab({required this.homeId});

  final String homeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(parentAccountsForHomeProvider(homeId));
    final colors = Theme.of(context).colorScheme;

    return accountsAsync.when(
      loading: () => const LoadingSkeleton(),
      error: (e, _) => ErrorView(
        error: e,
        onRetry: () => ref.invalidate(parentAccountsForHomeProvider(homeId)),
      ),
      data: (accounts) {
        if (accounts.isEmpty) {
          return _EmptyState(
            icon: Icons.family_restroom_outlined,
            title: AppStrings.managerNoParentAccounts,
            hint: AppStrings.managerNoParentAccountsHint,
            colors: colors,
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.lg,
            AppSpacing.lg,
            96,
          ),
          itemCount: accounts.length,
          separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
          itemBuilder: (_, i) {
            final a = accounts[i];
            return ManagedAccountTile(
              name: a.displayName ?? a.email,
              email: a.email,
              accent: AppColors.roleParent,
              isActive: a.isActive,
              onResetPassword: (pw) => ref
                  .read(parentLinksRepositoryProvider)
                  .resetPassword(userId: a.id, password: pw),
            );
          },
        );
      },
    );
  }
}

class _ParentLinksTab extends ConsumerWidget {
  const _ParentLinksTab({required this.homeId});

  final String homeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final linksAsync = ref.watch(parentLinksForHomeProvider(homeId));
    final colors = Theme.of(context).colorScheme;

    return linksAsync.when(
      loading: () => const LoadingSkeleton(),
      error: (e, _) => ErrorView(
        error: e,
        onRetry: () => ref.invalidate(parentLinksForHomeProvider(homeId)),
      ),
      data: (links) {
        if (links.isEmpty) {
          return _EmptyState(
            icon: Icons.link_off_outlined,
            title: AppStrings.managerNoParentLinks,
            colors: colors,
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.lg,
            AppSpacing.lg,
            96,
          ),
          itemCount: links.length,
          separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
          itemBuilder: (_, i) => _LinkTile(link: links[i], homeId: homeId),
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.icon,
    required this.title,
    required this.colors,
    this.hint,
  });

  final IconData icon;
  final String title;
  final String? hint;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: colors.onSurfaceVariant),
            const SizedBox(height: AppSpacing.lg),
            Text(
              title,
              style: AppTextStyles.body(colors.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
            if (hint != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                hint!,
                style: AppTextStyles.small(colors.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
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
              foregroundColor: Theme.of(dialogContext).colorScheme.error,
            ),
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
              '${_dateFormat.format(link.createdAt.toUk())}',
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
                  color: link.canViewPhotos
                      ? AppColors.blue
                      : AppColors.slate400,
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
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
    decoration: BoxDecoration(
      color: color.withAlpha(25),
      borderRadius: BorderRadius.circular(AppRadius.pill),
    ),
    child: Text(label, style: AppTextStyles.label(color)),
  );
}
