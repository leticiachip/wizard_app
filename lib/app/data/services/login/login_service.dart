import 'package:result_dart/result_dart.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';

import 'enum_result_login.dart';
import 'exception_login.dart';

abstract class LoginService {
  Future<bool> validaUsuarioLogado();
  Future<void> initAmplify();
  Future<ResultDart<EnumResultLogin, ExceptionLogin>> login(
    String email,
    String senha,
  );
  Future<ResultDart<bool, ExceptionLogin>> deslogarUsuario();
  Future<ResultDart<String, ExceptionApp>> token();
  Future<ResultDart<bool, ExceptionApp>> trocarSenhaPrimeiroUso(String senha);
  Future<ResultDart<bool, ExceptionApp>> confirmarTrocaSenha(
    String username,
    String pass,
    String code,
  );
  Future<ResultDart<String, ExceptionApp>> enviarEmailResetSenha(String email);
  String? regexEmail(String? email);
  String? regexSenha(String? senha);
  Future<ResultDart<Map<String, dynamic>, ExceptionLogin>> buscaridToken();
}
