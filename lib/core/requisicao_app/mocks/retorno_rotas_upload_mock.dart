import 'package:wizard_app/core/requisicao_app/rotas_requisicao/rotas_upload.dart';

import '../utils/resultado_requisicao.dart';
import '../utils/status_response.dart';

class MockUpload {
  static ResultadoRequisicao resultadoMock(NomeRotasUpload rotas) {
    switch (rotas) {
      case NomeRotasUpload.uploadSituacaoAtualizacao:
        return ResultadoRequisicao(
          body: {},
          codigoRastreio: 0,
          estadoResponse: EstadoResponse.todasInformacoesCadastrada,
        );
      case NomeRotasUpload.downloadCarga:
        return ResultadoRequisicao(
          body: {},
          codigoRastreio: 0,
          estadoResponse: EstadoResponse.todasInformacoesCadastrada,
        );
    }
  }
}
