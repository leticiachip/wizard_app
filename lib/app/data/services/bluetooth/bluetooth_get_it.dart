import 'package:wizard_app/app/adapter/bluetooth_ble_adapter.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_ble_service_impl.dart'
    show BluetoothBleServiceImpl;
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_serial_service_impl.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';
import 'package:wizard_app/app/ui/bluetooth/view_model/bluetooth_view_model.dart';
import 'package:wizard_app/app/ui/bluetooth/view_model/scan_view_model.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';
import 'package:wizard_app/core/services/permission_services/permission_handler_service.dart';

class BluetoothGetIt {
  BluetoothGetIt._internal();
  static final instance = BluetoothGetIt._internal();

  registrarBluetoothGetIt() {
    getIt.registerLazySingleton<BluetoothAppService>(
      () => BluetoothBleServiceImpl(
        bluetoothBleAdapter: getIt<BluetoothBleAdapter>(),
      ),
      instanceName: 'ble',
    );
    getIt.registerLazySingleton<BluetoothAppService>(
      () => BluetoothClassicService(),
      instanceName: 'classic',
    );

    getIt.registerLazySingleton<BluetoothBleAdapter>(
      () => BluetoothBleAdapter(),
    );

    getIt.registerLazySingleton<ScanViewModel>(
      () => ScanViewModel(
        bluetoothAppService: getIt<BluetoothAppService>(
          instanceName: 'classic',
        ),
        permissionHandlerService: getIt<PermissionHandlerService>(),
      ),
    );
    getIt.registerLazySingleton<BluetoothViewModel>(
      () => BluetoothViewModel(
        bluetoothBleService: getIt<BluetoothAppService>(
          instanceName: 'classic',
        ),
      ),
    );
  }
}
