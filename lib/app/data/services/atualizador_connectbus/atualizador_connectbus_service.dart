import 'package:wizard_app/core/utils/result.dart';

import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../domain/models/atualizacao_connect/atualizacao_connect.dart';

abstract class AtualizadorConnectbusService {
  Future<bool> reconectarBluetooth(String endereco);
  Future<String> enviarComando(String comando);
  Future<Result<CargaConnect, ExceptionApp>> buscarCargaConnect();
  Future<void> desconectarBluetooth();
}
