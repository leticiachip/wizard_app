import 'dart:developer';

import 'package:result_dart/result_dart.dart';
import 'package:wizard_app/core/utils/command.dart';

import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../data/services/login/login_service.dart';

class EsqueciSenhaViewModel {
  final LoginService loginService;
  late Command1 alterarSenha;
  late Command1 confirmarEmail;
  EsqueciSenhaViewModel({required this.loginService}) {
    alterarSenha = Command1<void, (String email, String senha, String codigo)>(
      _alterarSenha,
    );
    confirmarEmail = Command1<void, String>(_enviarEmailCodigo);
  }
  ExceptionApp get exceptionApp => _exceptionApp;
  late ExceptionApp _exceptionApp;
  bool get sucessoTrocaSenha => _sucessoTrocaSenha;
  late bool _sucessoTrocaSenha;
  bool get confirmarCodigo => _confirmarCodigo;
  bool _confirmarCodigo = false;

  Future<ResultDart<bool, ExceptionApp>> _alterarSenha(
    (String, String, String) dados,
  ) async {
    final email = dados.$1;
    final senha = dados.$2;
    final codigo = dados.$3;
    ResultDart<bool, ExceptionApp> result = await loginService
        .confirmarTrocaSenha(email, senha, codigo);
    if (result.isError()) {
      ExceptionApp exception = result.exceptionOrNull()!;
      log("> error $exception");
      _exceptionApp = exception;
    }
    if (result.isSuccess()) {
      _sucessoTrocaSenha = result.getOrNull()!;
      log("> error $_sucessoTrocaSenha");
    }
    return result;
  }

  Future<ResultDart<String, ExceptionApp>> _enviarEmailCodigo(
    String email,
  ) async {
    ResultDart<String, ExceptionApp> result = await loginService
        .enviarEmailResetSenha(email);
    if (result.isError()) {
      ExceptionApp exception = result.exceptionOrNull()!;
      _exceptionApp = exception;
    }
    if (result.isSuccess()) {
      String resposta = result.getOrNull()!;
      if (resposta.contains("confirmResetPasswordWithCode")) {
        _confirmarCodigo = true;
      }
    }
    return result;
  }

  String? regexSenha(String? senha) {
    return loginService.regexSenha(senha);
  }

  String? regexEmail(String? email) {
    return loginService.regexEmail(email);
  }

  String? validacaoCodigo(String? codigo) {
    if (codigo == null) {
      return null;
    }
    if (codigo.length < 6) {
      return "Código incompleto";
    }
    return null;
  }
}
