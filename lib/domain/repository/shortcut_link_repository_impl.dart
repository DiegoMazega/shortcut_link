import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shortcut_link/domain/entities/shortcut_link_shortner_response.dart';
import 'package:shortcut_link/domain/repository/shortcut_link_repository.dart';
import 'package:shortcut_link/utils/constants/shortcut_links_urls.dart';

class ShortcutLinkRepositoryImpl implements ShortcutLinkRepository {
  ShortcutLinkRepositoryImpl({http.Client? client})
    : client = client ?? http.Client();
  final http.Client client;

  @override
  Future<ShortcutLinkShortnerResponse> sendUrl({required String url}) async {
    final uri = Uri.parse(baseEndpoint);

    final response = await client.post(
      uri,
      body: jsonEncode({'url': url}),
      headers: const {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Error sending url: ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return ShortcutLinkShortnerResponse.fromJson(json);
  }
}
