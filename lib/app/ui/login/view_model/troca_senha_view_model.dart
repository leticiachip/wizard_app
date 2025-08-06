import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wizard_app/app/data/services/login/login_service.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/command.dart';
import 'package:wizard_app/core/utils/result.dart';

class TrocaSenhaViewModel extends ChangeNotifier {
  final LoginService loginService;
  late Command1 trocaSenha;
  TrocaSenhaViewModel({required this.loginService}) {
    trocaSenha = Command1<void, String>(_trocaSenha);
  }
  ExceptionApp get exceptionApp => _exceptionApp;
  late ExceptionApp _exceptionApp;
  bool get sucessoTrocaSenha => _sucessoTrocaSenha;
  late bool _sucessoTrocaSenha;

  Future<Result<bool, ExceptionApp>> _trocaSenha(String novaSenha) async {
    final (senha) = novaSenha;
    Result<bool, ExceptionApp> resultTroca = await loginService
        .trocarSenhaPrimeiroUso(senha);

    if (resultTroca.isError) {
      _exceptionApp = resultTroca.exceptionOrNull()!;
      print("-> erro $_exceptionApp");
    }
    if (resultTroca.isSuccess) {
      _sucessoTrocaSenha = resultTroca.getOrNull()!;
      log("---->>> troca senha $_sucessoTrocaSenha");
    }
    notifyListeners();
    return resultTroca;
  }
}
