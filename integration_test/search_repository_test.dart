import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:integration_test/integration_test.dart';
import 'package:search_github_repository_app/i18n/strings.g.dart';
import 'package:search_github_repository_app/presentation/search_repository/search_repository_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'search',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: TranslationProvider(
            child: const MaterialApp(
              home: SearchRepositoryPage(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byType(TextFormField),
        'Haru-Kobayashi073',
      );

      await tester.testTextInput.receiveAction(TextInputAction.done);

      await tester.pumpAndSettle();

      expect(
        find.text('Haru-Kobayashi073/Haru-Kobayashi073'),
        findsOneWidget,
      );

      await tester.tap(find.text('Haru-Kobayashi073/Haru-Kobayashi073'));

      await tester.pumpAndSettle();

      expect(find.text('No language'), findsOneWidget);
    },
  );
}
