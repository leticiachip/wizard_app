import 'package:flutter/foundation.dart';
import 'package:wizard_app/core/utils/result.dart';
import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/utils/command.dart';
import '../../../data/services/configuracoes_iniciais/configuracoes_iniciais_service.dart';

class ConfiguracoesIniciaisViewModel extends ChangeNotifier {
  final ConfiguracoesIniciaisService configuracoesIniciaisService;
  late Command0 buscarConfiguracoesIniciasCommand;
  ConfiguracoesIniciaisViewModel({required this.configuracoesIniciaisService}) {
    buscarConfiguracoesIniciasCommand = Command0<void>(
      _iniciarConfiguracoesIniciais,
    );
  }
  ExceptionApp get exceptionApp => _exceptionApp;
  late ExceptionApp _exceptionApp;
  Future<Result<bool, ExceptionApp>> _iniciarConfiguracoesIniciais() async {
    Result<bool, ExceptionApp> resultadoConfiguracao =
        await configuracoesIniciaisService.iniciarConfiguracao();
    if (resultadoConfiguracao.isError) {
      _exceptionApp = resultadoConfiguracao.exceptionOrNull()!;
      notifyListeners();
      return Failure(_exceptionApp);
    }
    return Success(resultadoConfiguracao.getOrNull()!);
  }
}
