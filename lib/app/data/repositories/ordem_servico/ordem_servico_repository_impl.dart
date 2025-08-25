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
  Future<Result<ResultadoRequisicao, ExceptionApp>> buscarOrdemServico() {
    return centralDownloadService.executarDownload(
      NomeRotasDownload.downloadOrdemServico,
      body: {},
      rastreio: CodigoRastreio.ordemServico,
    );
  }
}
