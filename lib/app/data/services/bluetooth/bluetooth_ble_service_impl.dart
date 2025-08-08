import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:wizard_app/app/adapter/bluetooth_ble_adapter.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';

import '../../../../core/services/permission_services/permission_handler_service.dart'
    show PermissionHandlerService;

class BluetoothBleServiceImpl implements BluetoothAppService {
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
  Future<String> transmitirComando(String comando) async {
    print("------> transmitir BLE $comando");
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

  @override
  Future<void> desconectar() async {
    await bluetoothBleAdapter.disconnect();
    return;
  }
}
