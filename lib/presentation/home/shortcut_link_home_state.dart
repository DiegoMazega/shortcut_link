import 'package:shortcut_link/domain/entities/shortcut_link_shortner_response.dart';

class ShortcutLinkHomeState {
  const ShortcutLinkHomeState({
    this.isLoading = false,
    this.errorMessage,
    this.shortLinkList = const [],
  });
  final bool isLoading;
  final String? errorMessage;
  final List<ShortcutLinkShortnerResponse> shortLinkList;

  ShortcutLinkHomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<ShortcutLinkShortnerResponse>? shortLinkList,
  }) {
    return ShortcutLinkHomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      shortLinkList: shortLinkList ?? this.shortLinkList,
    );
  }
}
