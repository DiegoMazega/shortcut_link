import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shortcut_link/domain/entities/shortcut_link_shortner_response.dart';
import 'package:shortcut_link/domain/repository/shortcut_link_repository.dart';
import 'package:shortcut_link/presentation/home/shortcut_link_home_state.dart';
import 'package:shortcut_link/providers/shortcut_link_repository_provider.dart';

class ShortcutLinkHomeController extends Notifier<ShortcutLinkHomeState> {
  late final ShortcutLinkRepository repository;

  @override
  ShortcutLinkHomeState build() {
    repository = ref.read(shortcutLinkRepositoryProvider);

    return const ShortcutLinkHomeState();
  }

  Future<bool> sendUrl(String url) async {
    state = state.copyWith(isLoading: true);

    try {
      final response = await repository.sendUrl(url: url);
      state = state.copyWith(shortLinkList: [...state.shortLinkList, response]);
      return true;
    } catch (e) {
      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void setErrorMessage(String errorMessage) {
    state = state.copyWith(errorMessage: errorMessage);
  }

  void removeUrl(ShortcutLinkShortnerResponse data) {
    final shallowCopy = [...state.shortLinkList];
    shallowCopy.remove(data);
    state = state.copyWith(shortLinkList: shallowCopy);
  }
}
