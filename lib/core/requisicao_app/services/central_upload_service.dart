import 'package:wizard_app/core/requisicao_app/rotas_requisicao/rotas_upload.dart';
import '../../exceptions_app/model/exception_app.dart';
import '../../utils/result.dart';
import '../mocks/retorno_rotas_upload_mock.dart';
import '../repository/central_requisicao_repository.dart'
    show CentralRequisicaoRepository, TiposRequisicao;
import '../utils/resultado_requisicao.dart';

class CentralUploadService {
  final CentralRequisicaoRepository centralRequisicaoRepository;
  CentralUploadService({required this.centralRequisicaoRepository});
  Future<Result<ResultadoRequisicao, ExceptionApp>> executarUpload(
    NomeRotasUpload rota, {
    required Map<String, dynamic> body,
    required String rastreio,
  }) async {
    if (rota.name.contains('/mock')) {
      return Success(
        MockUpload.resultadoMock(NomeRotasUpload.uploadSituacaoAtualizacao),
      );
    }
    Result<ResultadoRequisicao, ExceptionApp> resultReq =
        await centralRequisicaoRepository.requisicaoPrincipal(
          urlRota: rota.name,
          tipo: TiposRequisicao.post.tipo,
          rastreio: rastreio,
        );
    return resultReq;
  }
}
