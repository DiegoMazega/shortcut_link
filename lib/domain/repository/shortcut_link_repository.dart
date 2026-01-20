import '../entities/shortcut_link_shortner_response.dart';

abstract class ShortcutLinkRepository {
  Future<ShortcutLinkShortnerResponse> sendUrl({required String url});
}
