import 'package:wizard_app/app/data/repositories/atualizador_esp/atualizador_esp_repository.dart';
import 'package:wizard_app/core/const/codigo_rastreio.dart';
import 'package:wizard_app/core/requisicao_app/rotas_requisicao/rotas_download.dart';
import 'package:wizard_app/core/requisicao_app/rotas_requisicao/rotas_upload.dart';
import 'package:wizard_app/core/requisicao_app/services/central_download_service.dart';
import 'package:wizard_app/core/requisicao_app/services/central_upload_service.dart';

import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/requisicao_app/utils/resultado_requisicao.dart'
    show ResultadoRequisicao;
import '../../../../core/utils/result.dart';

class AtualizadorEspRepositoryImpl implements AtualizadorEspRepository {
  final CentralDownloadService centralDownloadService;
  final CentralUploadService centralUploadService;
  AtualizadorEspRepositoryImpl({
    required this.centralDownloadService,
    required this.centralUploadService,
  });
  @override
  Future<Result<Map<String, dynamic>?, ExceptionApp>>
  buscarPermissaoAtualizacao(String serial, String mac) async {
    //buscar permissao atualizacao
    Result<ResultadoRequisicao, ExceptionApp> resultado =
        await centralDownloadService.executarDownload(
          NomeRotasDownload.downloadPermissaoAtualizarEsp,
          body: {"serial": serial},
          rastreio: '${CodigoRastreio.atualizacaoESP}.3',
        );
    if (resultado.isSuccess) {
      ResultadoRequisicao requisicao = resultado.getOrNull()!;
      return Success(requisicao.body!['data']);
    }
    return Failure(resultado.exceptionOrNull()!);
  }

  @override
  Future<Result<Map<String, dynamic>, ExceptionApp>> enviarResultadoAtualizacao(
    int id,
    String versao,
    String status,
  ) async {
    Result<ResultadoRequisicao, ExceptionApp> resultado =
        await centralUploadService.executarUpload(
          NomeRotasUpload.uploadSituacaoAtualizacao,
          body: {"versao": versao, 'id': id, 'status': status},
          rastreio: "${CodigoRastreio.atualizacaoESP}.4",
        );
    if (resultado.isSuccess) {
      // ResultadoRequisicao requisicao = resultado.getOrNull()!;
      return Success({});
    }
    return Failure(resultado.exceptionOrNull()!);
  }
}
