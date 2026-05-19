import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/care_plans/domain/care_plan.dart';
import '../../features/medical_history/domain/medical_profile.dart';
import '../../features/medical_history/presentation/medical_history_screen.dart';
import '../../features/medical_history/presentation/medical_profile_editor_screen.dart';
import '../../features/medication/domain/prescribed_med.dart';
import '../../features/medication/presentation/medication_screen.dart';
import '../../features/medication/presentation/prescribed_med_editor_screen.dart';
import '../../features/care_plans/presentation/care_plan_detail_screen.dart';
import '../../features/care_plans/presentation/care_plan_editor_screen.dart';
import '../../features/care_plans/presentation/care_plans_screen.dart';
import '../../features/checklists/presentation/bath_temp_screen.dart';
import '../../features/checklists/presentation/checklist_screen.dart';
import '../../features/checklists/presentation/visitor_log_entry_screen.dart';
import '../../features/checklists/presentation/visitor_log_screen.dart';
import '../../features/checklists/domain/visitor_log_entry.dart';
import '../../features/children/presentation/children_list_screen.dart';
import '../../features/daily_notes/domain/daily_note.dart';
import '../../features/children/presentation/child_profile_screen.dart';
import '../../features/daily_notes/presentation/daily_note_editor_screen.dart';
import '../../features/daily_notes/presentation/daily_notes_list_screen.dart';
import '../../shared/widgets/nav_shell.dart';
import '../errors/placeholder_screen.dart';
import 'app_routes.dart';

part 'app_router.g.dart';

/// Listens to auth state changes and notifies go_router to re-evaluate redirects.
class _AuthChangeNotifier extends ChangeNotifier {
  void notify() => notifyListeners();
}

@riverpod
GoRouter appRouter(Ref ref) {
  final authChange = _AuthChangeNotifier();

  // Fire router refresh on every auth state change.
  ref.listen(authStateChangesProvider, (_, _) => authChange.notify());
  ref.onDispose(authChange.dispose);

  return GoRouter(
    initialLocation: AppRoutes.login,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: authChange,
    redirect: (context, state) {
      final isAuth = ref.read(isAuthenticatedProvider);
      final location = state.matchedLocation;
      final isAuthRoute = location == AppRoutes.login ||
          location == AppRoutes.forgotPassword;

      if (!isAuth && !isAuthRoute) return AppRoutes.login;
      if (isAuth && isAuthRoute) return AppRoutes.children;
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (_, _) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (_, _) => const PlaceholderScreen(title: 'Forgot Password'),
      ),
      ShellRoute(
        builder: (context, state, child) => NavShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.children,
            builder: (_, _) => const ChildrenListScreen(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (_, state) => ChildProfileScreen(
                  childId: state.pathParameters['id']!,
                ),
                routes: [
                  GoRoute(
                    path: 'daily-notes',
                    builder: (_, state) => DailyNotesListScreen(
                      childId: state.pathParameters['id']!,
                    ),
                    routes: [
                      GoRoute(
                        path: 'new',
                        builder: (_, state) => DailyNoteEditorScreen(
                          childId: state.pathParameters['id']!,
                        ),
                      ),
                      GoRoute(
                        path: ':noteId/edit',
                        builder: (_, state) => DailyNoteEditorScreen(
                          childId: state.pathParameters['id']!,
                          existingNote: state.extra as DailyNote?,
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'checklists',
                    builder: (_, state) => ChecklistScreen(
                      childId: state.pathParameters['id']!,
                    ),
                  ),
                  GoRoute(
                    path: 'bath-temp',
                    builder: (_, state) => BathTempScreen(
                      childId: state.pathParameters['id']!,
                    ),
                  ),
                  GoRoute(
                    path: 'medical-history',
                    builder: (_, state) => MedicalHistoryScreen(
                      childId: state.pathParameters['id']!,
                    ),
                    routes: [
                      GoRoute(
                        path: 'edit',
                        builder: (_, state) => MedicalProfileEditorScreen(
                          childId: state.pathParameters['id']!,
                          existing: state.extra as MedicalProfile?,
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'medication',
                    builder: (_, state) => MedicationScreen(
                      childId: state.pathParameters['id']!,
                    ),
                    routes: [
                      GoRoute(
                        path: 'meds/new',
                        builder: (_, state) => PrescribedMedEditorScreen(
                          childId: state.pathParameters['id']!,
                        ),
                      ),
                      GoRoute(
                        path: 'meds/:medId/edit',
                        builder: (_, state) => PrescribedMedEditorScreen(
                          childId: state.pathParameters['id']!,
                          existing: state.extra as PrescribedMed?,
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'care-plans',
                    builder: (_, state) => CarePlansScreen(
                      childId: state.pathParameters['id']!,
                    ),
                    routes: [
                      GoRoute(
                        path: 'new',
                        builder: (_, state) => CarePlanEditorScreen(
                          childId: state.pathParameters['id']!,
                        ),
                      ),
                      GoRoute(
                        path: ':planId',
                        builder: (_, state) => CarePlanDetailScreen(
                          plan: state.extra as CarePlan,
                        ),
                        routes: [
                          GoRoute(
                            path: 'edit',
                            builder: (_, state) => CarePlanEditorScreen(
                              childId: state.pathParameters['id']!,
                              existing: state.extra as CarePlan?,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.dailyNotes,
            builder: (_, _) => const PlaceholderScreen(title: 'Daily Notes'),
          ),
          GoRoute(
            path: AppRoutes.checklists,
            builder: (_, _) => const VisitorLogScreen(),
            routes: [
              GoRoute(
                path: 'new',
                builder: (_, _) => const VisitorLogEntryScreen(),
              ),
              GoRoute(
                path: ':entryId/edit',
                builder: (_, state) => VisitorLogEntryScreen(
                  existing: state.extra as VisitorLogEntry?,
                ),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.medication,
            builder: (_, _) => const PlaceholderScreen(title: 'Medication'),
          ),
          GoRoute(
            path: AppRoutes.incidents,
            builder: (_, _) => const PlaceholderScreen(title: 'Incidents'),
          ),
          GoRoute(
            path: AppRoutes.behaviour,
            builder: (_, _) => const PlaceholderScreen(title: 'Behaviour'),
          ),
          GoRoute(
            path: AppRoutes.sleepDiary,
            builder: (_, _) =>
                const PlaceholderScreen(title: 'Sleep Diary'),
          ),
          GoRoute(
            path: AppRoutes.foodDiary,
            builder: (_, _) =>
                const PlaceholderScreen(title: 'Food Diary'),
          ),
          GoRoute(
            path: AppRoutes.activities,
            builder: (_, _) =>
                const PlaceholderScreen(title: 'Activities'),
          ),
          GoRoute(
            path: AppRoutes.smartSteps,
            builder: (_, _) =>
                const PlaceholderScreen(title: 'Smart Steps'),
          ),
          GoRoute(
            path: AppRoutes.handover,
            builder: (_, _) => const PlaceholderScreen(title: 'Handover'),
          ),
          GoRoute(
            path: AppRoutes.dashboard,
            builder: (_, _) => const PlaceholderScreen(title: 'Dashboard'),
          ),
          GoRoute(
            path: AppRoutes.inspector,
            builder: (_, _) => const PlaceholderScreen(title: 'Inspector'),
          ),
          GoRoute(
            path: AppRoutes.parentPortal,
            builder: (_, _) =>
                const PlaceholderScreen(title: 'Parent Portal'),
          ),
          GoRoute(
            path: AppRoutes.settings,
            builder: (_, _) => const PlaceholderScreen(title: 'Settings'),
          ),
        ],
      ),
    ],
  );
}
