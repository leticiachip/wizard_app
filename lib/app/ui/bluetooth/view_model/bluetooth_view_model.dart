//import 'package:bluetooth_lib/bluetooth_lib.dart';
import 'package:flutter/material.dart';

import '../../../data/services/bluetooth/bluetooth_service.dart'
    show BluetoothAppService;

class BluetoothViewModel extends ChangeNotifier {
  final BluetoothAppService bluetoothBleService;
  BluetoothViewModel({required this.bluetoothBleService});
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
      _bluetoothConectado = false;
      notifyListeners();
    }
  }
}
