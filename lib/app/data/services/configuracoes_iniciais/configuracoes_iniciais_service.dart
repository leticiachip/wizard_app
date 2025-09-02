import 'package:wizard_app/core/utils/result.dart';

import '../../../../core/exceptions_app/model/exception_app.dart';

abstract class ConfiguracoesIniciaisService {
  ConfiguracoesIniciaisService();
  Future<Result<bool, ExceptionApp>> iniciarConfiguracao();
}
