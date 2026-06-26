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
  static const signInInvalidCredentials =
      'Incorrect email or password. Please try again.';
  static const signInEmailNotConfirmed =
      'Please confirm your email address before signing in.';
  static const signInTooManyAttempts =
      'Too many attempts. Please wait a moment and try again.';
  static const signInNoConnection =
      'No internet connection. Check your network and try again.';
  static const signInFailed = 'Couldn’t sign you in. Please try again.';

  // MFA
  static const mfaTitle = 'Two-Factor Authentication';
  static const mfaEnrollTitle = 'Set Up Authenticator';
  static const mfaEnrollBody =
      'Your role requires two-factor authentication. '
      'Open Google Authenticator, Authy, or any TOTP app, '
      'tap Add Account, and enter the key below.';
  static const mfaSecretLabel = 'MANUAL ENTRY KEY';
  static const mfaEnrollConfirmPrompt =
      'Once added, enter the 6-digit code from the app to confirm.';
  static const mfaChallengeBody =
      'Enter the 6-digit code from your authenticator app.';
  static const mfaCodeLabel = 'VERIFICATION CODE';
  static const mfaCodeHint = '000000';
  static const mfaCodeRequired = 'Enter the 6-digit code';
  static const mfaCodeLength = 'Code must be 6 digits';
  static const mfaVerify = 'Verify';
  static const mfaVerifying = 'Verifying…';
  static const mfaCopied = 'Key copied to clipboard';
  static const mfaInvalidCode =
      'That code isn’t right. Open your authenticator app and enter the latest code.';
  static const mfaVerifyFailed = 'Couldn’t verify the code. Please try again.';

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

  // Add child form
  static const addChildTitle = 'Add Child';
  static const addChildNameLabel = 'FULL NAME';
  static const addChildNameHint = 'e.g. Jamie Thornton';
  static const addChildDobLabel = 'DATE OF BIRTH';
  static const addChildSelectDob = 'Select date of birth';
  static const addChildRoomLabel = 'ROOM';
  static const addChildRoomHint = 'e.g. 1A';
  static const addChildNotesLabel = 'NOTES';
  static const addChildNotesHint = 'Additional information (optional)';
  static const addChildNameRequired = 'Name is required';
  static const addChildDobRequired = 'Date of birth is required';
  static const addChildRoomRequired = 'Room is required';

  // Child profile — identity, safety flags, section headers
  static const careRecordSection = 'CARE RECORD';
  static const profileAgeLabel = 'Age';
  static const profileRoomLabel = 'Room';
  static const profileDobLabel = 'DOB';
  static const profileAllergyFlag = 'ALLERGIES — CHECK BEFORE FOOD OR MEDS';
  static const profileConditionsFlag = 'MEDICAL CONDITIONS';
  static const profileSectionDailyCare = 'DAILY CARE';
  static const profileSectionHealthSafety = 'HEALTH & SAFETY';
  static const profileSectionPlanning = 'PLANNING & PROGRESS';

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

  // Checklists hub
  static const checklistsHubVisitorDesc = 'Log visitor arrivals and departures';
  static const checklistsHubCleaningDesc = 'Communal areas and all bedrooms';

  // Cleaning screen
  static const checklistsTitle = 'Cleaning';
  static const checklistRoomSection = 'ROOM';
  static const checklistCommunalSection = 'COMMUNAL AREAS';
  static const checklistBedroom = 'Bedroom';
  static const cleaningBedrooms = 'BEDROOMS';

  // Smart Steps
  static const smartStepsTitle = 'Smart Steps';
  static const moduleSmartSteps = 'Smart Steps';
  static const moduleSmartStepsDesc =
      'Developmental goals and progress tracking';
  static const smartStepsAddStep = 'Add step';
  static const smartStepsNewStep = 'New Step';
  static const smartStepsEditStep = 'Edit Step';
  static const smartStepsNoSteps = 'No steps added yet';
  static const smartStepsNoStepsHint =
      'Tap + to add the first developmental step';
  static const smartStepsInProgress = 'IN PROGRESS';
  static const smartStepsNotStarted = 'NOT STARTED';
  static const smartStepsAchieved = 'ACHIEVED';
  static const smartStepsProgress = 'PROGRESS NOTES';
  static const smartStepsNoProgress = 'No progress logged yet';
  static const smartStepsLogProgress = 'Log progress';
  static const smartStepsNoteLabel = 'Progress note';
  static const smartStepsNoteHint = 'What happened? What did the child do?';
  static const smartStepsNoteRequired = 'Please enter a progress note';
  static const smartStepsAchievedNote = 'This will mark the step as Achieved';
  static const smartStepsCategory = 'CATEGORY';
  static const smartStepsStepTitle = 'STEP / GOAL';
  static const smartStepsStepTitleHint = 'e.g. Can pour a drink independently';
  static const smartStepsTitleRequired = 'Step title is required';
  static const smartStepsDescription = 'DESCRIPTION (OPTIONAL)';
  static const smartStepsDescriptionHint =
      'More detail about what this goal involves';
  static const smartStepsStatus = 'STATUS';
  static const smartStepsTargetDate = 'TARGET DATE (OPTIONAL)';
  static const smartStepsTargetDateHint = 'Select a target date';
  static const smartStepsTarget = 'Target';
  static const smartStepsAchievedOn = 'Achieved';

  // Activities, reward charts & achievements
  static const activitiesTitle = 'Activities & Achievements';
  static const activitiesLog = 'Log activity';
  static const activitiesNewEntry = 'Log Activity';
  static const activitiesEditEntry = 'Edit Activity';
  static const activitiesNoEntries = 'No activities recorded yet';
  static const activitiesNoEntriesHint = 'Tap + to log an activity';
  static const activitiesDeleteTitle = 'Delete activity?';
  static const activitiesDeleteConfirm =
      'This activity record will be permanently removed.';
  static const activitiesCategory = 'CATEGORY';
  static const activitiesTitle_ = 'ACTIVITY';
  static const activitiesTitleHint = 'e.g. Trip to the park, Baked a cake';
  static const activitiesTitleRequired = 'Activity title is required';
  static const activitiesDescription = 'DETAILS (OPTIONAL)';
  static const activitiesDescriptionHint = 'More detail about what happened';
  static const activitiesDuration = 'DURATION (OPTIONAL)';
  static const activitiesDurationUnit = 'mins';
  static const activitiesRewardEarned = 'Reward point earned';
  static const activitiesRewardSubtitle =
      'Did the child earn a reward chart point for this?';
  static const activitiesAchievement = 'ACHIEVEMENT HIGHLIGHT (OPTIONAL)';
  static const activitiesAchievementHint =
      'e.g. First time swimming independently, Cooked a full meal';

  // Food diary
  static const foodDiaryTitle = 'Food Diary';
  static const foodLogEntry = 'Log meal';
  static const foodNewEntry = 'Log Meal';
  static const foodEditEntry = 'Edit Meal Record';
  static const foodNoEntries = 'No meal records yet';
  static const foodNoEntriesHint = 'Tap + to log a meal';
  static const foodDeleteTitle = 'Delete meal record?';
  static const foodDeleteConfirm =
      'This meal record will be permanently removed.';
  static const foodMealType = 'MEAL';
  static const foodDescription = 'WHAT WAS EATEN';
  static const foodDescriptionHint =
      'e.g. Pasta with tomato sauce, two portions of garlic bread';
  static const foodDescriptionRequired = 'Please describe what was eaten';
  static const foodAppetite = 'APPETITE';
  static const foodConcerns = 'CONCERNS (OPTIONAL)';
  static const foodConcernsHint =
      'e.g. Refused vegetables, only ate half portion';

  // Sleep diary
  static const sleepDiaryTitle = 'Sleep Diary';
  static const sleepLogEntry = 'Log sleep';
  static const sleepNewEntry = 'Log Sleep';
  static const sleepEditEntry = 'Edit Sleep Record';
  static const sleepNoEntries = 'No sleep records yet';
  static const sleepNoEntriesHint = 'Tap + to log a sleep record';
  static const sleepDeleteTitle = 'Delete sleep record?';
  static const sleepDeleteConfirm =
      'This sleep record will be permanently removed.';
  static const sleepQuality = 'SLEEP QUALITY';
  static const sleepTimes = 'TIMES';
  static const sleepBedTime = 'Bed time';
  static const sleepSettledTime = 'Settled / fell asleep';
  static const sleepWakeTime = 'Wake time';
  static const sleepWakingsLabel = 'NUMBER OF WAKINGS';
  static const sleepWakingsSuffix = 'times';
  static const sleepWakings = 'wakings';
  static const sleepTonight = 'Today';
  static const sleepTap = 'Tap to set';

  // Behaviour monitoring
  static const behaviourTitle = 'Behaviour';
  static const behaviourLogIncident = 'Log incident';
  static const behaviourNewIncident = 'Log Behaviour Incident';
  static const behaviourEditIncident = 'Edit Incident';
  static const behaviourNoIncidents = 'No behaviour incidents recorded';
  static const behaviourNoIncidentsHint = 'Tap + to log a behaviour incident';
  static const behaviourDeleteTitle = 'Delete incident?';
  static const behaviourDeleteConfirm =
      'This behaviour incident record will be permanently removed.';
  static const behaviourSeverity = 'SEVERITY';
  static const behaviourAntecedent = 'Antecedent';
  static const behaviourAntecedentHint =
      'What happened before? Environment, triggers, activity';
  static const behaviourBehaviour = 'Behaviour';
  static const behaviourBehaviourHint = 'Describe exactly what the child did';
  static const behaviourConsequence = 'Consequence';
  static const behaviourConsequenceHint =
      'How did staff respond? What happened after?';
  static const behaviourDuration = 'DURATION';
  static const behaviourDurationHint = 'e.g. 5';
  static const behaviourDurationUnit = 'mins';
  static const behaviourLocation = 'LOCATION';
  static const behaviourLocationHint = 'e.g. Bedroom, Living room';
  static const behaviourAbcA = 'A';
  static const behaviourAbcB = 'B';
  static const behaviourAbcC = 'C';
  static const behaviourPhysicalIntervention = 'Physical intervention used';
  static const behaviourPhysicalInterventionSubtitle =
      'Flag if any physical intervention was required';
  static const behaviourInterventionDetails = 'Intervention details';
  static const behaviourInjury = 'Injury occurred';
  static const behaviourInjurySubtitle =
      'Flag if any injury was sustained by child or staff';
  static const behaviourInjuryDetails = 'Injury details';
  static const behaviourRequiredFields =
      'Antecedent, behaviour, and consequence are all required';

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
  static const medReasonRequired = 'Please enter a reason for this outcome';
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
  static const medInstructionsHint = 'e.g. Take with food, Do not crush';
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

  // Incidents
  static const incidentsTitle = 'Incident Reports';
  static const moduleIncidents = 'Incidents';
  static const moduleIncidentsDesc = 'Log and track incident reports';
  static const incidentLog = 'Log incident';
  static const incidentNew = 'Report Incident';
  static const incidentEdit = 'Edit Incident Report';
  static const incidentNoReports = 'No incidents recorded';
  static const incidentNoReportsHint = 'Tap + to log an incident report';
  static const incidentDeleteTitle = 'Delete incident report?';
  static const incidentDeleteConfirm =
      'This incident report will be permanently removed.';
  static const incidentTypeLabel = 'INCIDENT TYPE';
  static const incidentSeverityLabel = 'SEVERITY';
  static const incidentTitleLabel = 'INCIDENT TITLE';
  static const incidentTitleHint = 'Brief summary of what happened';
  static const incidentLocationLabel = 'LOCATION (OPTIONAL)';
  static const incidentLocationHint = 'e.g. Bedroom, Kitchen, Garden';
  static const incidentDescriptionLabel = 'WHAT HAPPENED';
  static const incidentDescriptionHint =
      'Full account of the incident — what was observed, who was present';
  static const incidentImmediateActionLabel = 'IMMEDIATE ACTION TAKEN';
  static const incidentImmediateActionHint = 'What did staff do in response?';
  static const incidentInjuryDetails = 'INJURY DETAILS (OPTIONAL)';
  static const incidentInjuryDetailsHint =
      'Describe any injuries sustained by child or staff';
  static const incidentNotifications = 'NOTIFICATIONS';
  static const incidentPoliceNotified = 'Police notified';
  static const incidentPoliceNotifiedSubtitle =
      'Has the police been informed of this incident?';
  static const incidentParentNotified = 'Parent / guardian notified';
  static const incidentParentNotifiedSubtitle =
      'Have the parent or guardian been informed?';
  static const incidentManagerNotified = 'Manager notified';
  static const incidentManagerNotifiedSubtitle =
      'Has the home manager been informed?';
  static const incidentFollowUpSection = 'FOLLOW-UP';
  static const incidentFollowUpRequired = 'Follow-up required';
  static const incidentFollowUpRequiredSubtitle =
      'Does this incident require further action?';
  static const incidentFollowUpDetails = 'Follow-up details';
  static const incidentFollowUpDetailsHint =
      'What actions are required and by whom?';
  static const incidentRequiredFields =
      'Title, description, and immediate action are required';
  static const incidentReportedBy = 'Reported by';

  // Team Leader Oversight
  static const oversightTitle = 'Shift Overview';
  static const oversightNeedsAttention = 'NEEDS ATTENTION';
  static const oversightFullyDocumented = 'FULLY DOCUMENTED';
  static const oversightAllComplete = 'All sections complete';
  static const oversightChildrenDocumented =
      'Children fully documented this shift';
  static const oversightViewSummary = 'Handover Summary';

  // Handover summary
  static const handoverSummaryTitle = 'Handover Summary';
  static const handoverSummaryGenerated = 'Generated at';
  static const handoverSectionNotes = 'Notes';
  static const handoverSectionBehaviour = 'Behaviour';
  static const handoverSectionIncidents = 'Incidents';
  static const handoverSectionMedication = 'Medication';
  static const handoverSectionBathTemp = 'Bath Temp';
  static const handoverNoNotes = 'No notes this shift';
  static const handoverNoBehaviour = 'None';
  static const handoverNoIncidents = 'None';
  static const handoverNoMeds = 'No scheduled medication';
  static const handoverBathNotRecorded = 'Not recorded';
  static const handoverFlagPhysical = 'Physical intervention';
  static const handoverFlagSafeguarding = 'Safeguarding';
  static const handoverFlagCritical = 'Critical incident';
  static const handoverFlagMedRefusal = 'Med refused';

  // Manager Dashboard
  static const dashboardTitle = 'Manager Dashboard';
  static const dashboardDocumented = 'documented';
  static const dashboardAlertSafeguarding = 'Safeguarding Alert';
  static const dashboardAlertCritical = 'Critical Incident';
  static const dashboardAlertIntervention = 'Physical Intervention';
  static const dashboardAlertMedRefusal = 'Medication Refusal';
  static const dashboardDocumentation = 'Documentation';
  static const dashboardAllDocumented = 'All children documented this shift';
  static const dashboardIncidents = 'Incidents Today';
  static const dashboardBehaviour = 'Behaviour Today';
  static const dashboardNone = 'None today';
  static const dashboardViewBehaviourPatterns = 'Behaviour Patterns';

  // Behaviour Pattern Tracking
  static const behaviourPatternsTitle = 'Behaviour Patterns';
  static const behaviourPatternsAllChildren = 'All children';
  static const behaviourPatternsDays7 = '7 days';
  static const behaviourPatternsDays14 = '14 days';
  static const behaviourPatternsDays30 = '30 days';
  static const behaviourPatternsNoData =
      'No behaviour incidents in this period';
  static const behaviourPatternsTotalLabel = 'Total';
  static const behaviourPatternsInterventionsLabel = 'Interventions';
  static const behaviourPatternsInjuriesLabel = 'Injuries';
  static const behaviourPatternsTrendTitle = 'Daily Trend';
  static const behaviourPatternsShiftTitle = 'By Shift';
  static const behaviourPatternsSeverityTitle = 'By Severity';
  static const behaviourPatternsChildTitle = 'By Child';
  static const behaviourPatternsTriggersTitle = 'Common Antecedents';

  // Incomplete documentation alerts
  static const alertIncompleteTitle = 'Documentation outstanding this shift';
  static const alertNotRecordedThisShift = 'Not yet recorded this shift';

  // Medication delete
  static const medDeleteTitle = 'Remove medication?';
  static const medDeleteConfirm =
      'This prescribed medication will be permanently removed from the MAR.';

  // Smart Steps delete
  static const smartStepsDeleteTitle = 'Delete step?';
  static const smartStepsDeleteConfirm =
      'This SMART step and all its progress records will be permanently removed.';

  // Settings
  static const settingsAppearance = 'APPEARANCE';
  static const settingsAccount = 'ACCOUNT';
  static const settingsThemeSystem = 'System default';
  static const settingsThemeLight = 'Light';
  static const settingsThemeDark = 'Dark';
  static const settingsSignOut = 'Sign out';
  static const settingsSignOutTitle = 'Sign out?';
  static const settingsSignOutBody =
      'You will be returned to the login screen.';

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

  // Inspector Portal (inspector role)
  static const inspectorPortalTitle = 'Inspector Portal';
  static const inspectorNoGrants = 'No active access grants';
  static const inspectorNoGrantsHint =
      'Ask a home manager to grant you access to begin a review.';
  static const inspectorExpiresInPrefix = 'Expires in';
  static const inspectorExpired = 'Expired';
  static const inspectorExpiresToday = 'Expires today';
  static const inspectorScopeLabel = 'Access scope';
  static const inspectorChildrenSection = 'Children';
  static const inspectorSectionsLabel = 'Sections';
  static const inspectorGoalsLabel = 'Goals';
  static const inspectorNoRecords = 'No records found for this section';
  static const inspectorRecordsLimitNote = 'Showing the most recent records';

  // Inspector feedback editor
  static const inspectorFeedbackTitle = 'Leave Feedback';
  static const inspectorFeedbackModuleLabel = 'Section';
  static const inspectorFeedbackChildLabel = 'Child (optional)';
  static const inspectorFeedbackChildNone = 'General — not child-specific';
  static const inspectorFeedbackSeverityLabel = 'Type';
  static const inspectorFeedbackContentLabel = 'Feedback';
  static const inspectorFeedbackContentHint =
      'Describe your observation or recommendation';
  static const inspectorFeedbackSubmit = 'Submit Feedback';
  static const inspectorFeedbackSubmitted = 'Feedback submitted';
  static const inspectorFeedbackEmpty = 'Please enter your feedback';

  // Manager — Inspector Access
  static const managerInspectorAccessTitle = 'Inspector Access';
  static const managerInspectorAccessTabGrants = 'Access';
  static const managerInspectorAccessTabFeedback = 'Feedback';
  static const managerInspectorAccessOpenTooltip = 'Inspector Access';
  static const managerNoGrants = 'No inspector access has been granted';
  static const managerGrantActive = 'Active';
  static const managerGrantExpired = 'Expired';
  static const managerGrantExpiresPrefix = 'Expires';
  static const managerRevokeGrant = 'Revoke access';
  static const managerRevokeGrantTitle = 'Revoke inspector access?';
  static const managerRevokeGrantConfirm =
      'This inspector will lose access to your home immediately.';
  static const managerNewGrant = 'Grant Access';
  static const managerGrantFormTitle = 'Grant Inspector Access';
  static const managerGrantFormSearchLabel = 'Inspector email';
  static const managerGrantFormSearchHint = 'Search by email';
  static const managerGrantFormNoResults = 'No inspector accounts found';
  static const managerGrantFormScopeLabel = 'Sections to grant access to';
  static const managerGrantFormExpiryLabel = 'Access expires';
  static const managerGrantFormSubmit = 'Grant Access';
  static const managerGrantCreated = 'Access granted';
  static const managerNoFeedback = 'No feedback from inspectors yet';
  static const managerFeedbackAcknowledge = 'Acknowledge';
  static const managerFeedbackResolve = 'Mark resolved';
  static const managerFeedbackResolutionLabel = 'Resolution notes (optional)';
  static const managerFeedbackUpdated = 'Feedback updated';
  static const managerFeedbackFrom = 'From';

  // AI shift summary (handover)
  static const handoverAiTooltip = 'Generate AI summary';
  static const handoverAiTitle = 'AI Shift Summary';
  static const handoverAiGenerating = 'Writing the handover brief…';
  static const handoverAiDisclaimer =
      'AI-generated from this shift\'s records — review before sharing.';
  static const handoverAiCopy = 'Copy summary';
  static const handoverAiCopied = 'Summary copied';
  static const handoverAiNoData = 'No records to summarise for this shift yet';

  // Parent Portal (parent/guardian role)
  static const parentPortalTitle = 'My Child';
  static const parentNoLinks = 'No children linked to your account yet';
  static const parentNoLinksHint =
      'Ask the home manager to link your child to your account.';
  static const parentFeedTitle = 'Updates';
  static const parentNoActivities = 'No updates to show yet';
  static const parentNoActivitiesHint =
      'Activities, rewards, and achievements will appear here as staff record them.';
  static const parentRewardBadge = 'Reward earned';
  static const parentAchievementLabel = 'Achievement';
  static const parentDurationSuffix = 'min';
  static const parentRecordsLimitNote = 'Showing the most recent updates';

  // Manager — Parent Access
  static const managerParentAccessTitle = 'Parent Access';
  static const managerParentAccessOpenTooltip = 'Parent Access';
  static const managerNoParentLinks = 'No parent accounts have been linked';
  static const managerParentLinkActive = 'Active';
  static const managerParentLinkRevoked = 'Revoked';
  static const managerParentLinkPhotosOn = 'Photos visible';
  static const managerParentLinkPhotosOff = 'Photos hidden';
  static const managerParentLinkedPrefix = 'Linked';
  static const managerRevokeParentLink = 'Revoke access';
  static const managerRevokeParentLinkTitle = 'Revoke parent access?';
  static const managerRevokeParentLinkConfirm =
      'This parent will immediately lose access to this child\'s updates.';
  static const managerNewParentLink = 'Link Parent';
  static const managerParentLinkFormTitle = 'Link Parent to Child';
  static const managerParentLinkFormSearchLabel = 'Parent email';
  static const managerParentLinkFormSearchHint = 'Search by email';
  static const managerParentLinkFormNoResults = 'No parent accounts found';
  static const managerParentLinkFormChildLabel = 'Child';
  static const managerParentLinkFormPhotosLabel = 'Allow photo access';
  static const managerParentLinkFormPhotosHint =
      'Show this child\'s photo to the parent in the portal';
  static const managerParentLinkFormSubmit = 'Link Parent';
  static const managerParentLinkCreated = 'Parent linked';

  // Manager — Staff Management (P1)
  static const managerStaffTitle = 'Staff';
  static const managerStaffOpenTooltip = 'Staff';
  static const managerNoStaff = 'No staff accounts yet';
  static const managerNoStaffHint =
      'Add your support workers, team leaders, and managers so they can sign in.';
  static const managerStaffActive = 'Active';
  static const managerStaffDisabled = 'Disabled';
  static const managerStaffDisable = 'Disable';
  static const managerStaffEnable = 'Enable';
  static const managerStaffDisableTitle = 'Disable this account?';
  static const managerStaffDisableConfirm =
      'They will be signed out and unable to log in until you re-enable the account.';
  static const managerStaffEnableTitle = 'Enable this account?';
  static const managerStaffEnableConfirm =
      'They will be able to sign in again.';
  static const managerStaffUpdated = 'Staff account updated';
  static const managerNewStaff = 'Add Staff';
  static const managerStaffFormTitle = 'Add Staff Member';
  static const managerStaffFormNameLabel = 'Full name';
  static const managerStaffFormNameHint = 'e.g. Jordan Smith';
  static const managerStaffFormEmailLabel = 'Email address';
  static const managerStaffFormEmailHint = 'name@example.com';
  static const managerStaffFormRoleLabel = 'Role';
  static const managerStaffFormPasswordLabel = 'Temporary password';
  static const managerStaffFormPasswordHint = 'At least 8 characters';
  static const managerStaffFormPasswordNote =
      'Share this with the staff member so they can sign in. They should change it after first login.';
  static const managerStaffFormSubmit = 'Create Account';
  static const managerStaffCreated = 'Staff account created';
  static const managerStaffNameRequired = 'Enter the staff member\'s name';
  static const managerStaffEmailRequired = 'Email is required';
  static const managerStaffEmailInvalid = 'Enter a valid email';
  static const managerStaffPasswordRequired = 'Temporary password is required';
  static const managerStaffPasswordTooShort = 'Use at least 8 characters';
}
