import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/routing/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../features/auth/domain/user_role.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../models/app_strings.dart';

/// A single navigation destination entry.
class _NavItem {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.route,
    required this.semanticLabel,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
  final String route;
  final String semanticLabel;
}

/// Returns the list of nav destinations visible to [role].
List<_NavItem> _destinationsForRole(UserRole role) {
  const children = _NavItem(
    label: AppStrings.navChildren,
    icon: Icons.people_outline,
    activeIcon: Icons.people,
    route: AppRoutes.children,
    semanticLabel: 'Children list',
  );
  const dailyNotes = _NavItem(
    label: AppStrings.navDailyNotes,
    icon: Icons.edit_note_outlined,
    activeIcon: Icons.edit_note,
    route: AppRoutes.dailyNotes,
    semanticLabel: 'Daily notes',
  );
  const checklists = _NavItem(
    label: AppStrings.navChecklists,
    icon: Icons.checklist_outlined,
    activeIcon: Icons.checklist,
    route: AppRoutes.checklists,
    semanticLabel: 'Checklists',
  );
  const handover = _NavItem(
    label: AppStrings.navHandover,
    icon: Icons.sync_alt_outlined,
    activeIcon: Icons.sync_alt,
    route: AppRoutes.handover,
    semanticLabel: 'Shift handover',
  );
  const dashboard = _NavItem(
    label: AppStrings.navDashboard,
    icon: Icons.dashboard_outlined,
    activeIcon: Icons.dashboard,
    route: AppRoutes.dashboard,
    semanticLabel: 'Manager dashboard',
  );
  const inspector = _NavItem(
    label: AppStrings.navInspector,
    icon: Icons.verified_user_outlined,
    activeIcon: Icons.verified_user,
    route: AppRoutes.inspector,
    semanticLabel: 'Inspector portal',
  );
  const parentPortal = _NavItem(
    label: AppStrings.navMyChild,
    icon: Icons.child_care_outlined,
    activeIcon: Icons.child_care,
    route: AppRoutes.parentPortal,
    semanticLabel: 'Parent portal',
  );
  const settings = _NavItem(
    label: AppStrings.navSettings,
    icon: Icons.settings_outlined,
    activeIcon: Icons.settings,
    route: AppRoutes.settings,
    semanticLabel: 'Settings',
  );

  return switch (role) {
    UserRole.supportWorker => [children, dailyNotes, checklists, settings],
    UserRole.teamLeader =>
      [children, dailyNotes, checklists, handover, settings],
    UserRole.manager => [children, dashboard, handover, settings],
    UserRole.inspector => [children, inspector, settings],
    UserRole.parentGuardian => [parentPortal, settings],
  };
}

/// Adaptive navigation shell — bottom [NavigationBar] on mobile,
/// [NavigationRail] on tablet (≥ 600 dp), extended rail on wide screens (≥ 1200 dp).
class NavShell extends ConsumerWidget {
  const NavShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final role = user?.role ?? UserRole.supportWorker;
    final destinations = _destinationsForRole(role);

    final location = GoRouterState.of(context).matchedLocation;
    int selectedIndex = 0;
    for (int i = 0; i < destinations.length; i++) {
      if (location.startsWith(destinations[i].route)) {
        selectedIndex = i;
        break;
      }
    }

    final width = MediaQuery.of(context).size.width;
    final isTablet = width >= 600;
    final isWide = width >= 1200;

    if (isTablet) {
      return _TabletShell(
        destinations: destinations,
        selectedIndex: selectedIndex,
        extended: isWide,
        child: child,
      );
    }
    return _MobileShell(
      destinations: destinations,
      selectedIndex: selectedIndex,
      child: child,
    );
  }
}

class _MobileShell extends StatelessWidget {
  const _MobileShell({
    required this.destinations,
    required this.selectedIndex,
    required this.child,
  });

  final List<_NavItem> destinations;
  final int selectedIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (i) => context.go(destinations[i].route),
        backgroundColor: colors.surfaceContainerLow,
        indicatorColor: AppColors.teal50,
        height: 64,
        destinations: destinations
            .map(
              (d) => NavigationDestination(
                icon: Semantics(
                  label: d.semanticLabel,
                  child: Icon(d.icon),
                ),
                selectedIcon: Icon(d.activeIcon, color: AppColors.teal600),
                label: d.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TabletShell extends StatelessWidget {
  const _TabletShell({
    required this.destinations,
    required this.selectedIndex,
    required this.extended,
    required this.child,
  });

  final List<_NavItem> destinations;
  final int selectedIndex;
  final bool extended;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: (i) => context.go(destinations[i].route),
            extended: extended,
            backgroundColor: colors.surfaceContainerLow,
            indicatorColor: AppColors.teal50,
            minWidth: AppTapTarget.min,
            minExtendedWidth: 200,
            destinations: destinations
                .map(
                  (d) => NavigationRailDestination(
                    icon: Semantics(
                      label: d.semanticLabel,
                      child: Icon(d.icon),
                    ),
                    selectedIcon: Icon(d.activeIcon, color: AppColors.teal600),
                    label: Text(d.label),
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.sm,
                    ),
                  ),
                )
                .toList(),
          ),
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: colors.outline,
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
