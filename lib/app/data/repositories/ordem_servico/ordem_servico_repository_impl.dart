import 'package:wizard_app/core/const/codigo_rastreio.dart';
import 'package:wizard_app/core/requisicao_app/rotas_requisicao/rotas_download.dart';
import 'package:wizard_app/core/utils/result.dart';

import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/requisicao_app/services/central_download_service.dart';
import '../../../../core/requisicao_app/utils/resultado_requisicao.dart';
import 'ordem_servico_repository.dart';

class OrdemServicoRepositoryImpl implements OrdemServicoRepository {
  final CentralDownloadService centralDownloadService;
  OrdemServicoRepositoryImpl({required this.centralDownloadService});

  @override
  Future<Result<ResultadoRequisicao, ExceptionApp>>
  buscarOrdemServicoDisponiveis() {
    return centralDownloadService.executarDownload(
      NomeRotasDownload.downloadOrdemServico,
      body: {},
      rastreio: CodigoRastreio.ordemServico,
    );
  }

  @override
  Future<Result<ResultadoRequisicao, ExceptionApp>> buscarManualPdf(
    String url,
    Map<String, dynamic> body,
  ) async {
    return centralDownloadService.executarDownload(
      NomeRotasDownload.downloadManual,
      body: {},
      rastreio: CodigoRastreio.ordemServico,
    );
  }

  @override
  buscarArquivoPdf(String urlPdf) {
    return centralDownloadService.baixarArquivo(
      urlPdf,
      rastreio: CodigoRastreio.baixarArquivo,
    );
  }

  @override
  Future<Result<ResultadoRequisicao, ExceptionApp>> buscarOrdemServico() {
    return centralDownloadService.executarDownload(
      NomeRotasDownload.downloadOrdemServicoEspecifica,
      body: {},
      rastreio: CodigoRastreio.ordemServico,
    );
  }
  
  @override
  Future<Result<ResultadoRequisicao, ExceptionApp>> buscarWorkflowOrdemServico() {
    return centralDownloadService.executarDownload(
      NomeRotasDownload.downloadWorflow,
      body: {},
      rastreio: CodigoRastreio.ordemServico,
    );
  }
}
