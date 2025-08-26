import 'dart:typed_data';

import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/requisicao_app/utils/resultado_requisicao.dart'
    show ResultadoRequisicao;
import '../../../../core/utils/result.dart';

abstract class OrdemServicoRepository {
  Future<Result<ResultadoRequisicao, ExceptionApp>> buscarOrdemServico();
  Future<Result<ResultadoRequisicao, ExceptionApp>> buscarEtapaOS();
  Future<Result<ResultadoRequisicao, ExceptionApp>> buscarChecklist();
  Future<Result<ResultadoRequisicao, ExceptionApp>> buscarManualPdf(
    String url,
    Map<String, dynamic> body,
  );
  Future<Result<Uint8List, ExceptionApp>> buscarArquivoPdf(String urlPdf);
}
