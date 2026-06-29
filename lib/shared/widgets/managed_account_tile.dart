import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../errors/friendly_error.dart';
import '../models/app_strings.dart';

/// A row for a manager-provisioned account (parent / inspector) showing who
/// they are and a Reset password action. Resetting sets a new temporary
/// password and re-arms the forced change (handled by [onResetPassword], which
/// calls the manage-staff Edge Function). Mirrors the Staff screen's reset.
class ManagedAccountTile extends StatefulWidget {
  const ManagedAccountTile({
    super.key,
    required this.name,
    required this.email,
    required this.accent,
    required this.onResetPassword,
    this.isActive = true,
  });

  final String name;
  final String email;
  final Color accent;
  final bool isActive;

  /// Performs the reset with the manager-entered temporary password. Throws on
  /// failure; the tile surfaces a friendly message.
  final Future<void> Function(String tempPassword) onResetPassword;

  @override
  State<ManagedAccountTile> createState() => _ManagedAccountTileState();
}

class _ManagedAccountTileState extends State<ManagedAccountTile> {
  bool _busy = false;

  Future<void> _reset() async {
    final controller = TextEditingController();
    final newPassword = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(AppStrings.managerStaffResetTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(AppStrings.managerAccountResetBody),
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
      await widget.onResetPassword(newPassword);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.managerAccountResetDone)),
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

    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: widget.accent.withAlpha(38),
              child: Text(
                widget.name.isNotEmpty ? widget.name[0].toUpperCase() : '?',
                style: AppTextStyles.label(widget.accent),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          widget.name.isNotEmpty ? widget.name : widget.email,
                          style: AppTextStyles.h3(colors.onSurface),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (!widget.isActive) ...[
                        const SizedBox(width: AppSpacing.sm),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.slate400.withAlpha(25),
                            borderRadius: BorderRadius.circular(AppRadius.pill),
                          ),
                          child: Text(
                            AppStrings.managerAccountDisabled,
                            style: AppTextStyles.label(AppColors.slate400),
                          ),
                        ),
                      ],
                    ],
                  ),
                  Text(
                    widget.email,
                    style: AppTextStyles.small(colors.onSurfaceVariant),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            if (_busy)
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else
              TextButton(
                onPressed: _reset,
                child: const Text(AppStrings.managerStaffReset),
              ),
          ],
        ),
      ),
    );
  }
}
