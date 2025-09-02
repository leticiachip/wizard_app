import 'package:flutter/material.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';
import 'package:wizard_app/app/domain/models/bluetooth/devices.dart';
import 'package:wizard_app/core/const/codigo_rastreio.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/services/permission_services/permission_handler_service.dart';
import 'package:wizard_app/core/utils/command.dart';
import 'package:wizard_app/core/utils/result.dart';

class ScanViewModel extends ChangeNotifier {
  final PermissionHandlerService permissionHandlerService;
  final BluetoothAppService bluetoothAppService;
  late Command0 scan;
  ScanViewModel({
    required this.bluetoothAppService,
    required this.permissionHandlerService,
  }) {
    scan = Command0<void>(scanear);
  }

  bool get permissaoBluetoothHabilitada => _permissaoBluetoothHabilitada;
  bool _permissaoBluetoothHabilitada = false;
  bool get permissaoLocalizacaoHabilitada => _permissaoLocalizacaoHabilitada;
  bool _permissaoLocalizacaoHabilitada = false;
  List<Devices> get dispositivos => _dispositivosEncontrados;
  List<Devices> _dispositivosEncontrados = [];
  List<Devices> todosDispositivosEncontrados = [];
  ExceptionApp get exception => _exceptionApp;
  late ExceptionApp _exceptionApp;

  Future<Result> scanear() async {
    bool permissaoLocalizacaoHabilitada = await permissionHandlerService
        .permissaoLocalizacaoPrimeiroPlano();
    _permissaoLocalizacaoHabilitada = permissaoLocalizacaoHabilitada;
    notifyListeners();
    if (!permissaoLocalizacaoHabilitada) {
      return Failure(
        ExceptionApp(
          descricao: "O usuario não aceitou a permissao de localizacao",
          detalhes: "Permissão de localização negada",
          rastreio: CodigoRastreio.permissoes,
        ),
      );
    }

    bool permissaoBluetoothHabilitada = await permissionHandlerService
        .permissaBluetooth();
    print(
      "--------------->>> permissaoBluetoothHabilitada $permissaoBluetoothHabilitada",
    );
    _permissaoBluetoothHabilitada = permissaoBluetoothHabilitada;
    notifyListeners();
    if (!permissaoBluetoothHabilitada) {
      return Failure(
        ExceptionApp(
          descricao:
              "O usuario não aceitou a permissao de dispositivo por perto",
          detalhes: "Permissão de dispositivo por perto negada",
          rastreio: CodigoRastreio.permissoes,
        ),
      );
    }
    _dispositivosEncontrados.clear();
    Result<List<Devices>, ExceptionApp> result = await bluetoothAppService
        .scan();
    if (result.isSuccess) {
      List<Devices> devices = result.getOrNull()!;
      //ordernar sempre os com o nome CB no topo
      devices.sort((a, b) {
        bool aComecaCB = a.nome!.startsWith('CB');
        bool bComecaCB = b.nome!.startsWith('CB');
        if (aComecaCB && !bComecaCB) {
          return -1;
        } else if (!aComecaCB && bComecaCB) {
          return 1;
        } else {
          return a.nome!.compareTo(a.nome!);
        }
      });
      _dispositivosEncontrados.addAll(devices);
      todosDispositivosEncontrados = _dispositivosEncontrados;
    }
    if (result.isError) {
      _exceptionApp = result.exceptionOrNull()!;
    }

    notifyListeners();
    return Success(_dispositivosEncontrados);
  }

  stopScan() {
    bluetoothAppService.stopScan();
  }

  void filtrarDevices(String filtro) {
    List<Devices> resultadoFiltro = todosDispositivosEncontrados
        .where((element) => element.nome!.contains(filtro.toUpperCase()))
        .toList();
    _dispositivosEncontrados = resultadoFiltro;
    notifyListeners();
    return;
  }

  limparFiltro() {
    _dispositivosEncontrados = todosDispositivosEncontrados;
    notifyListeners();
  }
}
