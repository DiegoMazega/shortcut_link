import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shortcut_link/domain/repository/shortcut_link_repository_impl.dart';
import 'package:shortcut_link/presentation/home/shortcut_link_home_controller.dart';
import 'package:shortcut_link/presentation/home/shortcut_link_home_state.dart';
import '../../domain/repository/shortcut_link_repository.dart';

final shortcutLinkRepositoryProvider = Provider<ShortcutLinkRepository>(
  (ref) => ShortcutLinkRepositoryImpl(),
);

final shortcutLinkHomeControllerProvider =
    NotifierProvider<ShortcutLinkHomeController, ShortcutLinkHomeState>(
      ShortcutLinkHomeController.new,
    );
