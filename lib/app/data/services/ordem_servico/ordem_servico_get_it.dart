import 'package:wizard_app/app/data/repositories/ordem_servico/ordem_servico_repository.dart';
import 'package:wizard_app/app/data/repositories/ordem_servico/ordem_servico_repository_impl.dart';
import 'package:wizard_app/app/data/services/ordem_servico/ordem_servico_service.dart';
import 'package:wizard_app/app/data/services/ordem_servico/ordem_servico_service_impl.dart';
import 'package:wizard_app/app/ui/ordem_servico/view_model/ordem_servico_view_model.dart';
import 'package:wizard_app/core/requisicao_app/services/central_download_service.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';

class OrdemServicoGetIt {
  OrdemServicoGetIt._internal();
  static final instance = OrdemServicoGetIt._internal();
  registrarOrdemServico() {
    getIt.registerLazySingleton<OrdemServicoService>(
      () => OrdemServicoServiceImpl(
        ordemServicoRepository: getIt<OrdemServicoRepository>(),
      ),
    );
    getIt.registerLazySingleton<OrdemServicoRepository>(
      () => OrdemServicoRepositoryImpl(
        centralDownloadService: getIt<CentralDownloadService>(),
      ),
    );
    getIt.registerLazySingleton<OrdemServicoViewModel>(
      () => OrdemServicoViewModel(
        ordemServicoService: getIt<OrdemServicoService>(),
      ),
    );
   
  }
}
