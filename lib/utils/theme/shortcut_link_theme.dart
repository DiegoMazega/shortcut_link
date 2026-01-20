import 'package:flutter/material.dart';
import 'package:shortcut_link/utils/theme/shortcut_link_app_bar_theme.dart';
import 'package:shortcut_link/utils/theme/shortcut_link_input_theme.dart';
import 'package:shortcut_link/utils/theme/shortcut_link_theme_colors.dart';
import 'package:shortcut_link/utils/theme/shortcut_link_theme_text_styles.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColor(),
    appBarTheme: appBarTheme(),
    inputDecorationTheme: inputTheme(),
    textTheme: const TextTheme().copyWith(
      titleLarge: titleTextStyle(),
      titleMedium: subtitleTextStyle(),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryPurple(),
      primary: primaryPurple(),
      error: errorColor(),
    ),
  );
}
