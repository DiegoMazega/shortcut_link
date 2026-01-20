import 'package:flutter/material.dart';
import 'package:shortcut_link/domain/entities/shortcut_link_shortner_response.dart';
import 'package:shortcut_link/utils/extensions/shortcut_link_context_extensions.dart';

class ShortcutLinkCard extends StatelessWidget {
  const ShortcutLinkCard({
    required this.data,
    required this.onRemove,
    super.key,
  });
  final ShortcutLinkShortnerResponse data;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    Text title(String title) =>
        Text(title, style: Theme.of(context).textTheme.titleLarge);

    Text subtitle(String subtitle) =>
        Text(subtitle, style: Theme.of(context).textTheme.titleMedium);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 8,
              children: [
                title(context.translate.home_card_title),
                InkWell(
                  onTap: onRemove,
                  child: const Icon(Icons.close_outlined),
                ),
              ],
            ),
            subtitle(data.links.self),
            const SizedBox(height: 12),
            title(context.translate.home_card_subtitle),
            subtitle(data.links.short),
          ],
        ),
      ),
    );
  }
}
