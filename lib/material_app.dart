import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shortcut_link/l10n/app_localizations.dart';
import 'package:shortcut_link/presentation/home/shortcut_link_home.dart';
import 'package:shortcut_link/utils/extensions/shortcut_link_context_extensions.dart';
import 'package:shortcut_link/presentation/locale/shortcut_link_locale_controller.dart';
import 'package:shortcut_link/utils/theme/shortcut_link_theme.dart';

class ShortcutLinkMaterialApp extends StatelessWidget {
  const ShortcutLinkMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: ShortcutLinkLocaleController.locale,
      builder: (context, locale, _) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          behavior: HitTestBehavior.opaque,
          child: MaterialApp(
            locale: locale,
            theme: theme(),
            debugShowCheckedModeBanner: false,
            supportedLocales: const [Locale('en'), Locale('pt')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            onGenerateTitle: (context) => context.translate.appTitle,
            home: const ShortcutLinkHome(),
          ),
        );
      },
    );
  }
}
