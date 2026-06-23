import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/mfa_screen.dart';
import '../../features/handover/presentation/team_leader_oversight_screen.dart';
import '../../features/incidents/domain/incident_report.dart';
import '../../features/incidents/presentation/incident_report_editor_screen.dart';
import '../../features/incidents/presentation/incidents_screen.dart';
import '../../features/auth/domain/user_role.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/behaviour/domain/behaviour_incident.dart';
import '../../features/activities/domain/activity_entry.dart';
import '../../features/smart_steps/domain/smart_step.dart';
import '../../features/smart_steps/presentation/smart_step_detail_screen.dart';
import '../../features/smart_steps/presentation/smart_step_editor_screen.dart';
import '../../features/smart_steps/presentation/smart_steps_screen.dart';
import '../../features/activities/presentation/activities_screen.dart';
import '../../features/activities/presentation/activity_entry_editor_screen.dart';
import '../../features/food_diary/domain/food_entry.dart';
import '../../features/food_diary/presentation/food_diary_screen.dart';
import '../../features/food_diary/presentation/food_entry_editor_screen.dart';
import '../../features/sleep_diary/domain/sleep_entry.dart';
import '../../features/sleep_diary/presentation/sleep_diary_screen.dart';
import '../../features/sleep_diary/presentation/sleep_entry_editor_screen.dart';
import '../../features/behaviour/presentation/behaviour_incident_editor_screen.dart';
import '../../features/behaviour/presentation/behaviour_screen.dart';
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
import '../../features/checklists/presentation/home_cleaning_screen.dart';
import '../../features/checklists/presentation/visitor_log_entry_screen.dart';
import '../../features/checklists/presentation/visitor_log_screen.dart';
import '../../features/checklists/domain/visitor_log_entry.dart';
import '../../features/children/presentation/add_child_screen.dart';
import '../../features/dashboard/presentation/behaviour_pattern_screen.dart';
import '../../features/dashboard/presentation/manager_dashboard_screen.dart';
import '../../features/handover/presentation/handover_summary_screen.dart';
import '../../features/children/presentation/children_list_screen.dart';
import '../../features/daily_notes/domain/daily_note.dart';
import '../../features/daily_notes/presentation/daily_notes_hub_screen.dart';
import '../../features/children/presentation/child_profile_screen.dart';
import '../../features/daily_notes/presentation/daily_note_editor_screen.dart';
import '../../features/daily_notes/presentation/daily_notes_list_screen.dart';
import '../../features/inspector/presentation/inspector_feedback_editor_screen.dart';
import '../../features/inspector/presentation/inspector_home_access_screen.dart';
import '../../features/inspector/presentation/inspector_portal_screen.dart';
import '../../features/inspector/presentation/inspector_records_screen.dart';
import '../../features/inspector/presentation/manager_inspector_access_screen.dart';
import '../../features/parent_portal/presentation/manager_parent_access_screen.dart';
import '../../features/parent_portal/presentation/parent_child_feed_screen.dart';
import '../../features/parent_portal/presentation/parent_portal_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/staff/presentation/manager_staff_screen.dart';
import '../../shared/widgets/nav_shell.dart';
import '../errors/placeholder_screen.dart';
import 'app_routes.dart';

part 'app_router.g.dart';

/// Listens to auth state changes and notifies go_router to re-evaluate redirects.
class _AuthChangeNotifier extends ChangeNotifier {
  void notify() => notifyListeners();
}

/// Returns the default landing route for [role] after login / MFA.
String _defaultRoute(UserRole role) => switch (role) {
  UserRole.supportWorker => AppRoutes.children,
  UserRole.teamLeader => AppRoutes.children,
  UserRole.manager => AppRoutes.children,
  UserRole.inspector => AppRoutes.inspector,
  UserRole.parentGuardian => AppRoutes.parentPortal,
};

/// Returns true if [role] is allowed to visit [location].
/// Settings is always permitted. All other routes are role-gated.
bool _isRouteAllowed(String location, UserRole role) {
  if (location.startsWith(AppRoutes.settings)) return true;
  final allowed = switch (role) {
    UserRole.supportWorker => [
      AppRoutes.children,
      AppRoutes.dailyNotes,
      AppRoutes.checklists,
    ],
    UserRole.teamLeader => [
      AppRoutes.children,
      AppRoutes.dailyNotes,
      AppRoutes.checklists,
      AppRoutes.handover,
    ],
    UserRole.manager => [
      AppRoutes.children,
      AppRoutes.dashboard,
      AppRoutes.handover,
    ],
    // Inspectors only reach children through an access grant in the portal —
    // the home-scoped /children routes are off-limits.
    UserRole.inspector => [AppRoutes.inspector],
    UserRole.parentGuardian => [AppRoutes.parentPortal],
  };
  return allowed.any(location.startsWith);
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
      final user = ref.read(currentUserProvider);
      final location = state.matchedLocation;
      final isAuthRoute =
          location == AppRoutes.login || location == AppRoutes.forgotPassword;
      final isMfaRoute = location == AppRoutes.mfa;

      // Not logged in — send to login.
      if (user == null && !isAuthRoute) return AppRoutes.login;
      if (user == null) return null;

      // Logged in but on auth screen — send to correct landing page.
      if (isAuthRoute) {
        return user.needsMfaChallenge
            ? AppRoutes.mfa
            : _defaultRoute(user.role);
      }

      // MFA checks. /mfa is fully resolved here — it must not fall through
      // to the role guard below, which would bounce the user off the MFA
      // screen and into a redirect loop (/mfa => role home => /mfa).
      if (user.needsMfaChallenge && !isMfaRoute) return AppRoutes.mfa;
      if (isMfaRoute) {
        return user.needsMfaChallenge ? null : _defaultRoute(user.role);
      }

      // Role-based route guard — redirect to role's home if route is forbidden.
      if (!_isRouteAllowed(location, user.role)) {
        return _defaultRoute(user.role);
      }

      return null;
    },
    routes: [
      GoRoute(path: AppRoutes.login, builder: (_, _) => const LoginScreen()),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (_, _) => const PlaceholderScreen(title: 'Forgot Password'),
      ),
      GoRoute(path: AppRoutes.mfa, builder: (_, _) => const MfaScreen()),
      ShellRoute(
        builder: (context, state, child) => NavShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.children,
            builder: (_, _) => const ChildrenListScreen(),
            routes: [
              GoRoute(path: 'new', builder: (_, _) => const AddChildScreen()),
              GoRoute(
                path: ':id',
                builder: (_, state) =>
                    ChildProfileScreen(childId: state.pathParameters['id']!),
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
                    builder: (_, state) =>
                        ChecklistScreen(childId: state.pathParameters['id']!),
                  ),
                  GoRoute(
                    path: 'bath-temp',
                    builder: (_, state) =>
                        BathTempScreen(childId: state.pathParameters['id']!),
                  ),
                  GoRoute(
                    path: 'smart-steps',
                    builder: (_, state) =>
                        SmartStepsScreen(childId: state.pathParameters['id']!),
                    routes: [
                      GoRoute(
                        path: 'new',
                        builder: (_, state) => SmartStepEditorScreen(
                          childId: state.pathParameters['id']!,
                        ),
                      ),
                      GoRoute(
                        path: ':stepId',
                        builder: (_, state) => SmartStepDetailScreen(
                          step: state.extra as SmartStep,
                        ),
                        routes: [
                          GoRoute(
                            path: 'edit',
                            builder: (_, state) => SmartStepEditorScreen(
                              childId: state.pathParameters['id']!,
                              existing: state.extra as SmartStep?,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'activities',
                    builder: (_, state) =>
                        ActivitiesScreen(childId: state.pathParameters['id']!),
                    routes: [
                      GoRoute(
                        path: 'new',
                        builder: (_, state) => ActivityEntryEditorScreen(
                          childId: state.pathParameters['id']!,
                        ),
                      ),
                      GoRoute(
                        path: ':entryId/edit',
                        builder: (_, state) => ActivityEntryEditorScreen(
                          childId: state.pathParameters['id']!,
                          existing: state.extra as ActivityEntry?,
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'food-diary',
                    builder: (_, state) =>
                        FoodDiaryScreen(childId: state.pathParameters['id']!),
                    routes: [
                      GoRoute(
                        path: 'new',
                        builder: (_, state) => FoodEntryEditorScreen(
                          childId: state.pathParameters['id']!,
                        ),
                      ),
                      GoRoute(
                        path: ':entryId/edit',
                        builder: (_, state) => FoodEntryEditorScreen(
                          childId: state.pathParameters['id']!,
                          existing: state.extra as FoodEntry?,
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'sleep-diary',
                    builder: (_, state) =>
                        SleepDiaryScreen(childId: state.pathParameters['id']!),
                    routes: [
                      GoRoute(
                        path: 'new',
                        builder: (_, state) => SleepEntryEditorScreen(
                          childId: state.pathParameters['id']!,
                        ),
                      ),
                      GoRoute(
                        path: ':entryId/edit',
                        builder: (_, state) => SleepEntryEditorScreen(
                          childId: state.pathParameters['id']!,
                          existing: state.extra as SleepEntry?,
                        ),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'behaviour',
                    builder: (_, state) =>
                        BehaviourScreen(childId: state.pathParameters['id']!),
                    routes: [
                      GoRoute(
                        path: 'new',
                        builder: (_, state) => BehaviourIncidentEditorScreen(
                          childId: state.pathParameters['id']!,
                        ),
                      ),
                      GoRoute(
                        path: ':incidentId/edit',
                        builder: (_, state) => BehaviourIncidentEditorScreen(
                          childId: state.pathParameters['id']!,
                          existing: state.extra as BehaviourIncident?,
                        ),
                      ),
                    ],
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
                    builder: (_, state) =>
                        MedicationScreen(childId: state.pathParameters['id']!),
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
                    builder: (_, state) =>
                        CarePlansScreen(childId: state.pathParameters['id']!),
                    routes: [
                      GoRoute(
                        path: 'new',
                        builder: (_, state) => CarePlanEditorScreen(
                          childId: state.pathParameters['id']!,
                        ),
                      ),
                      GoRoute(
                        path: ':planId',
                        builder: (_, state) =>
                            CarePlanDetailScreen(plan: state.extra as CarePlan),
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
                  GoRoute(
                    path: 'incidents',
                    builder: (_, state) =>
                        IncidentsScreen(childId: state.pathParameters['id']!),
                    routes: [
                      GoRoute(
                        path: 'new',
                        builder: (_, state) => IncidentReportEditorScreen(
                          childId: state.pathParameters['id']!,
                        ),
                      ),
                      GoRoute(
                        path: ':incidentId/edit',
                        builder: (_, state) => IncidentReportEditorScreen(
                          childId: state.pathParameters['id']!,
                          existing: state.extra as IncidentReport?,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.dailyNotes,
            builder: (_, _) => const DailyNotesHubScreen(),
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
              // Cleaning kept in router for future re-enable.
              GoRoute(
                path: 'cleaning',
                builder: (_, _) => const HomeCleaningScreen(),
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
            builder: (_, _) => const PlaceholderScreen(title: 'Sleep Diary'),
          ),
          GoRoute(
            path: AppRoutes.foodDiary,
            builder: (_, _) => const PlaceholderScreen(title: 'Food Diary'),
          ),
          GoRoute(
            path: AppRoutes.activities,
            builder: (_, _) => const PlaceholderScreen(title: 'Activities'),
          ),
          GoRoute(
            path: AppRoutes.smartSteps,
            builder: (_, _) => const PlaceholderScreen(title: 'Smart Steps'),
          ),
          GoRoute(
            path: AppRoutes.handover,
            builder: (_, _) => const TeamLeaderOversightScreen(),
            routes: [
              GoRoute(
                path: 'summary',
                builder: (_, _) => const HandoverSummaryScreen(),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.dashboard,
            builder: (_, _) => const ManagerDashboardScreen(),
            routes: [
              GoRoute(
                path: 'behaviour-patterns',
                builder: (_, _) => const BehaviourPatternScreen(),
              ),
              GoRoute(
                path: 'inspector-access',
                builder: (_, _) => const ManagerInspectorAccessScreen(),
              ),
              GoRoute(
                path: 'parent-access',
                builder: (_, _) => const ManagerParentAccessScreen(),
              ),
              GoRoute(
                path: 'staff',
                builder: (_, _) => const ManagerStaffScreen(),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.inspector,
            builder: (_, _) => const InspectorPortalScreen(),
            routes: [
              GoRoute(
                path: ':grantId',
                builder: (_, state) => InspectorHomeAccessScreen(
                  grantId: state.pathParameters['grantId']!,
                ),
                routes: [
                  GoRoute(
                    path: 'feedback/new',
                    builder: (_, state) => InspectorFeedbackEditorScreen(
                      grantId: state.pathParameters['grantId']!,
                    ),
                  ),
                  GoRoute(
                    path: ':module',
                    builder: (_, state) => InspectorRecordsScreen(
                      grantId: state.pathParameters['grantId']!,
                      moduleKey: state.pathParameters['module']!,
                    ),
                    routes: [
                      GoRoute(
                        path: ':childId',
                        builder: (_, state) => InspectorRecordsScreen(
                          grantId: state.pathParameters['grantId']!,
                          moduleKey: state.pathParameters['module']!,
                          childId: state.pathParameters['childId'],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.parentPortal,
            builder: (_, _) => const ParentPortalScreen(),
            routes: [
              GoRoute(
                path: ':linkId',
                builder: (_, state) => ParentChildFeedScreen(
                  linkId: state.pathParameters['linkId']!,
                ),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.settings,
            builder: (_, _) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
}
