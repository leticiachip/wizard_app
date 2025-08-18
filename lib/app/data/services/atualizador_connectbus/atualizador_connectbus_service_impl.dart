import '../../utils/estado_conexao_bluetooth.dart';
import '../bluetooth/bluetooth_service.dart';
import 'atualizador_connectbus_service.dart';

class AtualizadorConnectBusServiceImpl implements AtualizadorConnectbusService {
  final BluetoothAppService bluetoothAppService;
  AtualizadorConnectBusServiceImpl({required this.bluetoothAppService});

  Future<String> enviarComando(String comando) async {
    EstadoConexaoBluetooth estadoBt = await bluetoothAppService
        .obterStatusConexao();
    if (estadoBt == EstadoConexaoBluetooth.desconectado) {
      return "";
    }
    String respostaComando = await bluetoothAppService.transmitirComando(
      comando,
    );
    return respostaComando;
  }
}
