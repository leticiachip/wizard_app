abstract class BluetoothAppService {
  Future<bool> conectar(String mac);
  Future<String> transmitirComando(String comando);
  Future<bool> obterStatusConexao();
  Future<void> desconectar();
}
