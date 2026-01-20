import 'package:flutter/material.dart';
import 'package:shortcut_link/utils/theme/shortcut_link_theme_colors.dart';

TextStyle appBarTitleStyle() =>
    TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: onPrimary());

TextStyle inputTextStyle() => TextStyle(fontSize: 16, color: textPrimary());

TextStyle inputHintStyle() => TextStyle(fontSize: 16, color: textSecondary());

TextStyle inputErrorStyle() => TextStyle(fontSize: 12, color: errorColor());

TextStyle titleTextStyle() =>
    TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: textPrimary());

TextStyle subtitleTextStyle() => TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: textSecondary(),
);
