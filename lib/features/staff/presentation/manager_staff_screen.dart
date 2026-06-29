import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../shared/errors/friendly_error.dart';
import '../../../shared/models/app_strings.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/loading_skeleton.dart';
import '../../auth/domain/user_role.dart';
import '../../auth/presentation/providers/auth_provider.dart';
import '../domain/staff_member.dart';
import 'providers/staff_provider.dart';
import 'widgets/staff_form_sheet.dart';

/// Manager screen for provisioning and disabling staff accounts in this home.
/// Replaces the need to use the Supabase dashboard to onboard staff.
class ManagerStaffScreen extends ConsumerWidget {
  const ManagerStaffScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeId = ref.watch(currentUserProvider)?.homeId ?? '';
    final staffAsync = ref.watch(staffForHomeProvider(homeId));
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.managerStaffTitle)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showStaffFormSheet(context, homeId: homeId),
        icon: const Icon(Icons.person_add_alt_1),
        label: const Text(AppStrings.managerNewStaff),
      ),
      body: staffAsync.when(
        loading: () => const LoadingSkeleton(),
        error: (e, _) => ErrorView(
          error: e,
          onRetry: () => ref.invalidate(staffForHomeProvider(homeId)),
        ),
        data: (staff) {
          if (staff.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.groups_outlined,
                      size: 56,
                      color: colors.onSurfaceVariant,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      AppStrings.managerNoStaff,
                      style: AppTextStyles.body(colors.onSurface),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      AppStrings.managerNoStaffHint,
                      style: AppTextStyles.small(colors.onSurfaceVariant),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.lg,
              AppSpacing.lg,
              96, // clear the FAB
            ),
            itemCount: staff.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (_, i) => _StaffTile(member: staff[i], homeId: homeId),
          );
        },
      ),
    );
  }
}

Color _roleColor(UserRole role) => switch (role) {
  UserRole.supportWorker => AppColors.roleSupportWorker,
  UserRole.teamLeader => AppColors.roleTeamLeader,
  UserRole.manager => AppColors.roleManager,
  UserRole.inspector => AppColors.roleInspector,
  UserRole.parentGuardian => AppColors.roleParent,
};

class _StaffTile extends ConsumerStatefulWidget {
  const _StaffTile({required this.member, required this.homeId});

  final StaffMember member;
  final String homeId;

  @override
  ConsumerState<_StaffTile> createState() => _StaffTileState();
}

class _StaffTileState extends ConsumerState<_StaffTile> {
  bool _busy = false;

  Future<void> _toggleActive() async {
    final member = widget.member;
    final disabling = member.isActive;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(
          disabling
              ? AppStrings.managerStaffDisableTitle
              : AppStrings.managerStaffEnableTitle,
        ),
        content: Text(
          disabling
              ? AppStrings.managerStaffDisableConfirm
              : AppStrings.managerStaffEnableConfirm,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: disabling
                ? TextButton.styleFrom(
                    foregroundColor: Theme.of(dialogContext).colorScheme.error,
                  )
                : null,
            child: Text(
              disabling
                  ? AppStrings.managerStaffDisable
                  : AppStrings.managerStaffEnable,
            ),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _busy = true);
    try {
      await ref
          .read(staffRepositoryProvider)
          .setActive(userId: member.id, active: !member.isActive);
      ref.invalidate(staffForHomeProvider(widget.homeId));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.managerStaffUpdated)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(friendlyError(e))));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _resetPassword() async {
    final member = widget.member;
    final controller = TextEditingController();
    final newPassword = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.managerStaffResetTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.managerStaffResetBody),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: controller,
              autofocus: true,
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(
                hintText: AppStrings.managerStaffResetHint,
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(controller.text),
            child: const Text(AppStrings.managerStaffResetSubmit),
          ),
        ],
      ),
    );
    controller.dispose();
    if (newPassword == null) return; // cancelled
    if (newPassword.length < 8) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.managerStaffPasswordTooShort)),
      );
      return;
    }

    setState(() => _busy = true);
    try {
      await ref
          .read(staffRepositoryProvider)
          .resetPassword(userId: member.id, password: newPassword);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.managerStaffResetDone)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(friendlyError(e))));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final member = widget.member;
    final roleColor = _roleColor(member.role);

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
                CircleAvatar(
                  radius: 20,
                  backgroundColor: roleColor.withAlpha(38),
                  child: Text(
                    member.name.isNotEmpty ? member.name[0].toUpperCase() : '?',
                    style: AppTextStyles.label(roleColor),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        member.name,
                        style: AppTextStyles.h3(colors.onSurface),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        member.email,
                        style: AppTextStyles.small(colors.onSurfaceVariant),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                _Badge(
                  label: member.isActive
                      ? AppStrings.managerStaffActive
                      : AppStrings.managerStaffDisabled,
                  color: member.isActive ? AppColors.green : AppColors.slate400,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                _Badge(label: member.role.displayName, color: roleColor),
                const Spacer(),
                if (_busy)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else ...[
                  TextButton(
                    onPressed: _resetPassword,
                    child: const Text(AppStrings.managerStaffReset),
                  ),
                  TextButton(
                    onPressed: _toggleActive,
                    style: member.isActive
                        ? TextButton.styleFrom(foregroundColor: colors.error)
                        : null,
                    child: Text(
                      member.isActive
                          ? AppStrings.managerStaffDisable
                          : AppStrings.managerStaffEnable,
                    ),
                  ),
                ],
              ],
            ),
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
