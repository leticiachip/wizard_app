import 'package:wizard_app/app/data/repositories/atualizador_connectbus/atualizador_connectbus_repository.dart'
    show AtualizadorConnectbusRepository;
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/result.dart';

import '../../../../core/const/codigo_rastreio.dart';
import '../../../../core/requisicao_app/rotas_requisicao/rotas_download.dart';
import '../../../../core/requisicao_app/services/central_download_service.dart';
import '../../../../core/requisicao_app/services/central_upload_service.dart'
    show CentralUploadService;
import '../../../../core/requisicao_app/utils/resultado_requisicao.dart';

class AtualizadorConnectbusRepositoryImpl
    implements AtualizadorConnectbusRepository {
  final CentralDownloadService centralDownloadService;
  final CentralUploadService centralUploadService;

  AtualizadorConnectbusRepositoryImpl({
    required this.centralDownloadService,
    required this.centralUploadService,
  });
  @override
  Future<Result<Map<String, dynamic>?, ExceptionApp>> buscarCarga() async{
   Result<ResultadoRequisicao, ExceptionApp> resultado =
        await centralDownloadService.executarDownload(
          NomeRotasDownload.downloadCargaAtualizacaoConnect,
          body: {"id": "00001BDA"},
          rastreio: '${CodigoRastreio.atualizacaoConnect}.3',
        );
    if (resultado.isSuccess) {
      ResultadoRequisicao requisicao = resultado.getOrNull()!;
      return Success(requisicao.body!['data']);
    }
    return Failure(resultado.exceptionOrNull()!);
  }
}
