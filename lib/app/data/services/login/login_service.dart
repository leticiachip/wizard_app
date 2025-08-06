import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/result.dart';

import 'enum_result_login.dart';
import 'exception_login.dart';

abstract class LoginService {
  Future<bool> validaUsuarioLogado();
  Future<void> initAmplify();
  Future<Result<EnumResultLogin, ExceptionLogin>> login(
    String email,
    String senha,
  );
  Future<Result<bool, ExceptionLogin>> deslogarUsuario();
  Future<Result<String, ExceptionApp>> token();
  Future<Result<bool, ExceptionApp>> trocarSenhaPrimeiroUso(String senha);
  Future<Result<bool, ExceptionApp>> confirmarTrocaSenha(
    String username,
    String pass,
    String code,
  );
  Future<Result<String, ExceptionApp>> enviarEmailResetSenha(String email);
  String? regexEmail(String? email);
  String? regexSenha(String? senha);
  Future<Result<Map<String, dynamic>, ExceptionLogin>> buscaridToken();
}
