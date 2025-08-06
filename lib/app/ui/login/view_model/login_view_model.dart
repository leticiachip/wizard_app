import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wizard_app/app/data/services/login/enum_result_login.dart';
import 'package:wizard_app/app/data/services/login/exception_login.dart';
import 'package:wizard_app/app/data/services/login/login_service.dart';
import 'package:wizard_app/core/utils/command.dart';
import 'package:wizard_app/core/utils/result.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginService loginService;
  late Command1 login;
  late Command1 login2;
  LoginViewModel({required this.loginService}) {
    login = Command1<void, (String email, String senha)>(_login);
  }

  ExceptionLogin get exceptionLogin => _exceptionLogin;
  late ExceptionLogin _exceptionLogin;
  EnumResultLogin get enumResultLogin => _enumResultLogin;
  late EnumResultLogin _enumResultLogin;

  Future<Result<EnumResultLogin, ExceptionLogin>> _login(
    (String, String) credenciais,
  ) async {
    final (email, senha) = credenciais;
    Result<EnumResultLogin, ExceptionLogin> resultLogin = await loginService
        .login(email, senha);
  //  log("----->> result login ${resultLogin.}");
    if (resultLogin.isError) {
      log("------>> caiu na falha");
      ExceptionLogin exception = resultLogin.exceptionOrNull()!;
      _exceptionLogin = exception;
    }
    if (resultLogin.isSuccess) {
      log("------>> caiu no sucesso");
      _enumResultLogin = resultLogin.getOrNull()!;
    }
    notifyListeners();
    return resultLogin;
  }

  String? regexEmail(String? email) {
    return loginService.regexEmail(email);
  }

  String? regexSenha(String? senha) {
    return loginService.regexSenha(senha);
  }
}
