import 'package:flutter/material.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';
import 'package:wizard_app/app/domain/models/bluetooth/devices.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/command.dart';
import 'package:wizard_app/core/utils/result.dart';

class ScanViewModel extends ChangeNotifier {
  final BluetoothAppService bluetoothAppService;
  late Command0 scan;
  ScanViewModel({required this.bluetoothAppService}) {
    scan = Command0<void>(scanear);
  }
  List<Devices> get dispositivos => _dispositivosEncontrados;
  final List<Devices> _dispositivosEncontrados = [];
  ExceptionApp get exception => _exceptionApp;
  late ExceptionApp _exceptionApp;

  Future<Result> scanear() async {
    Result<List<Devices>, ExceptionApp> result = await bluetoothAppService
        .scan();
    if (result.isSuccess) {
      List<Devices> devices = result.getOrNull()!;
      _dispositivosEncontrados.addAll(devices);
    }
    if (result.isError) {
      _exceptionApp = result.exceptionOrNull()!;
    }

    notifyListeners();
    return Success(_dispositivosEncontrados);
  }

  stopScan(){
    bluetoothAppService.stopScan();
  }
}
