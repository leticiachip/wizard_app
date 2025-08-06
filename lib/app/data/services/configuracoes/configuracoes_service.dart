import 'package:wizard_app/core/utils/result.dart';

import '../login/exception_login.dart';

abstract class ConfiguracoesService {
  Future<Result<bool, ExceptionLogin>> deslogar();
}
