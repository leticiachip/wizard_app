import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions_app/model/exception_app.dart' show ExceptionApp;

abstract class HomeService {
  Future<ResultDart<List<String>, ExceptionApp>> buscarPermissoes();
}
