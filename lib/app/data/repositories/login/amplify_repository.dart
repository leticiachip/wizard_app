import 'package:wizard_app/app/data/services/login/enum_result_login.dart';
import 'package:wizard_app/app/data/services/login/exception_login.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/result.dart';

abstract class AmplifyRepository {
  Future<Result<EnumResultLogin, ExceptionLogin>> autenticarUsuario(
    String email,
    String senha,
  );
  Future<void> configurarAmplify();
  Future<bool> buscarUsuarioLogado();
  Future<Result<bool, ExceptionLogin>> signout();
  Future<Result<Map<String, dynamic>, ExceptionLogin>> buscarIdToken();
  Future<Result<String, ExceptionApp>> buscarToken();
  Future<Result<bool, ExceptionApp>> confirmarTrocaSenha(String senha);
  Future<Result<bool, ExceptionApp>> resetarSenha(
    String email,
    String senha,
    String codigoConfirmacao,
  );
  Future<Result<String, ExceptionApp>> envioEmailSenha(String email);
}
