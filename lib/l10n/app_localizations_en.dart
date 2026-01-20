// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Shortcut Link';

  @override
  String get home_body_title => 'Shortcut';

  @override
  String get home_input_label => 'url';

  @override
  String get home_card_title => 'Original URL';

  @override
  String get home_card_subtitle => 'Shortened URL';

  @override
  String get home_input_hint => 'Insert url';

  @override
  String get home_send_url_error => 'Error shortening this URL';

  @override
  String get home_send_empty_url_error => 'Please enter a URL';

  @override
  String get home_body_description =>
      'Enter the url in the field below and click the button at the bottom of the page to generate a shortcut.';
}
