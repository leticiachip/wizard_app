import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/result.dart';

import '../../../../core/requisicao_app/utils/resultado_requisicao.dart';

abstract class UsuarioRepository {
  Future<Result<ResultadoRequisicao, ExceptionApp>> buscarUsuario();
}