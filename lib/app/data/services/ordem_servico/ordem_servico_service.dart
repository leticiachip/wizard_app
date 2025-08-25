import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/utils/result.dart';
import '../../../domain/models/ordem_servico/ordem_servico.dart' show OrdemServico;

abstract class OrdemServicoService {
  Future<Result<List<OrdemServico>, ExceptionApp>> buscarOrdemServico();
}
