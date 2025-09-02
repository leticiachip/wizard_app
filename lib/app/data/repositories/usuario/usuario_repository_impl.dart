// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wizard_app/app/data/repositories/usuario/usuario_repository.dart';
import 'package:wizard_app/core/const/codigo_rastreio.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/requisicao_app/rotas_requisicao/rotas_download.dart';
import 'package:wizard_app/core/requisicao_app/services/central_download_service.dart';
import 'package:wizard_app/core/utils/result.dart';

import '../../../../core/requisicao_app/utils/resultado_requisicao.dart';

class UsuarioRepositoryImpl implements UsuarioRepository {
  final CentralDownloadService centralDownloadService;
  UsuarioRepositoryImpl({required this.centralDownloadService});
  @override
  Future<Result<ResultadoRequisicao, ExceptionApp>> buscarUsuario() async {
    Result<ResultadoRequisicao, ExceptionApp> resultUsuario =
        await centralDownloadService.executarDownload(
          NomeRotasDownload.downloadUsuario,
          body: {},
          rastreio: CodigoRastreio.usuario,
        );
    return resultUsuario;
  }
}
