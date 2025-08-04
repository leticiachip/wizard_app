//import 'package:bluetooth_lib/bluetooth_lib.dart';
import 'package:flutter/material.dart';

import '../../../data/services/bluetooth/bluetooth_service.dart'
    show BluetoothBleService;

class ConectarBleViewModel extends ChangeNotifier {
  final BluetoothBleService bluetoothBleService;
  ConectarBleViewModel({required this.bluetoothBleService});
  bool _bluetoothConectado = false;
  bool get bluetoothConectado => _bluetoothConectado;
  bool _carregandoConexao = false;
  bool get carregandoConexao => _carregandoConexao;
  conectarEquipamento(String device) async {
    try {
      int tentativasConexao = 0;
      _carregandoConexao = true;
      notifyListeners();
      while (tentativasConexao <= 3 || _bluetoothConectado) {
        if (_bluetoothConectado) {
          notifyListeners();
          return;
        }
        bool conectado = await bluetoothBleService.conectar(device);
        if (conectado) {
          _bluetoothConectado = conectado;
          notifyListeners();
        }
        tentativasConexao++;
      }
    } finally {
      _carregandoConexao = false;

      notifyListeners();
    }
  }

  transmitirComando(String mac) async {}

  escutarRetornos() {
    //bluetoothSerialService.startListenerRX();
  }
}
