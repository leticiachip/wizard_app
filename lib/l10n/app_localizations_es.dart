// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get login => 'Entrar';

  @override
  String get esqueciSenha => 'Olvidé mi contraseña';

  @override
  String get atencao => 'Atención';

  @override
  String get confirmacaoEmail => 'Confirmación de correo electrónico';

  @override
  String get continuar => 'Continuar';

  @override
  String get naoTrocouSenha => 'No se pudo cambiar la contraseña.';

  @override
  String get codigo => 'Código';

  @override
  String get senha => 'Contraseña';

  @override
  String get confirmarSenha => 'Confirmación de contraseña';

  @override
  String get senhaDeveSerIgual =>
      'La contraseña debe ser igual a la introducida anteriormente.';

  @override
  String get trocarSenha => 'Cambiar contraseña';

  @override
  String filtroNaoEncontrado(Object name) {
    return 'No se ha encontrado el dispositivo $name.';
  }

  @override
  String get falhaBuscarDispositivos => 'No se pudieron buscar dispositivos.';

  @override
  String get buscarDispositivos => 'Buscando dispositivos';

  @override
  String get ordemServico => 'Orden de servicio';

  @override
  String get empresaDestinataria => 'Empresa distinguida';

  @override
  String get responsavel => 'responsable';

  @override
  String get prazoFinal => 'Fecha límite';
}
