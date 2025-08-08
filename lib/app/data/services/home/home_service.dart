import 'package:wizard_app/core/utils/result.dart';

import '../../../../core/exceptions_app/model/exception_app.dart'
    show ExceptionApp;

abstract class HomeService {
  Future<Result<List<String>, ExceptionApp>> buscarPermissoes();
  Future<void> capturarImagem();
}
