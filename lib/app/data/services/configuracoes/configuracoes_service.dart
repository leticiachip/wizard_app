import 'package:result_dart/result_dart.dart' show ResultDart;

import '../login/exception_login.dart';

abstract class ConfiguracoesService {
  Future<ResultDart<bool, ExceptionLogin>> deslogar();
}
