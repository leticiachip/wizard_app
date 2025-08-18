import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:wizard_app/app/adapter/bluetooth_ble_adapter.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';
import 'package:wizard_app/app/data/utils/estado_conexao_bluetooth.dart';
import 'package:wizard_app/app/domain/models/bluetooth/devices.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/result.dart';

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
    String resp = await bluetoothBleAdapter.transmitCommand(comando);
    return resp;
  }

  @override
  Future<EstadoConexaoBluetooth> obterStatusConexao() async {
    BluetoothConnectionState statusConexao = await bluetoothBleAdapter
        .getConnectionState();
    if (BluetoothConnectionState.connected == statusConexao) {
      return EstadoConexaoBluetooth.conectado;
    }
    return EstadoConexaoBluetooth.desconectado;
  }

  @override
  Future<void> desconectar() async {
    await bluetoothBleAdapter.disconnect();
    return;
  }

  @override
  Future<Result<List<Devices>, ExceptionApp>> scan() {
    // TODO: implement scan
    throw UnimplementedError();
  }

  @override
  void stopScan() {
    // TODO: implement stopScan
  }
}
