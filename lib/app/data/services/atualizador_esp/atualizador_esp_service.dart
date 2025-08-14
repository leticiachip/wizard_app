import 'dart:io';

import 'package:wizard_app/app/adapter/gerenciador_arquivos_adapter.dart';
import 'package:wizard_app/app/data/repositories/atualizador_esp/atualizador_esp_repository.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';
import 'package:wizard_app/app/domain/models/atualizacao/carga_atualizacao.dart';

import '../../../../core/exceptions_app/model/exception_app.dart'
    show ExceptionApp;
import '../../../../core/utils/result.dart';
import 'enum_validacao_modo_scape.dart' show EnumValidacaoModoScape;

class AtualizadorEspService {
  final BluetoothAppService bluetoothAppService;
  final AtualizadorEspRepository atualizadorEspRepository;
  AtualizadorEspService({
    required this.bluetoothAppService,
    required this.atualizadorEspRepository,
  });
  final _gerenciadorArquivosAdapter = GerenciadorArquivosAdapter();

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

  Future<List<String>> buscarCargaLocal() async {
    File? file = await _gerenciadorArquivosAdapter.abrirArquivo();
    if (file != null) {
      return file.readAsLinesSync().toList();
    }
    return [];
  }

  Future<EnumValidacaoModoScape> validarModoScape() async {
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

  Future<bool> validarComando(String comando) async {
    String iniciarAtualizacao = await bluetoothAppService.transmitirComando(
      comando,
    );
    if (iniciarAtualizacao.contains('ER')) {
      return false;
    }
    return true;
  }

  Future<String> enviarComando(String comando) async {
    String respostaComando = await bluetoothAppService.transmitirComando(
      comando,
    );
    return respostaComando;
  }
}
