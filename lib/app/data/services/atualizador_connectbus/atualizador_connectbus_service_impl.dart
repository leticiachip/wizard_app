import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/utils/result.dart';
import '../../../domain/models/atualizacao_connect/atualizacao_connect.dart';
import '../../repositories/atualizador_connectbus/atualizador_connectbus_repository.dart';
import '../../utils/estado_conexao_bluetooth.dart';
import '../bluetooth/bluetooth_service.dart';
import 'atualizador_connectbus_service.dart';

class AtualizadorConnectBusServiceImpl implements AtualizadorConnectbusService {
  final BluetoothAppService bluetoothAppService;
  final AtualizadorConnectbusRepository atualizadorConnectbusRepository;
  AtualizadorConnectBusServiceImpl({
    required this.bluetoothAppService,
    required this.atualizadorConnectbusRepository,
  });
  @override
  Future<String> enviarComando(String comando) async {
    try {
      EstadoConexaoBluetooth estadoBt = await bluetoothAppService
          .obterStatusConexao();
      if (estadoBt == EstadoConexaoBluetooth.desconectado) {
        return "";
      }
      String respostaComando = await bluetoothAppService.transmitirComando(
        comando,
      );

      return respostaComando;
    } catch (e) {
      return "";
    }
  }

  @override
  Future<bool> reconectarBluetooth(String enderecoMac) async {
    EstadoConexaoBluetooth statusBluetooth = await bluetoothAppService
        .obterStatusConexao();
    if (statusBluetooth == EstadoConexaoBluetooth.conectado) {
      return true;
    }
    bool conectado = await bluetoothAppService.conectar(enderecoMac);
    return conectado;
  }

  @override
  Future<Result<CargaConnect, ExceptionApp>> buscarCargaConnect() async {
    Result<Map<String, dynamic>?, ExceptionApp> resultAtualizador =
        await atualizadorConnectbusRepository.buscarCarga();
    if (resultAtualizador.isError) {
      return Failure(resultAtualizador.exceptionOrNull()!);
    }
    Map<String, dynamic> carga = resultAtualizador.getOrNull()!;

    CargaConnect cargaConnect = CargaConnect(
      id: carga['id'],
      arquivo: carga['srec'],
    );

    return Success(cargaConnect);
  }

  @override
  Future<void> desconectarBluetooth() async {
    bluetoothAppService.desconectar();
  }
}
