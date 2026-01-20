import 'package:shortcut_link/domain/entities/shortcut_link_shortener_shortcut.dart';

class ShortcutLinkShortnerResponse {
  ShortcutLinkShortnerResponse({required this.alias, required this.links});

  factory ShortcutLinkShortnerResponse.fromJson(Map<String, dynamic> json) {
    return ShortcutLinkShortnerResponse(
      alias: json['alias'] as String,
      links: ShortcutLinkShortcutLinks.fromJson(json['_links']),
    );
  }

  String alias;
  ShortcutLinkShortcutLinks links;

  Map<String, dynamic> toJson() {
    return {'alias': alias, '_links': links.toJson()};
  }
}
