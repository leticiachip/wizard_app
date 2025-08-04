abstract class BluetoothBleService {
  Future<bool> conectar(String mac);
  Future<String> transmitirComandoBle(String comando);
  Future<bool> obterStatusConexao();
}
