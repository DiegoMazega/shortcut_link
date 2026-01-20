import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shortcut_link/domain/repository/shortcut_link_repository_impl.dart';
import '../domain/repository/shortcut_link_repository.dart';

final shortcutLinkRepositoryProvider = Provider<ShortcutLinkRepository>(
  (ref) => ShortcutLinkRepositoryImpl(),
);
