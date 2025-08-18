import 'package:wizard_app/core/requisicao_app/repository/central_requisicao_repository.dart';

import '../../exceptions_app/model/exception_app.dart';
import '../../utils/result.dart';
import '../mocks/retorno_rotas_download_mock.dart';
import '../rotas_requisicao/rotas_download.dart';
import '../utils/resultado_requisicao.dart';

class CentralDownloadService {
  final CentralRequisicaoRepository centralRequisicaoRepository;
  CentralDownloadService({required this.centralRequisicaoRepository});

  Future<Result<ResultadoRequisicao, ExceptionApp>> executarDownload(
    NomeRotasDownload rota, {
    required Map<String, dynamic> body,
    required String rastreio
  }) async {
    if (rota.name.contains('/mock')) {
      return Success(MockDownload.resultadoMock(rota));
    }
    Result<ResultadoRequisicao, ExceptionApp> resultReq =
        await centralRequisicaoRepository.requisicaoPrincipal(
          urlRota: rota.name,
          tipo: TiposRequisicao.post.tipo,
          body: body,
          rastreio: rastreio
        );
    return resultReq;
  }
}
