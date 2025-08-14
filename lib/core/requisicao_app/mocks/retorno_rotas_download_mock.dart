import 'package:wizard_app/core/requisicao_app/rotas_requisicao/rotas_download.dart';
import 'package:wizard_app/core/requisicao_app/utils/status_response.dart';

import '../utils/resultado_requisicao.dart';
import 'arquivo_atualizacao.dart';

class MockDownload {
  static ResultadoRequisicao resultadoMock(NomeRotasDownload rotas) {
    switch (rotas) {
      case NomeRotasDownload.downloadPermissaoAtualizarEsp:
        return ResultadoRequisicao(
          body: {'message': 'nada', 'data': atualizacao},
          codigoRastreio: 0,
          estadoResponse: EstadoResponse.todasInformacoesCadastrada,
        );
    }
  }
}
