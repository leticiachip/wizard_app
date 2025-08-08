import 'package:flutter_blue_classic/flutter_blue_classic.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';

class BluetoothSerialService implements BluetoothAppService {
  late BluetoothConnection? bluetoothConnection;
  String dados = "";
  @override
  Future<bool> conectar(String mac) async {
    final blueClassic = FlutterBlueClassic(usesFineLocation: true);
    bluetoothConnection = await blueClassic.connect(mac);
    if (bluetoothConnection == null) {
      return false;
    }
    if (bluetoothConnection!.isConnected) {
      bluetoothConnection!.input!.listen((event) {
        dados += String.fromCharCodes(event);
      });
    }

    dados = "";
    return bluetoothConnection!.isConnected;
  }

  @override
  Future<bool> obterStatusConexao() async {
    if (bluetoothConnection == null) {
      return false;
    }
    return bluetoothConnection!.isConnected;
  }

  @override
  Future<String> transmitirComando(String comando) async {
    if (bluetoothConnection == null) {
      return '';
    }
    bluetoothConnection!.writeString(comando);
    await Future.delayed(const Duration(seconds: 1));
    return dados;
  }

  @override
  Future<void> desconectar() async {
    if (bluetoothConnection != null) {
      bluetoothConnection!.dispose();
    }
  }
}
