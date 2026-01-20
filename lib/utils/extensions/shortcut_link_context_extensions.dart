import 'package:flutter/material.dart';
import 'package:shortcut_link/l10n/app_localizations.dart';

extension GetTranslate on BuildContext {
  AppLocalizations get translate {
    final t = AppLocalizations.of(this);

    assert(
      t != null,
      'AppLocalizations not found in context. '
      'Look MaterialApp AppLocalizations.delegate',
    );

    return t!;
  }
}
