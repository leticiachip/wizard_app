import 'package:result_dart/result_dart.dart';
import 'package:wizard_app/app/data/services/login/enum_result_login.dart';
import 'package:wizard_app/app/data/services/login/exception_login.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';

abstract class AmplifyRepository {
  Future<ResultDart<EnumResultLogin, ExceptionLogin>> autenticarUsuario(
    String email,
    String senha,
  );
  Future<void> configurarAmplify();
  Future<bool> buscarUsuarioLogado();
  Future<ResultDart<bool, ExceptionLogin>> signout();
  Future<ResultDart<Map<String, dynamic>, ExceptionLogin>> buscarIdToken();
  Future<ResultDart<String, ExceptionApp>> buscarToken();
  Future<ResultDart<bool, ExceptionApp>> confirmarTrocaSenha(String senha);
  Future<ResultDart<bool, ExceptionApp>> resetarSenha(
    String email,
    String senha,
    String codigoConfirmacao,
  );
  Future<ResultDart<String, ExceptionApp>> envioEmailSenha(String email);
}
