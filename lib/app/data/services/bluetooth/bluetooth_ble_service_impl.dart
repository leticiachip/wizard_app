import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:wizard_app/app/adapter/bluetooth_ble_adapter.dart';

import '../../../../core/services/permission_services/permission_handler_service.dart'
    show PermissionHandlerService;
import 'bluetooth_service.dart';

class BluetoothBleServiceImpl implements BluetoothBleService {
  final BluetoothBleAdapter bluetoothBleAdapter;
  final PermissionHandlerService permissionHandlerService;

  BluetoothBleServiceImpl({
    required this.permissionHandlerService,
    required this.bluetoothBleAdapter,
  });

  @override
  Future<bool> conectar(String mac) async {
    return await bluetoothBleAdapter.connectDevice(mac);
  }

  @override
  Future<String> transmitirComandoBle(String comando) async {
    print("------> comando $comando");
    String resp = await bluetoothBleAdapter.transmitCommand(comando);
    print("---------------------------> resp $resp");
    return resp;
  }

  @override
  Future<bool> obterStatusConexao() async {
    BluetoothConnectionState statusConexao = await bluetoothBleAdapter
        .getConnectionState();
    return statusConexao == BluetoothConnectionState.connected;
  }
}
