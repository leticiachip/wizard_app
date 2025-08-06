// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:wizard_app/app/data/services/configuracoes/configuracoes_service.dart';
import 'package:wizard_app/core/utils/result.dart';

import '../login/exception_login.dart';
import '../login/login_service.dart';

class ConfiguracoesServiceImpl implements ConfiguracoesService {
  final LoginService loginService;
  ConfiguracoesServiceImpl({required this.loginService});
  @override
  Future<Result<bool, ExceptionLogin>> deslogar() async {
    return await loginService.deslogarUsuario();
  }
}
