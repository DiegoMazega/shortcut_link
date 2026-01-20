import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shortcut_link/components/card/shortcut_link_card.dart';
import 'package:shortcut_link/domain/entities/shortcut_link_shortener_shortcut.dart';
import 'package:shortcut_link/domain/entities/shortcut_link_shortner_response.dart';
import 'package:shortcut_link/l10n/app_localizations.dart';
import 'package:shortcut_link/presentation/home/shortcut_link_home.dart';
import 'package:shortcut_link/providers/shortcut_link_repository_provider.dart';
import 'package:shortcut_link/utils/extensions/shortcut_link_context_extensions.dart';

import '../../mocks/shortcut_link_mock_repository.dart';

final mockResponse = ShortcutLinkShortnerResponse(
  alias: 'abc123',
  links: ShortcutLinkShortcutLinks(
    self: 'https://google.com',
    short: 'https://abc.com',
  ),
);

void main() {
  late MockShortcutLinkRepository repository;

  setUp(() {
    repository = MockShortcutLinkRepository();
  });

  Widget createWidget() {
    return ProviderScope(
      overrides: [shortcutLinkRepositoryProvider.overrideWithValue(repository)],
      child: const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ShortcutLinkHome(),
      ),
    );
  }

  testWidgets('renders input and button', (tester) async {
    await tester.pumpWidget(createWidget());

    expect(find.byKey(const Key('url_input')), findsOneWidget);
    expect(find.byKey(const Key('add_button')), findsOneWidget);
  });

  testWidgets('Shows an error when trying to send an empty URL.', (
    tester,
  ) async {
    await tester.pumpWidget(createWidget());

    final context = tester.element(find.byType(ShortcutLinkHome));

    await tester.tap(find.byKey(const Key('add_button')));
    await tester.pump();

    final errorText = context.translate.home_send_empty_url_error;

    expect(find.textContaining(errorText), findsOneWidget);
  });

  testWidgets('Add card when sending valid URL.', (tester) async {
    when(
      () => repository.sendUrl(url: 'https://google.com'),
    ).thenAnswer((_) async => mockResponse);

    await tester.pumpWidget(createWidget());

    await tester.enterText(
      find.byKey(const Key('url_input')),
      'https://google.com',
    );

    await tester.tap(find.byKey(const Key('add_button')));

    await tester.pumpAndSettle();

    expect(find.byType(ShortcutLinkCard), findsOneWidget);
  });

  testWidgets('Remove card by clicking remove.', (tester) async {
    when(
      () => repository.sendUrl(url: any(named: 'url')),
    ).thenAnswer((_) async => mockResponse);

    await tester.pumpWidget(createWidget());

    await tester.enterText(
      find.byKey(const Key('url_input')),
      'https://google.com',
    );

    await tester.tap(find.byKey(const Key('add_button')));
    await tester.pumpAndSettle();

    expect(find.byType(ShortcutLinkCard), findsOneWidget);

    final card = tester.widget<ShortcutLinkCard>(find.byType(ShortcutLinkCard));

    card.onRemove();
    await tester.pump();

    expect(find.byType(ShortcutLinkCard), findsNothing);
  });
}
