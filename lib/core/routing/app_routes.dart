/// Named route paths. All navigation goes through these constants.
abstract final class AppRoutes {
  // Auth
  static const login = '/login';
  static const forgotPassword = '/forgot-password';

  // Shell (role-gated nav shell hosts these)
  static const home = '/home';
  static const children = '/children';
  static const childProfile = '/children/:id';

  // Daily notes — nested under child profile
  static const childDailyNotes = '/children/:childId/daily-notes';
  static const childDailyNoteNew = '/children/:childId/daily-notes/new';
  static const childDailyNoteEdit = '/children/:childId/daily-notes/:noteId/edit';

  // Cleaning checklists — nested under child profile
  static const childChecklists = '/children/:id/checklists';

  // Bath temperature — nested under child profile
  static const childBathTemp = '/children/:id/bath-temp';

  // Medical history — nested under child profile
  static const childMedicalHistory = '/children/:id/medical-history';
  static const childMedicalHistoryEdit = '/children/:id/medical-history/edit';

  // Medication — nested under child profile
  static const childMedication = '/children/:id/medication';
  static const childMedNew = '/children/:id/medication/meds/new';
  static const childMedEdit = '/children/:id/medication/meds/:medId/edit';

  // Care plans — nested under child profile
  static const childCarePlans = '/children/:id/care-plans';
  static const childCarePlanNew = '/children/:id/care-plans/new';
  static const childCarePlanDetail = '/children/:id/care-plans/:planId';
  static const childCarePlanEdit = '/children/:id/care-plans/:planId/edit';

  // Visitor log — top-level, accessed via Checklists nav tab
  static const visitorLogNew = '/checklists/new';
  static const visitorLogEdit = '/checklists/:entryId/edit';

  static const dailyNotes = '/daily-notes';
  static const dailyNoteEditor = '/daily-notes/:id/edit';
  static const checklists = '/checklists';
  static const medication = '/medication';
  static const incidents = '/incidents';
  static const incidentEditor = '/incidents/:id/edit';
  static const behaviour = '/behaviour';
  static const sleepDiary = '/sleep-diary';
  static const foodDiary = '/food-diary';
  static const activities = '/activities';
  static const smartSteps = '/smart-steps';
  static const handover = '/handover';
  static const dashboard = '/dashboard';
  static const inspector = '/inspector';
  static const parentPortal = '/parent-portal';
  static const settings = '/settings';
}
