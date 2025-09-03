import 'package:wizard_app/app/data/repositories/atualizador_esp/atualizador_esp_repository.dart';
import 'package:wizard_app/app/data/repositories/atualizador_esp/atualizador_esp_repository_impl.dart';
import 'package:wizard_app/app/data/services/atualizador_esp/atualizador_esp_service.dart';
import 'package:wizard_app/app/data/services/atualizador_esp/atualizador_esp_service_impl.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';
import 'package:wizard_app/app/ui/atualizador_esp/view_model/atualizador_view_model.dart';
import 'package:wizard_app/core/requisicao_app/services/central_download_service.dart';
import 'package:wizard_app/core/requisicao_app/services/central_upload_service.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';

class AtualizadorGetit {
  AtualizadorGetit._internal();
  static final instance = AtualizadorGetit._internal();

  registrarAtualizadorGetit() {
    getIt.registerLazySingleton<AtualizadorEspService>(
      () => AtualizadorEspServiceImpl(
        bluetoothAppService: getIt<BluetoothAppService>(
          instanceName: 'classic',
        ),
        atualizadorEspRepository: getIt<AtualizadorEspRepository>(),
      ),
    );
    getIt.registerLazySingleton<AtualizadorViewModel>(
      () => AtualizadorViewModel(
        bluetoothAppService: getIt<BluetoothAppService>(instanceName: 'classic'),
        atualizadorEspService: getIt<AtualizadorEspService>(),
      ),
    );
    getIt.registerLazySingleton<AtualizadorEspRepository>(
      () => AtualizadorEspRepositoryImpl(
        centralDownloadService: getIt<CentralDownloadService>(),
        centralUploadService: getIt<CentralUploadService>(),
      ),
    );
  }
}
