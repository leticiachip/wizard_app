import 'package:wizard_app/core/requisicao_app/repository/central_requisicao_repository.dart';
import 'package:wizard_app/core/requisicao_app/services/central_download_service.dart';
import 'package:wizard_app/core/requisicao_app/services/central_upload_service.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';

class CentralRequisicaoGetIt {
  CentralRequisicaoGetIt._internal();
  static final instance = CentralRequisicaoGetIt._internal();
  registrarCentralReq() {
    getIt.registerLazySingleton<CentralRequisicaoRepository>(
      () => CentralRequisicaoRepository(),
    );
    getIt.registerLazySingleton<CentralDownloadService>(
      () => CentralDownloadService(
        centralRequisicaoRepository: getIt<CentralRequisicaoRepository>(),
      ),
    );
    getIt.registerLazySingleton<CentralUploadService>(
      () => CentralUploadService(
        centralRequisicaoRepository: getIt<CentralRequisicaoRepository>(),
      ),
    );
  }
}
