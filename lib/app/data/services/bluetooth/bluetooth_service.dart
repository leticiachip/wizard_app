import 'package:wizard_app/app/domain/models/bluetooth/devices.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/result.dart';

abstract class BluetoothAppService {
  Future<bool> conectar(String mac);
  Future<String> transmitirComando(String comando);
  Future<bool> obterStatusConexao();
  Future<void> desconectar();
  Future<Result<List<Devices>, ExceptionApp>> scan();
  void stopScan();
}
