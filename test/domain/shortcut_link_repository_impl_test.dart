import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:shortcut_link/domain/entities/shortcut_link_shortner_response.dart';
import 'package:shortcut_link/domain/repository/shortcut_link_repository_impl.dart';
import 'package:shortcut_link/utils/constants/shortcut_links_urls.dart';

import '../mocks/http_mock_client.dart';

void main() {
  late MockHttpClient client;
  late ShortcutLinkRepositoryImpl repository;

  setUp(() {
    client = MockHttpClient();
    repository = ShortcutLinkRepositoryImpl(client: client);
  });

  final responseMockBody = {
    'alias': 'abc123',
    '_links': {
      'self': 'https://google.com',
      'short': 'abc123',
    },
  };

  test(
    'sendUrl should return ShortcutLinkShortnerResponse when status is 200',
    () async {
      when(
        () => client.post(
          Uri.parse(baseEndpoint),
          body: any(named: 'body'),
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode(responseMockBody), 200),
      );

      final result = await repository.sendUrl(url: 'https://google.com');

      expect(result, isA<ShortcutLinkShortnerResponse>());
      expect(result.alias, 'abc123');
      expect(result.links.self, 'https://google.com');
    },
  );

  test(
   'sendUrl should throw an exception when status is not 2xx',
    () async {
      when(
        () => client.post(
          Uri.parse(baseEndpoint),
          body: any(named: 'body'),
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Bad Request', 400),
      );

      await expectLater(
        repository.sendUrl(url: 'https://google.com'),
        throwsException,
      );
    },
  );

  test(
    'sendUrl must send the correct body and headers',
    () async {
      when(
        () => client.post(
          Uri.parse(baseEndpoint),
          body: any(named: 'body'),
          headers: any(named: 'headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(jsonEncode(responseMockBody), 200),
      );

      await repository.sendUrl(url: 'https://google.com');

      verify(
        () => client.post(
          Uri.parse(baseEndpoint),
          body: jsonEncode({'url': 'https://google.com'}),
          headers: const {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      ).called(1);
    },
  );
}
