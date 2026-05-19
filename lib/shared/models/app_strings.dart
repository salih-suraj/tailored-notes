/// All user-facing strings. Never use inline string literals in the UI.
/// Prepared for flutter_localizations — replace with ARB-generated class when ready.
abstract final class AppStrings {
  // App
  static const appName = 'TailorEd Notes';
  static const appTagline = 'Care documentation for residential homes';

  // Auth
  static const emailLabel = 'EMAIL ADDRESS';
  static const passwordLabel = 'PASSWORD';
  static const signIn = 'Sign in';
  static const forgotPassword = 'Forgot password?';
  static const emailRequired = 'Email is required';
  static const emailInvalid = 'Enter a valid email';
  static const passwordRequired = 'Password is required';
  static const showPassword = 'Show password';
  static const hidePassword = 'Hide password';

  // Navigation
  static const navChildren = 'Children';
  static const navDailyNotes = 'Daily Notes';
  static const navChecklists = 'Checklists';
  static const navMedication = 'Medication';
  static const navIncidents = 'Incidents';
  static const navDashboard = 'Dashboard';
  static const navSettings = 'Settings';
  static const navHandover = 'Handover';
  static const navInspector = 'Inspector';
  static const navMyChild = 'My Child';

  // Children
  static const childrenTitle = 'Children';
  static const noChildren = 'No children have been added yet';
  static const childProfile = 'Child Profile';
  static const childNotFound = 'Child not found';
  static const addChild = 'Add child';

  // Child profile — section headers
  static const careRecordSection = 'CARE RECORD';

  // Child profile — module labels and descriptions
  static const moduleDailyNotes = 'Daily Notes';
  static const moduleDailyNotesDesc = 'Observations and shift updates';
  static const moduleCleaning = 'Cleaning';
  static const moduleCleaningDesc = 'Room and communal area checklists';
  static const moduleMedication = 'Medication';
  static const moduleMedicationDesc = 'MAR, PRN and refusals';
  static const moduleBehaviour = 'Behaviour';
  static const moduleBehaviourDesc = 'Incidents and monitoring';
  static const moduleSleepDiary = 'Sleep Diary';
  static const moduleSleepDiaryDesc = 'Sleep and rest records';
  static const moduleFoodDiary = 'Food Diary';
  static const moduleFoodDiaryDesc = 'Meals and nutrition';
  static const moduleActivities = 'Activities & Achievements';
  static const moduleActivitiesDesc = 'Reward charts and Smart Steps';
  static const moduleCarePlans = 'Care Plans';
  static const moduleCarePlansDesc = 'Child-centred care plans and goals';
  static const moduleMedicalHistory = 'Medical History';
  static const moduleMedicalHistoryDesc =
      'Diagnoses, allergies, and healthcare contacts';

  // Daily notes
  static const dailyNotesTitle = 'Daily Notes';
  static const addObservation = 'Add observation';
  static const newObservation = 'New Observation';
  static const editObservation = 'Edit Observation';
  static const noObservations = 'No observations yet';
  static const noObservationsForShift = 'No observations for this shift';
  static const noObservationsHint = 'Tap + to add the first one';
  static const observationHint = 'Write your observation here…';
  static const observationEmpty = 'Observation cannot be empty.';
  static const deleteObservation = 'Delete observation?';
  static const deleteObservationConfirm =
      'This observation will be permanently removed.';
  static const saveFailed = 'Failed to save. Please try again.';
  static const startVoiceInput = 'Start voice input';
  static const stopVoiceInput = 'Stop voice input';

  // Checklists
  static const checklistsTitle = 'Cleaning';
  static const checklistRoomSection = 'ROOM';
  static const checklistCommunalSection = 'COMMUNAL AREAS';
  static const checklistBedroom = 'Bedroom';

  // Medical history
  static const medHistoryTitle = 'Medical History';
  static const medHistoryEditProfile = 'Edit Medical Information';
  static const medHistoryEmpty = 'No medical information recorded yet';
  static const medHistoryEmptyHint =
      'Tap Edit to add health information or + to add a contact';
  static const medHistoryKeyInfo = 'KEY INFORMATION';
  static const medHistoryAllergies = 'ALLERGIES & ADVERSE REACTIONS';
  static const medHistoryAllergiesHint =
      'List all known allergies — this information appears prominently';
  static const medHistoryAllergiesHintField =
      'e.g. Penicillin (anaphylaxis), Latex (rash), Nuts (severe)';
  static const medHistoryConditions = 'CONDITIONS & DIAGNOSES';
  static const medHistoryConditionsHint =
      'e.g. ASD, ADHD, Epilepsy, Type 1 Diabetes';
  static const medHistoryNhs = 'NHS Number';
  static const medHistoryNhsHint = '000 000 0000';
  static const medHistoryBloodType = 'Blood Type';
  static const medHistoryBloodTypeHint = 'e.g. A+, O-, B+';
  static const medHistoryImmunisation = 'IMMUNISATION NOTES';
  static const medHistoryNotes = 'ADDITIONAL NOTES';
  static const medHistoryContacts = 'HEALTHCARE CONTACTS';
  static const medHistoryAddContact = 'Add contact';
  static const medHistoryEditContact = 'Edit contact';
  static const medHistoryDeleteContact = 'Delete contact?';
  static const medHistoryDeleteContactConfirm =
      'This healthcare contact will be permanently removed.';
  static const medHistoryContactType = 'CONTACT TYPE';
  static const medHistoryContactName = 'Name';
  static const medHistoryContactRole = 'Role / Specialty';
  static const medHistoryContactPhone = 'Phone';
  static const medHistoryContactEmail = 'Email';
  static const medHistoryContactAddress = 'Address / Practice';
  static const medHistoryNameRequired = 'Contact name is required';

  // Medication
  static const medicationTitle = 'Medication';
  static const medNoMeds = 'No medications prescribed yet';
  static const medNoMedsHint = 'Tap the + icon to add a prescribed medication';
  static const medScheduled = 'SCHEDULED MEDICATIONS';
  static const medPrn = 'PRN (AS REQUIRED)';
  static const medRecord = 'Record';
  static const medTodayCount = 'Given today';
  static const medOutcome = 'OUTCOME';
  static const medReasonLabel = 'REASON (REQUIRED)';
  static const medReasonOptional = 'REASON (OPTIONAL)';
  static const medReasonRequired =
      'Please enter a reason for this outcome';
  static const medAddPrescribed = 'Add medication';
  static const medEditPrescribed = 'Edit medication';
  static const medName = 'MEDICATION NAME';
  static const medNameHint = 'e.g. Paracetamol, Melatonin';
  static const medNameDoseRequired = 'Name and dose are required';
  static const medDose = 'DOSE';
  static const medDoseHint = 'e.g. 500mg, 10ml, 1 tablet';
  static const medRoute = 'ROUTE';
  static const medFrequency = 'FREQUENCY';
  static const medStartDate = 'START DATE';
  static const medInstructions = 'SPECIAL INSTRUCTIONS (OPTIONAL)';
  static const medInstructionsHint =
      'e.g. Take with food, Do not crush';
  static const medPrescribedBy = 'PRESCRIBED BY (OPTIONAL)';
  static const medPrescribedByHint = 'GP or prescriber name';

  // Care plans
  static const carePlansTitle = 'Care Plans';
  static const carePlanNew = 'New Care Plan';
  static const carePlanEdit = 'Edit Care Plan';
  static const carePlanNoPlans = 'No care plans yet';
  static const carePlanNoPlansHint = 'Tap + to create the first care plan';
  static const carePlanTitleLabel = 'PLAN TITLE';
  static const carePlanTitleHint = 'e.g. Q1 2026 Care Plan';
  static const carePlanTitleRequired = 'Plan title is required';
  static const carePlanStatusLabel = 'STATUS';
  static const carePlanReviewDate = 'REVIEW DATE';
  static const carePlanReviewDateHint = 'Select a review date';
  static const carePlanNotesLabel = 'NOTES (OPTIONAL)';
  static const carePlanGoals = 'GOALS';
  static const carePlanNoGoals = 'No goals added yet — tap + to add the first';
  static const carePlanBy = 'Written by';
  static const carePlanApprovedBy = 'Approved by';
  static const goalNew = 'Add Goal';
  static const goalEdit = 'Edit Goal';
  static const goalDeleteTitle = 'Delete goal?';
  static const goalDeleteConfirm = 'This goal will be permanently removed.';
  static const goalCategory = 'CATEGORY';
  static const goalTitle = 'GOAL';
  static const goalTitleHint = 'What is the goal?';
  static const goalTitleRequired = 'Goal title is required';
  static const goalStrategy = 'SUPPORT STRATEGY (OPTIONAL)';
  static const goalStrategyHint = 'How will staff support this goal?';
  static const goalStatus = 'STATUS';
  static const goalProgressNotes = 'PROGRESS NOTES (OPTIONAL)';

  // Bath temperature
  static const bathTempTitle = 'Bath Temperature';
  static const bathTempModule = 'Bath Temperature';
  static const bathTempModuleDesc = 'Record water temperature before bathing';
  static const bathTempRecord = 'Record temperature';
  static const bathTempNoRecords = 'No bath temperature recorded today';
  static const bathTempNoRecordsHint = 'Tap + to record a bath temperature';
  static const bathTempSafe = 'Safe (37–40°C)';
  static const bathTempCold = 'Too cold — check before bathing';
  static const bathTempHot = 'Too hot — risk of scalding';
  static const bathTempInvalid = 'Enter a temperature between 20°C and 55°C';
  static const bathTempDeleteTitle = 'Delete record?';
  static const bathTempDeleteConfirm =
      'This bath temperature record will be permanently removed.';
  static const notesOptional = 'Notes (optional)';
  static const recordOptions = 'Record options';

  // Visitor log
  static const visitorLogTitle = 'Visitor Log';
  static const visitorLogNew = 'Log Visitor';
  static const visitorLogEdit = 'Edit Visitor Record';
  static const visitorLogNewEntry = 'Log visitor';
  static const visitorLogNoEntries = 'No visitors recorded today';
  static const visitorLogNoEntriesHint = 'Tap + to log a visitor arrival';
  static const visitorLogDeleteTitle = 'Delete visitor record?';
  static const visitorLogDeleteConfirm =
      'This visitor record will be permanently removed.';
  static const visitorOnSite = 'ON SITE';
  static const visitorName = 'VISITOR NAME';
  static const visitorNameHint = 'Full name';
  static const visitorRelation = 'RELATION (OPTIONAL)';
  static const visitorPurpose = 'PURPOSE OF VISIT';
  static const visitorPurposeHint = 'e.g. Family contact, Health appointment';
  static const visitorAuthorisedBy = 'Authorised by';
  static const visitorAuthorisedByHint = 'Name of staff who authorised';
  static const visitorArrivalTime = 'ARRIVAL TIME';
  static const visitorArrived = 'Arrived';
  static const visitorDeparted = 'Departed';
  static const visitorRecordDeparture = 'Record departure';
  static const visitorRecordDepartureConfirm =
      'This will record the current time as the departure time.';
  static const visitorRequiredFields =
      'Please fill in name, purpose, and authorised by.';
  static const change = 'Change';

  // Common
  static const loading = 'Loading…';
  static const retry = 'Retry';
  static const save = 'Save';
  static const cancel = 'Cancel';
  static const delete = 'Delete';
  static const edit = 'Edit';
  static const confirm = 'Confirm';
  static const unknownError = 'Something went wrong. Please try again.';
  static const offlineBanner =
      'You are offline — changes will sync when reconnected';
}
