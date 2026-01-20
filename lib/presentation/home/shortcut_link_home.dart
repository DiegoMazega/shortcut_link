import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shortcut_link/components/button/shortcut_link_float_action_button_add.dart';
import 'package:shortcut_link/components/card/shortcut_link_card.dart';
import 'package:shortcut_link/providers/shortcut_link_home_providers.dart';

import '../../components/app_bar/shortcut_link_app_bar.dart';
import '../../utils/extensions/shortcut_link_context_extensions.dart';

class ShortcutLinkHome extends HookConsumerWidget {
  const ShortcutLinkHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shortcutLinkHomeControllerProvider);

    final controller = ref.read(shortcutLinkHomeControllerProvider.notifier);

    final textController = useTextEditingController();

    return Scaffold(
      appBar: ShortcutLinkAppBar(title: context.translate.home_body_title),

      floatingActionButton: ShortcutLinkFloatActionButtonAdd(
        key: const Key('add_button'),
        isLoading: state.isLoading,
        onPressed: () async {
          if (textController.text.isEmpty) {
            controller.setErrorMessage(
              context.translate.home_send_empty_url_error,
            );
            return;
          }

          final success = await controller.sendUrl(textController.text);

          if (!context.mounted) {
            return;
          }

          if (!success) {
            controller.setErrorMessage(context.translate.home_send_url_error);
            return;
          }

          textController.clear();
        },
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(context.translate.home_body_description),
          const SizedBox(height: 20),
          TextFormField(
            key: const Key('url_input'),
            controller: textController,
            onChanged: (_) => controller.setErrorMessage(null),
            enabled: !state.isLoading,
            decoration: InputDecoration(
              labelText: context.translate.home_input_label,
              hintText: context.translate.home_input_hint,
              errorText: state.errorMessage,
            ),
          ),
          const SizedBox(height: 40),
          ...state.shortLinkList.map(
            (e) => Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: ShortcutLinkCard(
                data: e,
                onRemove: () => controller.removeUrl(e),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
