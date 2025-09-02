import 'package:permission_handler/permission_handler.dart';
import 'package:wizard_app/core/services/permission_services/permission_handler_service.dart';

class PermissionHandlerServiceImpl implements PermissionHandlerService {
  @override
  Future<bool> permissaBluetooth() async {
    PermissionStatus reqBluetoothScan = await Permission.bluetoothScan
        .request();
    PermissionStatus reqBtConnect = await Permission.bluetoothConnect.request();
    PermissionStatus reqBluetooth = await Permission.bluetooth.request();

    return reqBluetoothScan.isGranted &&
        reqBtConnect.isGranted &&
        reqBluetooth.isGranted;
  }

  @override
  Future<bool> permissaoLocalizacaoPrimeiroPlano() async {
    PermissionStatus reqLocation = await Permission.location.request();
    PermissionStatus reqWhenUse = await Permission.locationWhenInUse.request();
    return reqWhenUse.isGranted && reqLocation.isGranted;
  }
}
