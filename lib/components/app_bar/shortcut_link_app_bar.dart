import 'package:flutter/material.dart';

class ShortcutLinkAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ShortcutLinkAppBar({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title), centerTitle: true);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
