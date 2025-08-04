import 'package:wizard_app/app/adapter/bluetooth_ble_adapter.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_ble_service_impl.dart'
    show BluetoothBleServiceImpl;
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';
import 'package:wizard_app/core/services/permission_services/permission_handler_service.dart';

class BluetoothGetIt {
  BluetoothGetIt._internal();
  static final instance = BluetoothGetIt._internal();

  registrarBluetoothGetIt() {
    /* getIt.registerLazySingleton<ConectarBleViewModel>(
      () => ConectarBleViewModel(
        bluetoothSerialService: BluetoothBleServiceImpl(
          bluetoothBleAdapter: getIt<BluetoothBleAdapter>(),
          permissionHandlerService: getIt<PermissionHandlerService>(),
        ),
      ),
    ); */

    getIt.registerFactory<BluetoothBleService>(
      () => BluetoothBleServiceImpl(
        bluetoothBleAdapter: getIt<BluetoothBleAdapter>(),
        permissionHandlerService: getIt<PermissionHandlerService>(),
      ),
    );
    getIt.registerLazySingleton<BluetoothBleAdapter>(
      () => BluetoothBleAdapter(),
    );
  }
}
