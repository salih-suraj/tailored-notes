import 'package:flutter_test/flutter_test.dart';
import 'package:tailored_notes/features/children/domain/child.dart';

Child _child({required String name, required String dob}) => Child(
      id: 'c1',
      homeId: 'home-1',
      name: name,
      dateOfBirth: dob,
      room: 'Room 1',
      createdAt: DateTime.utc(2026, 1, 1),
      updatedAt: DateTime.utc(2026, 1, 1),
    );

void main() {
  group('Child.initials', () {
    test('first + last initial for a two-part name', () {
      expect(_child(name: 'John Smith', dob: '2015-01-01').initials, 'JS');
    });

    test('first + last for a three-part name (ignores middle)', () {
      expect(
        _child(name: 'Mary Jane Watson', dob: '2015-01-01').initials,
        'MW',
      );
    });

    test('first two letters for a single name', () {
      expect(_child(name: 'Madonna', dob: '2015-01-01').initials, 'MA');
    });

    test('upper-cases and trims surrounding whitespace', () {
      expect(_child(name: '  john smith  ', dob: '2015-01-01').initials, 'JS');
    });
  });

  group('Child.ageYears', () {
    test('a birthday today gives the exact age', () {
      final now = DateTime.now();
      final dob = '${now.year - 10}-${now.month.toString().padLeft(2, '0')}'
          '-${now.day.toString().padLeft(2, '0')}';
      expect(_child(name: 'A B', dob: dob).ageYears, 10);
    });

    test('an upcoming birthday this year is not yet counted', () {
      // Born 10 years ago but the birthday is ~2 days away → still 9.
      final future = DateTime.now().add(const Duration(days: 2));
      final dob = '${future.year - 10}-${future.month.toString().padLeft(2, '0')}'
          '-${future.day.toString().padLeft(2, '0')}';
      expect(_child(name: 'A B', dob: dob).ageYears, 9);
    });

    test('malformed date of birth returns 0 rather than throwing', () {
      expect(_child(name: 'A B', dob: 'not-a-date').ageYears, 0);
    });
  });

  group('Child JSON', () {
    test('survives a toJson/fromJson round-trip', () {
      final child = _child(name: 'John Smith', dob: '2015-06-14');
      expect(Child.fromJson(child.toJson()), child);
    });
  });
}
