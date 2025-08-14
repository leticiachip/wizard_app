import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wizard_app/app/data/services/atualizador_esp/atualizador_esp_service.dart';
import 'package:wizard_app/core/extensions/extension_string.dart';
import 'package:wizard_app/core/utils/command.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';

import '../../../../core/exceptions_app/model/exception_app.dart';

import '../../../../core/utils/result.dart';
import '../../../data/services/atualizador_esp/enum_validacao_modo_scape.dart'
    show EnumValidacaoModoScape;
import '../../../data/utils/enum_estado_atualizacao_esp.dart';
import '../../../domain/models/atualizacao/carga_atualizacao.dart';

class AtualizadorViewModel extends ChangeNotifier {
  final AtualizadorEspService atualizadorEspService;
  late Command1 buscarPermissao;

  AtualizadorViewModel({required this.atualizadorEspService}) {
    buscarPermissao = Command1<void, String>(iniciarAtualizacao);
  }
  final sharedPreferences = getIt<SharedPreferences>();
  CargaAtualizacao? get cargaAtualizacao => _cargaAtualizacao;
  CargaAtualizacao? _cargaAtualizacao;

  ExceptionApp get exception => _exceptionApp;
  late ExceptionApp _exceptionApp;

  EstadoAtualizacao get estadoAtualizacao => _estadoAtualizacao;
  late EstadoAtualizacao _estadoAtualizacao = EstadoAtualizacao.nenhum;

  int get porcentagem => _porcentagem;
  int _porcentagem = 0;

  bool get estadoConexao => _bluetoothConectado;
  bool _bluetoothConectado = false;

  EnumValidacaoModoScape get enumExitModoSceape => _enumExitModoScape;
  late EnumValidacaoModoScape _enumExitModoScape;

  double novaVersao = 0.0;

  Future<Result<CargaAtualizacao?, ExceptionApp>> iniciarAtualizacao(
    String enderecoMac,
  ) async {
    _bluetoothConectado = await atualizadorEspService.bluetoothAppService
        .obterStatusConexao();
    notifyListeners();
    if (!_bluetoothConectado) {
      return Failure(
        ExceptionApp(
          descricao: "Deconectado",
          detalhes: 'O bluetooth esta desconectado',
        ),
      );
    }
    //verifica modo scope
    EnumValidacaoModoScape retornoModoScope = await atualizadorEspService
        .validarModoScape();
    _enumExitModoScape = retornoModoScope;
    notifyListeners();

    if (retornoModoScope == EnumValidacaoModoScape.modoScape) {
      bool sairModoScape = await atualizadorEspService.validarComando(
        "AT+EXIT_SCAPE_MODE",
      );
      if (!sairModoScape) {
        return Failure(
          ExceptionApp(
            descricao: "Deconectado",
            detalhes: 'O bluetooth esta desconectado',
          ),
        );
      }
    }
    if (retornoModoScope == EnumValidacaoModoScape.semRetorno) {
      notifyListeners();
      return Failure(
        ExceptionApp(
          descricao: "Falha ao receber resposta",
          detalhes: 'A resposta do comando para sair do scape mode esta vazio',
        ),
      );
    }

    String versaoHw = await buscarSerial();
    Result<CargaAtualizacao?, ExceptionApp> permissaoCarga =
        await atualizadorEspService.buscarCargaRemoto(versaoHw, enderecoMac);

    if (permissaoCarga.isError) {
      _exceptionApp = permissaoCarga.exceptionOrNull()!;
    }
    _cargaAtualizacao = permissaoCarga.getOrNull()!;

    double novaVersao = await buscarVersaoEsp();
    if (_cargaAtualizacao!.versao == novaVersao) {
      _estadoAtualizacao = EstadoAtualizacao.atualizacaoCompleta;
      notifyListeners();
      return permissaoCarga;
    }
    if (_cargaAtualizacao != null) {
      await atualizar(enderecoMac);
    }
    if (_cargaAtualizacao!.versao == novaVersao) {
      print("atualizacao completa");
    }
    Result<Map<String, dynamic>, ExceptionApp> retornoAtualizacao =
        await atualizadorEspService.enviarRetornoAtualizacao(
          _cargaAtualizacao!.id!,
          "$novaVersao",
          sharedPreferences.getString('respEndUpdate')!,
        );
    if (retornoAtualizacao.isError) {
      return Failure(retornoAtualizacao.exceptionOrNull()!);
    }
    return permissaoCarga;
  }

  Future<void> atualizar(String endereco) async {
    _estadoAtualizacao = EstadoAtualizacao.modoScape;
    notifyListeners();
    bool entraModoScape = await atualizadorEspService.validarComando(
      "AT+DEVICE_SCAPE_MODE",
    );
    if (!entraModoScape) {
      return;
    }

    bool iniciaAtualizacao = await atualizadorEspService.validarComando(
      "AT+BEGIN_UPDATE_FLASH",
    );
    _estadoAtualizacao = EstadoAtualizacao.iniciaAtualizacao;
    //não foi possivel iniciar atualização
    if (!iniciaAtualizacao) {
      return;
    }
    _estadoAtualizacao = EstadoAtualizacao.envioCarga;
    notifyListeners();

    //inicia o envio do arquivo
    List<List<String>> linhasAgrupadas = atualizadorEspService
        .dividirArquivoPorLinhas(_cargaAtualizacao!.carga, 62);

    for (int i = 0; i < 2; i++) {
      bool situacaoBluetooth = await atualizadorEspService.bluetoothAppService
          .obterStatusConexao();
      if (!situacaoBluetooth) {
        _bluetoothConectado = false;
        return;
      }
      double porcentagem = ((i + 1) / linhasAgrupadas.length) * 100;
      _porcentagem = porcentagem.round();
      notifyListeners();

      bool resposta = await atualizadorEspService.validarComando(
        'AT+WRITE_UPDATE_FLASH=${linhasAgrupadas[i].join().replaceAll('\r', '').replaceAll('\n', '')}',
      );
      if (!resposta) {
        return;
      }
    }

    _estadoAtualizacao = EstadoAtualizacao.sairScapeMode;
    String resposta = await atualizadorEspService.enviarComando(
      "AT+END_UPDATE_FLASH",
    );
    await sharedPreferences.setString('respEndUpdate', resposta);

    notifyListeners();
    bool sairModoScape = await atualizadorEspService.validarComando(
      "AT+EXIT_SCAPE_MODE",
    );
    if (!sairModoScape) {
      return;
    }
    _estadoAtualizacao = EstadoAtualizacao.resetPlaca;
    notifyListeners();
    bool resetPlaca = await atualizadorEspService.validarComando(
      "AT+APP_RESET:00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
    );
    if (!resetPlaca) {
      return;
    }

    await Future.delayed(const Duration(seconds: 5));
    _bluetoothConectado = await atualizadorEspService.bluetoothAppService
        .obterStatusConexao();
    int qtdTentativas = 0;
    while (!_bluetoothConectado || qtdTentativas < 3) {
      print("---->> tentou conectar");
      await atualizadorEspService.bluetoothAppService.conectar(endereco);
      _bluetoothConectado = await atualizadorEspService.bluetoothAppService
          .obterStatusConexao();
      qtdTentativas++;
    }
    _bluetoothConectado = await atualizadorEspService.bluetoothAppService
        .obterStatusConexao();

    novaVersao = await buscarVersaoEsp();
    notifyListeners();

    return;
  }

  Future<String> buscarSerial() async {
    String resposta = await atualizadorEspService.enviarComando(
      "AT+GET_INFO:AA",
    );
    if (resposta.contains('AT+GET_INFO:AA')) {
      return '';
    }
    String versao = int.parse(resposta.substring(20, 28), radix: 16).toString();
    return versao;
  }

  Future<double> buscarVersaoEsp() async {
    String resposta = await atualizadorEspService.enviarComando(
      "AT+DEVICE_VERSION",
    );
    print("---->> resposta vesrsao $resposta");
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
