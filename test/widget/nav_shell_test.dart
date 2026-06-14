import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:tailored_notes/features/auth/domain/app_user.dart';
import 'package:tailored_notes/features/auth/domain/user_role.dart';
import 'package:tailored_notes/features/auth/presentation/providers/auth_provider.dart';
import 'package:tailored_notes/shared/models/app_strings.dart';
import 'package:tailored_notes/shared/widgets/nav_shell.dart';

Widget _host(UserRole role) {
  final router = GoRouter(
    initialLocation: '/children',
    routes: [
      ShellRoute(
        builder: (context, state, child) => NavShell(child: child),
        routes: [
          GoRoute(
            path: '/children',
            builder: (_, _) =>
                const Scaffold(body: Center(child: Text('body'))),
          ),
        ],
      ),
    ],
  );
  return ProviderScope(
    overrides: [
      currentUserProvider.overrideWith(
        (ref) => AppUser(
          id: 'u',
          email: 'u@x',
          role: role,
          homeId: 'h',
          isMfaVerified: true,
        ),
      ),
    ],
    child: MaterialApp.router(routerConfig: router),
  );
}

void main() {
  // Force a phone-sized viewport so NavShell renders the bottom NavigationBar
  // (with visible labels) rather than the tablet rail.
  Future<void> pumpAs(WidgetTester tester, UserRole role) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(_host(role));
    await tester.pumpAndSettle();
  }

  void expectTabs(List<String> present, List<String> absent) {
    for (final label in present) {
      expect(find.text(label), findsOneWidget, reason: 'expected tab "$label"');
    }
    for (final label in absent) {
      expect(
        find.text(label),
        findsNothing,
        reason: 'tab "$label" should not be visible',
      );
    }
  }

  testWidgets('support worker: children, daily notes, checklists, settings', (
    tester,
  ) async {
    await pumpAs(tester, UserRole.supportWorker);
    expectTabs(
      [
        AppStrings.navChildren,
        AppStrings.navDailyNotes,
        AppStrings.navChecklists,
        AppStrings.navSettings,
      ],
      [
        AppStrings.navDashboard,
        AppStrings.navHandover,
        AppStrings.navInspector,
        AppStrings.navMyChild,
      ],
    );
  });

  testWidgets('team leader: adds handover on top of support worker', (
    tester,
  ) async {
    await pumpAs(tester, UserRole.teamLeader);
    expectTabs(
      [
        AppStrings.navChildren,
        AppStrings.navDailyNotes,
        AppStrings.navChecklists,
        AppStrings.navHandover,
        AppStrings.navSettings,
      ],
      [AppStrings.navDashboard, AppStrings.navInspector, AppStrings.navMyChild],
    );
  });

  testWidgets('manager: children, dashboard, handover, settings', (
    tester,
  ) async {
    await pumpAs(tester, UserRole.manager);
    expectTabs(
      [
        AppStrings.navChildren,
        AppStrings.navDashboard,
        AppStrings.navHandover,
        AppStrings.navSettings,
      ],
      [
        AppStrings.navDailyNotes,
        AppStrings.navChecklists,
        AppStrings.navInspector,
        AppStrings.navMyChild,
      ],
    );
  });

  testWidgets('inspector: only the portal and settings (no home tabs)', (
    tester,
  ) async {
    await pumpAs(tester, UserRole.inspector);
    expectTabs(
      [AppStrings.navInspector, AppStrings.navSettings],
      [
        AppStrings.navChildren,
        AppStrings.navDailyNotes,
        AppStrings.navChecklists,
        AppStrings.navHandover,
        AppStrings.navDashboard,
        AppStrings.navMyChild,
      ],
    );
  });

  testWidgets('parent: only My Child and settings', (tester) async {
    await pumpAs(tester, UserRole.parentGuardian);
    expectTabs(
      [AppStrings.navMyChild, AppStrings.navSettings],
      [
        AppStrings.navChildren,
        AppStrings.navDailyNotes,
        AppStrings.navChecklists,
        AppStrings.navHandover,
        AppStrings.navDashboard,
        AppStrings.navInspector,
      ],
    );
  });
}
