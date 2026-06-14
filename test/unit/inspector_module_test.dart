import 'package:flutter_test/flutter_test.dart';
import 'package:tailored_notes/features/inspector/domain/inspector_module.dart';

void main() {
  group('InspectorModule.scopeKey — backend contract', () {
    // These strings are stored in inspector_grants.scope[] and checked by the
    // Supabase inspector_has_grant() RLS function. A typo here silently locks
    // an inspector out of that module. They must match supabase_schema.sql.
    test('exact scope keys', () {
      expect(InspectorModule.dailyNotes.scopeKey, 'daily_notes');
      expect(InspectorModule.carePlans.scopeKey, 'care_plans');
      expect(InspectorModule.incidents.scopeKey, 'incidents');
      expect(InspectorModule.behaviour.scopeKey, 'behaviour');
      expect(InspectorModule.medication.scopeKey, 'medication');
      expect(InspectorModule.medicalHistory.scopeKey, 'medical_history');
    });

    test('every module has a unique scope key', () {
      final keys = InspectorModule.values.map((m) => m.scopeKey).toList();
      expect(keys.toSet().length, keys.length);
    });
  });

  group('InspectorModule.fromScopeKey', () {
    test('round-trips every module', () {
      for (final module in InspectorModule.values) {
        expect(InspectorModule.fromScopeKey(module.scopeKey), module);
      }
    });

    test("'children' is NOT a module (it is the auto-appended grant scope)", () {
      expect(InspectorModule.fromScopeKey('children'), isNull);
    });

    test('unknown keys return null', () {
      expect(InspectorModule.fromScopeKey('sleep_diary'), isNull);
      expect(InspectorModule.fromScopeKey(''), isNull);
      expect(InspectorModule.fromScopeKey('garbage'), isNull);
    });
  });

  group('InspectorModule.displayName', () {
    test('every module has a non-empty label', () {
      for (final module in InspectorModule.values) {
        expect(module.displayName, isNotEmpty);
      }
    });
  });
}
