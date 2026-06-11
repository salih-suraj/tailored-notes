import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../features/auth/domain/app_user.dart';
import '../../../features/auth/domain/user_role.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import '../../../shared/models/app_strings.dart';

part 'settings_screen.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() => ThemeMode.system;

  void set(ThemeMode mode) => state = mode;
}

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final themeMode = ref.watch(themeModeNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.navSettings)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          if (user != null) ...[
            _UserCard(user: user),
            const SizedBox(height: AppSpacing.lg),
          ],

          // ── Appearance ───────────────────────────────────────────────────
          _SectionHeader(AppStrings.settingsAppearance),
          const SizedBox(height: AppSpacing.sm),
          _SettingsCard(
            child: Column(
              children: [
                _ThemeOption(
                  label: AppStrings.settingsThemeSystem,
                  icon: Icons.brightness_auto_outlined,
                  selected: themeMode == ThemeMode.system,
                  onTap: () => ref
                      .read(themeModeNotifierProvider.notifier)
                      .set(ThemeMode.system),
                ),
                const Divider(height: 1),
                _ThemeOption(
                  label: AppStrings.settingsThemeLight,
                  icon: Icons.light_mode_outlined,
                  selected: themeMode == ThemeMode.light,
                  onTap: () => ref
                      .read(themeModeNotifierProvider.notifier)
                      .set(ThemeMode.light),
                ),
                const Divider(height: 1),
                _ThemeOption(
                  label: AppStrings.settingsThemeDark,
                  icon: Icons.dark_mode_outlined,
                  selected: themeMode == ThemeMode.dark,
                  onTap: () => ref
                      .read(themeModeNotifierProvider.notifier)
                      .set(ThemeMode.dark),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // ── Account ──────────────────────────────────────────────────────
          _SectionHeader(AppStrings.settingsAccount),
          const SizedBox(height: AppSpacing.sm),
          _SettingsCard(
            child: _SettingsTile(
              icon: Icons.logout,
              label: AppStrings.settingsSignOut,
              color: AppColors.red,
              onTap: () => _confirmSignOut(context, ref),
            ),
          ),

          const SizedBox(height: 80),
        ],
      ),
    );
  }

  void _confirmSignOut(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(AppStrings.settingsSignOutTitle),
        content: const Text(AppStrings.settingsSignOutBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              ref.read(authNotifierProvider.notifier).signOut();
            },
            child: Text(
              AppStrings.settingsSignOut,
              style: TextStyle(color: AppColors.red),
            ),
          ),
        ],
      ),
    );
  }
}

// ── User info card ────────────────────────────────────────────────────────────

class _UserCard extends StatelessWidget {
  const _UserCard({required this.user});
  final AppUser user;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: AppColors.teal400.withAlpha(20),
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.teal400,
              child: Text(
                _initials(user.displayName ?? user.email),
                style: AppTextStyles.h3(Colors.white),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.displayName ?? user.email,
                    style: AppTextStyles.h3(colors.onSurface),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    user.email,
                    style: AppTextStyles.small(colors.onSurfaceVariant),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  _RoleBadge(user.role),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }
}

class _RoleBadge extends StatelessWidget {
  const _RoleBadge(this.role);
  final UserRole role;

  @override
  Widget build(BuildContext context) {
    final color = switch (role) {
      UserRole.manager => AppColors.roleManager,
      UserRole.teamLeader => AppColors.roleTeamLeader,
      UserRole.supportWorker => AppColors.roleSupportWorker,
      UserRole.inspector => AppColors.roleInspector,
      UserRole.parentGuardian => AppColors.blue,
    };
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(color: color.withAlpha(80)),
      ),
      child: Text(role.displayName, style: AppTextStyles.small(color)),
    );
  }
}

// ── Theme option tile ─────────────────────────────────────────────────────────

class _ThemeOption extends StatelessWidget {
  const _ThemeOption({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md, vertical: AppSpacing.sm),
        child: Row(
          children: [
            Icon(icon,
                size: 18,
                color: selected ? AppColors.teal400 : colors.onSurfaceVariant),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.body(
                    selected ? AppColors.teal400 : colors.onSurface),
              ),
            ),
            if (selected)
              const Icon(Icons.check, size: 16, color: AppColors.teal400),
          ],
        ),
      ),
    );
  }
}

// ── Generic settings tile ─────────────────────────────────────────────────────

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final tileColor = color ?? colors.onSurface;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md, vertical: AppSpacing.md),
        child: Row(
          children: [
            Icon(icon, size: 18, color: tileColor),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: Text(label, style: AppTextStyles.body(tileColor))),
          ],
        ),
      ),
    );
  }
}

// ── Layout helpers ────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Text(title, style: AppTextStyles.label(colors.onSurfaceVariant));
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: child,
      ),
    );
  }
}
