import 'package:wizard_app/core/requisicao_app/rotas_requisicao/rotas_download.dart';
import 'package:wizard_app/core/requisicao_app/utils/status_response.dart';

import '../utils/resultado_requisicao.dart';
import 'arquivo_atualizacao_connect.dart';
import 'array_lista_ordem_servico.dart';
//import 'arquivo_atualizacao.dart';

class MockDownload {
  static ResultadoRequisicao resultadoMock(NomeRotasDownload rotas) {
    switch (rotas) {
      case NomeRotasDownload.downloadPermissaoAtualizarEsp:
        return ResultadoRequisicao(
          body: {'message': 'nada', 'data': null},
          codigoRastreio: 0,
          estadoResponse: EstadoResponse.todasInformacoesCadastrada,
        );
      case NomeRotasDownload.downloadCargaAtualizacaoConnect:
        return ResultadoRequisicao(
          body: {'message':"nada", "data": atualizacaoConnect},
          codigoRastreio: 0);
      
      case NomeRotasDownload.downloadOrdemServico:
        return ResultadoRequisicao(
          body: {'message': 'nada', "data": arrayOS},
          codigoRastreio: 0);
    }
  }
}
