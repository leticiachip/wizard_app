// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get login => 'Entrar';

  @override
  String get esqueciSenha => 'Esqueci minha senha';

  @override
  String get atencao => 'Atenção';

  @override
  String get confirmacaoEmail => 'Email de confirmação';

  @override
  String get continuar => 'Continuar';

  @override
  String get naoTrocouSenha => 'Não foi possível trocar a senha';

  @override
  String get codigo => 'Código';

  @override
  String get senha => 'Senha';

  @override
  String get confirmarSenha => 'Confirmacao de senha';

  @override
  String get senhaDeveSerIgual => 'A senha deve ser igual a digitada acima';

  @override
  String get trocarSenha => 'Trocar senha';

  @override
  String filtroNaoEncontrado(Object name) {
    return 'O dispositivo $name não foi encontrado';
  }

  @override
  String get falhaBuscarDispositivos => 'Não foi possivel buscar dispositivos';

  @override
  String get buscarDispositivos => 'Buscando dispositivos';

  @override
  String get ordemServico => 'Ordem de serviço';

  @override
  String get empresaDestinataria => 'Empresa distinatária';

  @override
  String get responsavel => 'Responsável';

  @override
  String get prazoFinal => 'Prazo final';
}
