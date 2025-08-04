import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart' show ResultDart;
import 'package:wizard_app/app/data/services/configuracoes/configuracoes_service.dart';
import 'package:wizard_app/core/utils/command.dart';
import '../../../data/services/login/exception_login.dart' show ExceptionLogin;

class ConfiguracoesViewModel extends ChangeNotifier {
  final ConfiguracoesService configuracoesService;
  late ExceptionLogin _exceptionLogin;
  late Command0 logoutUser;
  ConfiguracoesViewModel({required this.configuracoesService}) {
    logoutUser = Command0(_logoutUser);
  }
  ExceptionLogin get exceptionLogin => _exceptionLogin;

  Future<ResultDart<bool, ExceptionLogin>> _logoutUser() async {
    ResultDart<bool, ExceptionLogin> resultadoDeslogar =
        await configuracoesService.deslogar();

    if (resultadoDeslogar.isError()) {
      ExceptionLogin exception = resultadoDeslogar.exceptionOrNull()!;
      _exceptionLogin = exception;
    }
    notifyListeners();
    return resultadoDeslogar;
  }
}
