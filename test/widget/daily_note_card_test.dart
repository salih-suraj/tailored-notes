import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tailored_notes/core/time/uk_time.dart';
import 'package:tailored_notes/features/daily_notes/domain/daily_note.dart';
import 'package:tailored_notes/features/daily_notes/presentation/widgets/daily_note_card.dart';

DailyNote _note({bool synced = true}) => DailyNote(
  id: 'n1',
  homeId: 'h1',
  childId: 'c1',
  authorId: 'a1',
  authorName: 'Jane Worker',
  shift: ShiftType.morning,
  content: 'Had a good breakfast and a calm morning.',
  occurredAt: DateTime.utc(2026, 1, 15, 8, 30),
  createdAt: DateTime.utc(2026, 1, 15, 8, 31),
  updatedAt: DateTime.utc(2026, 1, 15, 8, 31),
  isSynced: synced,
);

Widget _host(DailyNote note, {VoidCallback? onEdit}) => MaterialApp(
  home: Scaffold(
    body: DailyNoteCard(note: note, onEdit: onEdit),
  ),
);

void main() {
  setUpAll(() async {
    UkTime.init();
    await initializeDateFormatting('en_GB', null);
  });

  testWidgets('renders content, author, and the shift badge', (tester) async {
    await tester.pumpWidget(_host(_note()));
    expect(
      find.text('Had a good breakfast and a calm morning.'),
      findsOneWidget,
    );
    expect(find.text('Jane Worker'), findsOneWidget);
    expect(find.text('Morning'), findsOneWidget); // shift badge
  });

  testWidgets('tapping the card invokes onEdit', (tester) async {
    var edited = false;
    await tester.pumpWidget(_host(_note(), onEdit: () => edited = true));
    await tester.tap(find.text('Had a good breakfast and a calm morning.'));
    expect(edited, isTrue);
  });

  testWidgets('shows the not-synced indicator only when unsynced', (
    tester,
  ) async {
    await tester.pumpWidget(_host(_note(synced: false)));
    expect(find.byIcon(Icons.cloud_off_outlined), findsOneWidget);

    await tester.pumpWidget(_host(_note(synced: true)));
    expect(find.byIcon(Icons.cloud_off_outlined), findsNothing);
  });
}
