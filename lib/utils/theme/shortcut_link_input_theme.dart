import 'package:flutter/material.dart';
import 'package:shortcut_link/utils/theme/shortcut_link_theme_colors.dart';
import 'package:shortcut_link/utils/theme/shortcut_link_theme_text_styles.dart';

InputDecorationTheme inputTheme() {
  return InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,

    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

    hintStyle: inputHintStyle(),
    labelStyle: inputHintStyle(),
    errorStyle: inputErrorStyle(),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: borderColor()),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: primaryPurple(), width: 2),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: errorColor()),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: errorColor(), width: 2),
    ),
  );
}
