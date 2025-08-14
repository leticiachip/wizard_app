import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/utils/result.dart';

abstract class AtualizadorEspRepository {
  Future<Result<Map<String, dynamic>?, ExceptionApp>>
  buscarPermissaoAtualizacao(String serial, String mac);
  Future<Result<Map<String, dynamic>, ExceptionApp>> enviarResultadoAtualizacao(
    int id,
    String versao,
    String status,
  );
}
