import 'package:flutter_test/flutter_test.dart';
import 'package:tailored_notes/shared/models/shift_completion.dart';
import 'package:tailored_notes/shared/models/shift_type.dart';

ShiftCompletion _completion(List<bool> done) => ShiftCompletion(
      childId: 'c1',
      shift: ShiftType.morning,
      sections: [
        for (var i = 0; i < done.length; i++)
          ShiftSection('s$i', complete: done[i]),
      ],
    );

void main() {
  group('ShiftCompletion.status', () {
    test('nothing complete is none', () {
      expect(_completion([false, false, false]).status, CompletionStatus.none);
    });

    test('some complete is partial', () {
      expect(_completion([true, false, false]).status, CompletionStatus.partial);
      expect(_completion([true, true, false]).status, CompletionStatus.partial);
    });

    test('all complete is complete', () {
      expect(_completion([true, true, true]).status, CompletionStatus.complete);
    });

    test('no sections at all is none, not complete', () {
      // Guards against a "0 of 0 = done" false positive on the dashboard.
      expect(_completion([]).status, CompletionStatus.none);
    });
  });

  group('ShiftCompletion counts and progress', () {
    test('counts completed vs total', () {
      final c = _completion([true, false, true, false]);
      expect(c.completedCount, 2);
      expect(c.totalCount, 4);
      expect(c.progress, 0.5);
    });

    test('progress is 1.0 when all complete', () {
      expect(_completion([true, true]).progress, 1.0);
    });

    test('progress is 0.0 with no sections (no divide-by-zero)', () {
      expect(_completion([]).progress, 0.0);
    });
  });
}
