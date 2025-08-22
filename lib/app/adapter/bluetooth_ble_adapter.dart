import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../data/utils/ble_guid.dart';

class BluetoothBleAdapter {
  BluetoothDevice? _bluetoothDevice;
  String receiveData = "";
  Future<bool> connectDevice(String macBluetooth) async {
    try {
      _bluetoothDevice = BluetoothDevice(
        remoteId: DeviceIdentifier(macBluetooth),
      );

      await _bluetoothDevice!.connect();
      Future.delayed(const Duration(seconds: 15));

      if (_bluetoothDevice!.isConnected) {
        await _bluetoothDevice!.discoverServices();
        await _bluetoothDevice!.requestConnectionPriority(
          connectionPriorityRequest: ConnectionPriority.high,
        );
        await _characteristicRX.setNotifyValue(true);
      }
      if (_bluetoothDevice!.isConnected) {
        listenerBle();
      }
      return _bluetoothDevice!.isConnected;
    } catch (e) {
      return false;
    }
  }

  Future<String> transmitCommand(String command) async {
    log("->receive data $receiveData");
    int mtu = 60;
    List<int> bytes = [];
    //fazer for para o comando grande
    command += "\r\n";
    if (command.length < mtu) {
      for (int byte in command.codeUnits) {
        bytes.add(byte.toSigned(8));
      }
      print("--->> enviar command $command");
      await _characteristicTX.write(bytes, withoutResponse: true);
      bytes.clear();
    } else {
      for (int i = 0; i < command.length; i += mtu) {
        //pega o proximo bloco até o limite mtu
        int fim = (i + mtu < command.length) ? i + mtu : command.length;
        String bloco = command.substring(i, fim);

        for (int byte in bloco.codeUnits) {
          bytes.add(byte.toSigned(8));
        }

        await _characteristicTX.write(bytes, withoutResponse: true);
        bytes.clear();
      }
    }

    String retornoComando = await receiveCommandBle(15);
    receiveData = "";
    return retornoComando;
  }

  Future<String> receiveCommandBle(int timeoutResp) async {
    final timeout = Duration(seconds: timeoutResp);
    final stopwatch = Stopwatch()..start();
    String data = "";
    while (stopwatch.elapsed < timeout) {
      data = receiveData;
      //evite que junte dois comandos no stream

      if (data.contains('\r\n')) {
        stopwatch.stop();
        data = data.split('\r\n').first;
        return data;
      }

      if ((timeout - stopwatch.elapsed).isNegative) {
        break;
      }

      await Future.delayed(const Duration(milliseconds: 500));
    }
    receiveData = "";
    return data;
  }

  Stream<String> get rx => _characteristicRX.lastValueStream
      .map<String>(
        (event) => String.fromCharCodes(event), //transformar em String
      )
      .asBroadcastStream();

  Stream<String> get tx => _characteristicTX.lastValueStream
      .map<String>((event) => String.fromCharCodes(event))
      .asBroadcastStream();

  BluetoothCharacteristic get _characteristicRX =>
      _service.characteristics.singleWhere((element) {
        return [
          BLEGUID.rx.value,
          BLEGUID.telitRX.value,
        ].any((uuid) => element.uuid.str.toUpperCase().contains(uuid));
      });

  BluetoothCharacteristic get _characteristicTX =>
      _service.characteristics.singleWhere(
        (element) => [
          BLEGUID.tx.value,
          BLEGUID.telitTX.value,
        ].any((uuid) => element.uuid.str.toUpperCase().contains(uuid)),
      );

  BluetoothService get _service =>
      _bluetoothDevice!.servicesList.singleWhere((element) {
        return [
          BLEGUID.service.value,
          BLEGUID.telitService.value,
        ].contains(element.uuid.str.toUpperCase());
      });
  bool isCompleted(String command) {
    return command.endsWith("\r\n");
  }

  Future<int> get getMtu async {
    if (Platform.isAndroid) {
      int mtu = await _bluetoothDevice!.requestMtu(512);
      return mtu;
    }
    if (Platform.isIOS) {
      return _bluetoothDevice!.mtu.first;
    }
    return 0;
  }

  Future<BluetoothConnectionState> getConnectionState() {
    return _bluetoothDevice!.connectionState.first;
  }

  //escutar retornos do hw
  listenerBle() {
    rx.listen((event) {
      receiveData += event;
         print('\x1B[32m$receiveData\x1B[0m');
      print('\x1B[31m${receiveData.codeUnits}\x1B[0m');
    });
  }

  Future<void> disconnect() async {
    receiveData = "";
    await _bluetoothDevice!.disconnect();
  }
}
