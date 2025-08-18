import 'dart:async';
import 'package:flutter_blue_classic/flutter_blue_classic.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';
import 'package:wizard_app/app/data/utils/estado_conexao_bluetooth.dart';
import 'package:wizard_app/app/domain/models/bluetooth/devices.dart';
import 'package:wizard_app/core/const/codigo_rastreio.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/result.dart';

class BluetoothClassicService implements BluetoothAppService {
  late BluetoothConnection? bluetoothConnection;
  final blueClassic = FlutterBlueClassic(usesFineLocation: true);

  List<Devices> devicesEncontrados = [];
  String dados = "";
  @override
  Future<bool> conectar(String mac) async {
    try {
      bluetoothConnection = await blueClassic.connect(mac);
      if (bluetoothConnection == null) {
        return false;
      }
      if (bluetoothConnection!.isConnected) {
        bluetoothConnection!.input!.listen((event) {
          dados += String.fromCharCodes(event);
        });
      }

      return bluetoothConnection!.isConnected;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<EstadoConexaoBluetooth> obterStatusConexao() async {
    try {
      if (bluetoothConnection == null) {
        return EstadoConexaoBluetooth.desconectado;
      }
      if (!bluetoothConnection!.isConnected) {
        return EstadoConexaoBluetooth.desconectado;
      }
      return EstadoConexaoBluetooth.conectado;
    } catch (e) {
      return EstadoConexaoBluetooth.desconectado;
    }
  }

  @override
  Future<String> transmitirComando(String comando) async {
    dados = "";
    if (bluetoothConnection == null) {
      return '';
    }
    print("-> comando $comando");
    bluetoothConnection!.writeString("$comando\r\n");
    String dadosRecebidos = await receiveData(5);
    return dadosRecebidos;
  }

  @override
  Future<void> desconectar() async {
    if (bluetoothConnection != null) {
      bluetoothConnection!.dispose();
    }
  }

  @override
  Future<Result<List<Devices>, ExceptionApp>> scan() async {
    blueClassic.startScan();
    try {
      blueClassic.scanResults.listen((devices) {
        BluetoothDevice device = devices;

        if (!devicesEncontrados.contains(
          Devices(nome: device.name, mac: devices.address),
        )) {
          if (device.name != null) {
            devicesEncontrados.add(
              Devices(nome: device.name, mac: devices.address),
            );
          }
        }
      });
      await Future.delayed(const Duration(seconds: 3));

      return Success(devicesEncontrados);
    } catch (e) {
      return Failure(
        ExceptionApp(
          detalhes: "$e",
          descricao: "Não foi possível scanear",
          rastreio: '$CodigoRastreio.1',
        ),
      );
    }
  }

  @override
  void stopScan() {
    blueClassic.stopScan();
  }

  Future<String> receiveData(int timeoutResp) async {
    final timeout = Duration(seconds: timeoutResp);
    final stopwatch = Stopwatch()..start();
    String data = "";
    while (stopwatch.elapsed < timeout) {
      String contemDadosAlemFim = dados.replaceAll('\r\n', "");
      data = contemDadosAlemFim;

      if (contemDadosAlemFim.isNotEmpty) {
        stopwatch.stop();
        break;
      }
      if ((timeout - stopwatch.elapsed).isNegative) {
        break;
      }

      await Future.delayed(const Duration(milliseconds: 500));
    }
    dados = "";
    return data;
  }
}
