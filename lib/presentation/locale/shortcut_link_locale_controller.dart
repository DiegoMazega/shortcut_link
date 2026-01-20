import 'package:flutter/material.dart';

class ShortcutLinkLocaleController extends ChangeNotifier {
  ShortcutLinkLocaleController._();

  static final ValueNotifier<Locale> locale = ValueNotifier(const Locale('pt'));

  static void change(Locale newLocale) {
    locale.value = newLocale;
  }
}
