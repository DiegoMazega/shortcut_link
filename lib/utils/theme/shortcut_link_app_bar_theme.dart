import 'package:flutter/material.dart';
import 'package:shortcut_link/utils/theme/shortcut_link_theme_colors.dart';
import 'package:shortcut_link/utils/theme/shortcut_link_theme_text_styles.dart';

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: primaryPurple(),
    foregroundColor: onPrimary(),
    elevation: 0,
    centerTitle: true,
    titleTextStyle: appBarTitleStyle(),
    iconTheme: IconThemeData(color: onPrimary()),
  );
}
