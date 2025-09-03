import 'package:flutter/foundation.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';
import 'package:wizard_app/core/utils/result.dart';
import '../../../../core/const/codigo_rastreio.dart';
import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/utils/command.dart';
import '../../../data/services/atualizador_esp/atualizador_esp_service.dart';
import '../../../data/services/atualizador_esp/enum_validacao_modo_scape.dart';
import '../../../data/services/configuracoes_iniciais/configuracoes_iniciais_service.dart';
import '../../../data/utils/estado_conexao_bluetooth.dart';
import '../../../domain/models/atualizacao/carga_atualizacao.dart';

class ConfiguracoesIniciaisViewModel extends ChangeNotifier {
  final ConfiguracoesIniciaisService configuracoesIniciaisService;
  final AtualizadorEspService atualizadorEspService;
  final BluetoothAppService bluetoothAppService;
  late Command1<void, String> buscarConfiguracoesIniciasCommand;
  ConfiguracoesIniciaisViewModel({
    required this.configuracoesIniciaisService,
    required this.atualizadorEspService,
    required this.bluetoothAppService,
  }) {
    buscarConfiguracoesIniciasCommand = Command1<void, String>(
      _iniciarConfiguracoesIniciais,
    );
  }
  ExceptionApp get exceptionApp => _exceptionApp;
  late ExceptionApp _exceptionApp;
  bool get atualizacaoEspHabilitado => _atualizacaoEspHabilitado;
  bool _atualizacaoEspHabilitado = false;

  Future<Result<bool, ExceptionApp>> _iniciarConfiguracoesIniciais(
    String mac,
  ) async {
    Result<bool, ExceptionApp> resultadoConfiguracao =
        await configuracoesIniciaisService.iniciarConfiguracao();
    if (resultadoConfiguracao.isError) {
      _exceptionApp = resultadoConfiguracao.exceptionOrNull()!;
      notifyListeners();
      return Failure(_exceptionApp);
    }
    bool sucessoConfiguracao = resultadoConfiguracao.getOrNull()!;
    if (!sucessoConfiguracao) {
      return Success(sucessoConfiguracao);
    }
    await bluetoothAppService.conectar(mac);
    await Future.delayed(const Duration(seconds: 3));
    EstadoConexaoBluetooth estadoConexao = await bluetoothAppService
        .obterStatusConexao();

    if (estadoConexao == EstadoConexaoBluetooth.conectado) {
      //testar se esta em modo scape
      EnumValidacaoModoScape retornoModoScope = await atualizadorEspService
          .validarModoScape();

      //sai do modo scope se estiver
      if (retornoModoScope == EnumValidacaoModoScape.modoScape) {
        bool sairModoScape = await atualizadorEspService.validarComando(
          "AT+EXIT_SCAPE_MODE",
        );
        if (!sairModoScape) {
          _exceptionApp = ExceptionApp(
            descricao: "Falha",
            detalhes: 'Não foi possivel sair do modo scope',
            rastreio: "${CodigoRastreio.configuracoesInicias}.01",
          );
          notifyListeners();
          return Failure(_exceptionApp);
        }
      }
      String resultadoSerial = await atualizadorEspService.buscarSerial();
      if (resultadoSerial.isEmpty) {
        _atualizacaoEspHabilitado = false;
        notifyListeners();
        return Success(true);
      }
      Result<CargaAtualizacao?, ExceptionApp> permissaoCarga =
          await atualizadorEspService.buscarCargaRemoto(resultadoSerial, mac);
      if (permissaoCarga.isError) {
        _exceptionApp = resultadoConfiguracao.exceptionOrNull()!;
        notifyListeners();
        return Failure(_exceptionApp);
      }

      CargaAtualizacao? resultadoAtualizacao = permissaoCarga.getOrNull();
      if (resultadoAtualizacao == null) {
        _atualizacaoEspHabilitado = false;
        notifyListeners();
        return Success(true);
      }
      //verifica se a versão atual do esp esta igual ao da rota
      double resultadoVersao = await atualizadorEspService.buscarVersaoEsp();

      if (resultadoVersao < resultadoAtualizacao.versao) {
        _atualizacaoEspHabilitado = true;
        notifyListeners();
      }
    }

    return Success(true);
  }
}
