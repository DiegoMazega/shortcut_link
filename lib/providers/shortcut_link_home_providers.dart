import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shortcut_link/presentation/home/shortcut_link_home_controller.dart';
import 'package:shortcut_link/presentation/home/shortcut_link_home_state.dart';


final shortcutLinkHomeControllerProvider =
    NotifierProvider<ShortcutLinkHomeController, ShortcutLinkHomeState>(
      ShortcutLinkHomeController.new,
    );
