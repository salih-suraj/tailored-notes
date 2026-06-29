/// Named route paths. All navigation goes through these constants.
abstract final class AppRoutes {
  // Auth
  static const login = '/login';
  static const forgotPassword = '/forgot-password';
  static const mfa = '/mfa';
  static const setPassword = '/set-password';

  // Shell (role-gated nav shell hosts these)
  static const children = '/children';
  static const addChild = '/children/new';
  static const childProfile = '/children/:id';

  // Daily notes — nested under child profile
  static const childDailyNotes = '/children/:childId/daily-notes';
  static const childDailyNoteNew = '/children/:childId/daily-notes/new';
  static const childDailyNoteEdit =
      '/children/:childId/daily-notes/:noteId/edit';

  // Cleaning checklists — nested under child profile
  static const childChecklists = '/children/:id/checklists';

  // Bath temperature — nested under child profile
  static const childBathTemp = '/children/:id/bath-temp';

  // Smart Steps — nested under child profile
  static const childSmartSteps = '/children/:id/smart-steps';
  static const childSmartStepsNew = '/children/:id/smart-steps/new';
  static const childSmartStepsDetail = '/children/:id/smart-steps/:stepId';
  static const childSmartStepsEdit = '/children/:id/smart-steps/:stepId/edit';

  // Activities — nested under child profile
  static const childActivities = '/children/:id/activities';
  static const childActivitiesNew = '/children/:id/activities/new';
  static const childActivitiesEdit = '/children/:id/activities/:entryId/edit';

  // Food diary — nested under child profile
  static const childFoodDiary = '/children/:id/food-diary';
  static const childFoodNew = '/children/:id/food-diary/new';
  static const childFoodEdit = '/children/:id/food-diary/:entryId/edit';

  // Sleep diary — nested under child profile
  static const childSleepDiary = '/children/:id/sleep-diary';
  static const childSleepNew = '/children/:id/sleep-diary/new';
  static const childSleepEdit = '/children/:id/sleep-diary/:entryId/edit';

  // Behaviour — nested under child profile
  static const childBehaviour = '/children/:id/behaviour';
  static const childBehaviourNew = '/children/:id/behaviour/new';
  static const childBehaviourEdit = '/children/:id/behaviour/:incidentId/edit';

  // Medical history — nested under child profile
  static const childMedicalHistory = '/children/:id/medical-history';
  static const childMedicalHistoryEdit = '/children/:id/medical-history/edit';

  // Medication — nested under child profile
  static const childMedication = '/children/:id/medication';
  static const childMedNew = '/children/:id/medication/meds/new';
  static const childMedEdit = '/children/:id/medication/meds/:medId/edit';

  // Incidents — nested under child profile
  static const childIncidents = '/children/:id/incidents';
  static const childIncidentNew = '/children/:id/incidents/new';
  static const childIncidentEdit = '/children/:id/incidents/:incidentId/edit';

  // Care plans — nested under child profile
  static const childCarePlans = '/children/:id/care-plans';
  static const childCarePlanNew = '/children/:id/care-plans/new';
  static const childCarePlanDetail = '/children/:id/care-plans/:planId';
  static const childCarePlanEdit = '/children/:id/care-plans/:planId/edit';

  // Visitor log — under Checklists hub
  static const visitorLog = '/checklists/visitors';
  static const visitorLogNew = '/checklists/visitors/new';
  static const visitorLogEdit = '/checklists/visitors/:entryId/edit';

  // Home cleaning — under Checklists hub
  static const homeCleaning = '/checklists/cleaning';

  static const dailyNotes = '/daily-notes';
  static const checklists = '/checklists';
  static const handover = '/handover';
  static const handoverSummary = '/handover/summary';
  static const behaviourPatterns = '/dashboard/behaviour-patterns';
  static const dashboard = '/dashboard';
  static const managerInspectorAccess = '/dashboard/inspector-access';
  static const managerParentAccess = '/dashboard/parent-access';
  static const managerStaff = '/dashboard/staff';

  // Inspector portal — nested under /inspector
  static const inspector = '/inspector';
  static const inspectorGrant = '/inspector/:grantId';
  static const inspectorRecords = '/inspector/:grantId/:module';
  static const inspectorRecordsForChild =
      '/inspector/:grantId/:module/:childId';
  static const inspectorFeedbackNew = '/inspector/:grantId/feedback/new';

  // Parent portal — nested under /parent-portal
  static const parentPortal = '/parent-portal';
  static const parentChildFeed = '/parent-portal/:linkId';
  static const settings = '/settings';
}
