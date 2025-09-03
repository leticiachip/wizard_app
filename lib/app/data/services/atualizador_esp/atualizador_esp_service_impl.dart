import 'dart:io';

import 'package:wizard_app/core/extensions/extension_string.dart';

import '../../../../core/exceptions_app/model/exception_app.dart'
    show ExceptionApp;
import '../../../../core/utils/result.dart';
import '../../../adapter/gerenciador_arquivos_adapter.dart';
import '../../../domain/models/atualizacao/carga_atualizacao.dart';
import '../../repositories/atualizador_esp/atualizador_esp_repository.dart';
import '../../utils/estado_conexao_bluetooth.dart';
import '../bluetooth/bluetooth_service.dart';
import 'atualizador_esp_service.dart';
import 'enum_validacao_modo_scape.dart';

class AtualizadorEspServiceImpl implements AtualizadorEspService {
  final BluetoothAppService bluetoothAppService;
  final AtualizadorEspRepository atualizadorEspRepository;
  AtualizadorEspServiceImpl({
    required this.bluetoothAppService,
    required this.atualizadorEspRepository,
  });
  final _gerenciadorArquivosAdapter = GerenciadorArquivosAdapter();

  @override
  Future<Result<CargaAtualizacao?, ExceptionApp>> buscarCargaRemoto(
    String serial,
    String mac,
  ) async {
    Result<Map<String, dynamic>?, ExceptionApp> resultado =
        await atualizadorEspRepository.buscarPermissaoAtualizacao(serial, mac);
    if (resultado.isError) {
      return Failure(resultado.exceptionOrNull()!);
    }
    if (resultado.getOrNull() == null) {
      return Success(null);
    }
    Map<String, dynamic> body = resultado.getOrNull()!;
    List<String> lista = body['carga'].trim().split('\n');

    CargaAtualizacao cargaAtualizacao = CargaAtualizacao(
      id: body['id'],
      versao: body['versao'],
      carga: lista,
    );
    return Success(cargaAtualizacao);
  }

  @override
  Future<Result<Map<String, dynamic>, ExceptionApp>> enviarRetornoAtualizacao(
    int id,
    String versao,
    String status,
  ) async {
    Result<Map<String, dynamic>, ExceptionApp> retorno =
        await atualizadorEspRepository.enviarResultadoAtualizacao(
          id,
          versao,
          status,
        );
    return retorno;
  }

  @override
  Future<List<String>> buscarCargaLocal() async {
    File? file = await _gerenciadorArquivosAdapter.abrirArquivo();
    if (file != null) {
      return file.readAsLinesSync().toList();
    }
    return [];
  }

  @override
  Future<EnumValidacaoModoScape> validarModoScape() async {
    EstadoConexaoBluetooth estadoBt = await bluetoothAppService
        .obterStatusConexao();
    if (estadoBt == EstadoConexaoBluetooth.desconectado) {
      return EnumValidacaoModoScape.nenhum;
    }
    String resposta = await bluetoothAppService.transmitirComando(
      'AT+GET_INFO:AA',
    );

    if (resposta.isEmpty) {
      return EnumValidacaoModoScape.semRetorno;
    }

    //se retornou erro quer dizer que esta no modo scape
    if (resposta.contains('ER')) {
      return EnumValidacaoModoScape.modoScape;
    }

    return EnumValidacaoModoScape.prosseguir;
  }

  //QUEBRA O ARQUIVO EM DETERMINADA QUANTIDADE DE LINHAS
  @override
  List<List<String>> dividirArquivoPorLinhas(
    List<String> linhas,
    int qtdLinhaPorGrupo,
  ) {
    List<List<String>> linhasAgrupadas = [];
    for (int i = 0; i < linhas.length; i += qtdLinhaPorGrupo) {
      int end = i + qtdLinhaPorGrupo;
      List<String> group = linhas.sublist(
        i,
        end > linhas.length ? linhas.length : end,
      );
      linhasAgrupadas.add(group);
    }
    return linhasAgrupadas;
  }

  @override
  Future<bool> validarComando(String comando) async {
    EstadoConexaoBluetooth estadoBt = await bluetoothAppService
        .obterStatusConexao();
    if (estadoBt == EstadoConexaoBluetooth.desconectado) {
      return false;
    }
    String iniciarAtualizacao = await bluetoothAppService.transmitirComando(
      comando,
    );
    if (iniciarAtualizacao.contains('ER')) {
      return false;
    }
    return true;
  }

  @override
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

  @override
  Future<String> buscarSerial() async {
    EstadoConexaoBluetooth estadoBt = await bluetoothAppService
        .obterStatusConexao();
    if (estadoBt == EstadoConexaoBluetooth.desconectado) {
      return '';
    }
    String resposta = await enviarComando("AT+GET_INFO:AA");

    if (resposta.isEmpty) {
      return '';
    }
    String versao = int.parse(resposta.substring(20, 28), radix: 16).toString();
    return versao;
  }

  @override
  Future<double> buscarVersaoEsp() async {
    String resposta = await enviarComando("AT+DEVICE_VERSION");
    if (resposta.isEmpty) {
      return 0.0;
    }
    String replaceVersao = resposta
        .replaceAll('AT+DEVICE_VERSION:00', '')
        .replaceAll('\r\n', "");
    double versao = double.parse(replaceVersao.hexToAscii());
    return versao;
  }
}
