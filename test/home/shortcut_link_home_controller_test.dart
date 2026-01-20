import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shortcut_link/domain/entities/shortcut_link_shortener_shortcut.dart';
import 'package:shortcut_link/domain/entities/shortcut_link_shortner_response.dart';
import 'package:shortcut_link/presentation/home/shortcut_link_home_controller.dart';
import 'package:shortcut_link/presentation/home/shortcut_link_home_providers.dart'
    show shortcutLinkHomeControllerProvider;
import 'package:shortcut_link/presentation/home/shortcut_link_home_state.dart';
import 'package:shortcut_link/providers/shortcut_link_repository_provider.dart';

import '../mocks/shortcut_link_mock_repository.dart';

void main() {
  late ProviderContainer container;
  late MockShortcutLinkRepository repository;

  setUp(() {
    repository = MockShortcutLinkRepository();

    container = ProviderContainer(
      overrides: [shortcutLinkRepositoryProvider.overrideWithValue(repository)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  ShortcutLinkHomeController controller() =>
      container.read(shortcutLinkHomeControllerProvider.notifier);

  ShortcutLinkHomeState state() =>
      container.read(shortcutLinkHomeControllerProvider);

  ShortcutLinkShortnerResponse mockResponseData() =>
      ShortcutLinkShortnerResponse(
        alias: 'abc',
        links: ShortcutLinkShortcutLinks(self: 'self', short: 'short'),
      );

  test('must start with the correct initial state', () {
    expect(state().isLoading, false);
    expect(state().errorMessage, isNull);
    expect(state().shortLinkList, isEmpty);
  });

  test('sendUrl should add URL and control loading', () async {
    final response = mockResponseData();

    when(
      () => repository.sendUrl(url: any(named: 'url')),
    ).thenAnswer((_) async => response);

    final result = await controller().sendUrl('https://google.com');

    expect(result, true);
    expect(state().isLoading, false);
    expect(state().shortLinkList.length, 1);
    expect(state().shortLinkList.first, response);
  });

  test('sendUrl should return false in case of error', () async {
    when(
      () => repository.sendUrl(url: any(named: 'url')),
    ).thenThrow(Exception('erro'));

    final result = await controller().sendUrl('https://google.com');

    expect(result, false);
    expect(state().isLoading, false);
    expect(state().shortLinkList, isEmpty);
  });

  test('setErrorMessage should update error message', () {
    controller().setErrorMessage('Any Error');

    expect(state().errorMessage, 'Any Error');
  });

  test('addUrl deve adicionar item na lista', () {
    final data = mockResponseData();

    controller().addUrl(data);

    expect(state().shortLinkList.length, 1);
    expect(state().shortLinkList.first, data);
  });

  test('removeUrl should remove item from list', () {
    final data = mockResponseData();

    controller().addUrl(data);
    controller().removeUrl(data);

    expect(state().shortLinkList, isEmpty);
  });
}
