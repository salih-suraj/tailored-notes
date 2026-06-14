import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tailored_notes/core/network/connectivity_provider.dart';
import 'package:tailored_notes/shared/models/app_strings.dart';
import 'package:tailored_notes/shared/widgets/offline_banner.dart';

Widget _host({required bool online}) => ProviderScope(
  overrides: [isOnlineProvider.overrideWith((ref) => online)],
  child: const MaterialApp(home: Scaffold(body: OfflineBanner())),
);

void main() {
  testWidgets('shows the offline strip when offline', (tester) async {
    await tester.pumpWidget(_host(online: false));
    expect(find.text(AppStrings.offlineBanner), findsOneWidget);
    expect(find.byIcon(Icons.cloud_off_outlined), findsOneWidget);
  });

  testWidgets('renders nothing when online', (tester) async {
    await tester.pumpWidget(_host(online: true));
    expect(find.text(AppStrings.offlineBanner), findsNothing);
    expect(find.byIcon(Icons.cloud_off_outlined), findsNothing);
  });
}
