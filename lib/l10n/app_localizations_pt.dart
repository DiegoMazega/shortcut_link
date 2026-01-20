// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Shortcut Link';

  @override
  String get home_body_title => 'Encurtador';

  @override
  String get home_input_label => 'url';

  @override
  String get home_card_title => 'Url original';

  @override
  String get home_card_subtitle => 'Url encurtada';

  @override
  String get home_input_hint => 'Insira a url';

  @override
  String get home_send_url_error => 'Error ao encurtar está url';

  @override
  String get home_body_description =>
      'Insira a url no campo abaixo e click no botão no final da página para gerar um shortcut dele';
}
