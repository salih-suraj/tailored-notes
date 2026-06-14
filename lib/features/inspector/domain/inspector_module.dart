import 'package:flutter/material.dart';

/// The record sections that can be granted to an inspector and shown in the
/// read-only Inspector Portal. [scopeKey] is the string stored in
/// `inspector_grants.scope[]` and checked by the Supabase
/// `inspector_has_grant()` function — keep it in sync with the backend.
enum InspectorModule {
  dailyNotes,
  carePlans,
  incidents,
  behaviour,
  medication,
  medicalHistory;

  String get scopeKey => switch (this) {
    InspectorModule.dailyNotes => 'daily_notes',
    InspectorModule.carePlans => 'care_plans',
    InspectorModule.incidents => 'incidents',
    InspectorModule.behaviour => 'behaviour',
    InspectorModule.medication => 'medication',
    InspectorModule.medicalHistory => 'medical_history',
  };

  String get displayName => switch (this) {
    InspectorModule.dailyNotes => 'Daily Notes',
    InspectorModule.carePlans => 'Care Plans',
    InspectorModule.incidents => 'Incidents',
    InspectorModule.behaviour => 'Behaviour',
    InspectorModule.medication => 'Medication',
    InspectorModule.medicalHistory => 'Medical History',
  };

  IconData get icon => switch (this) {
    InspectorModule.dailyNotes => Icons.edit_note,
    InspectorModule.carePlans => Icons.flag_outlined,
    InspectorModule.incidents => Icons.report_outlined,
    InspectorModule.behaviour => Icons.psychology_outlined,
    InspectorModule.medication => Icons.medication_outlined,
    InspectorModule.medicalHistory => Icons.medical_information_outlined,
  };

  static InspectorModule? fromScopeKey(String key) {
    for (final module in InspectorModule.values) {
      if (module.scopeKey == key) return module;
    }
    return null;
  }
}
