// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'Login';

  @override
  String get esqueciSenha => 'I forgot my password';

  @override
  String get atencao => 'Attention';

  @override
  String get confirmacaoEmail => 'Email confirmation';

  @override
  String get continuar => 'Continue';

  @override
  String get naoTrocouSenha => 'Unable to change password';

  @override
  String get codigo => 'Code';

  @override
  String get senha => 'Password';

  @override
  String get confirmarSenha => 'Password confirmation';

  @override
  String get senhaDeveSerIgual =>
      'The password must be the same as the one entered above.';

  @override
  String get trocarSenha => 'Change password';

  @override
  String filtroNaoEncontrado(Object name) {
    return 'The device $name was not found.';
  }

  @override
  String get falhaBuscarDispositivos =>
      'It was not possible to retrieve devices';

  @override
  String get buscarDispositivos => 'Searching for devices';
}
