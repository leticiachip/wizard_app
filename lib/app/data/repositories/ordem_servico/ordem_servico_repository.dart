import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/requisicao_app/utils/resultado_requisicao.dart' show ResultadoRequisicao;
import '../../../../core/utils/result.dart';

abstract class OrdemServicoRepository {
  Future<Result<ResultadoRequisicao, ExceptionApp>> buscarOrdemServico();
}
