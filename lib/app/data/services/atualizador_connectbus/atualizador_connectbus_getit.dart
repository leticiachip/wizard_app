import 'package:wizard_app/app/data/repositories/atualizador_connectbus/atualizador_connectbus_repository.dart';
import 'package:wizard_app/app/data/repositories/atualizador_connectbus/atualizador_connectbus_repository_impl.dart';
import 'package:wizard_app/app/data/services/atualizador_connectbus/atualizador_connectbus_service.dart';
import 'package:wizard_app/app/data/services/atualizador_connectbus/atualizador_connectbus_service_impl.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';
import 'package:wizard_app/app/ui/atualizador_connectbus/view_model/atualizador_connectbus_view_model.dart';
import 'package:wizard_app/core/requisicao_app/services/central_download_service.dart';
import 'package:wizard_app/core/requisicao_app/services/central_upload_service.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';

class AtualizadorConnectbusGetit {
  AtualizadorConnectbusGetit._intance();

  static final instance = AtualizadorConnectbusGetit._intance();

  registrarAtualizadorConnectbusGetit() {
    getIt.registerLazySingleton<AtualizadorConnectbusRepository>(
      () => AtualizadorConnectbusRepositoryImpl(
        centralDownloadService: getIt<CentralDownloadService>(),
        centralUploadService: getIt<CentralUploadService>(),
      ),
    );
    getIt.registerLazySingleton<AtualizadorConnectbusService>(
      () => AtualizadorConnectBusServiceImpl(
        bluetoothAppService: getIt<BluetoothAppService>(instanceName: 'ble'),
        atualizadorConnectbusRepository:
            getIt<AtualizadorConnectbusRepository>(),
      ),
    );
    getIt.registerFactory<AtualizadorConnectbusViewModel>(
      () => AtualizadorConnectbusViewModel(
        atualizadorConnectBusService: getIt<AtualizadorConnectbusService>(),
      ),
    );
  }
}
