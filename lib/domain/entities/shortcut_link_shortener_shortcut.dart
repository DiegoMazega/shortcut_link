class ShortcutLinkShortcutLinks {
  ShortcutLinkShortcutLinks({required this.self, required this.short});

  factory ShortcutLinkShortcutLinks.fromJson(Map<String, dynamic> json) {
    return ShortcutLinkShortcutLinks(
      self: json['self'] as String,
      short: json['short'] as String,
    );
  }
  String self;
  String short;

  Map<String, dynamic> toJson() {
    return {'self': self, 'short': short};
  }
}
