import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wizard_app/app/data/services/atualizador_esp/atualizador_esp_service.dart';
import 'package:wizard_app/app/data/utils/estado_conexao_bluetooth.dart';
import 'package:wizard_app/core/const/codigo_rastreio.dart';
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

  EstadoConexaoBluetooth get estadoConexao => _bluetoothConectado;
  EstadoConexaoBluetooth _bluetoothConectado =
      EstadoConexaoBluetooth.desconectado;

  EnumValidacaoModoScape get enumExitModoSceape => _enumExitModoScape;
  late EnumValidacaoModoScape _enumExitModoScape;

  double novaVersao = 0.0;

  Future<Result<CargaAtualizacao?, ExceptionApp>> iniciarAtualizacao(
    String enderecoMac,
  ) async {
    _enumExitModoScape = EnumValidacaoModoScape.nenhum;
    _bluetoothConectado = await atualizadorEspService.bluetoothAppService
        .obterStatusConexao();
    notifyListeners();

    //tentar reconectar se não estiver conectado
    if (_bluetoothConectado == EstadoConexaoBluetooth.desconectado) {
      EstadoConexaoBluetooth estadoReconexao = await reconexao(enderecoMac);
      _bluetoothConectado = estadoReconexao;
      notifyListeners();
      if (estadoReconexao == EstadoConexaoBluetooth.desconectado) {
        return Failure(
          ExceptionApp(
            descricao: "Deconectado",
            detalhes: 'O bluetooth esta desconectado',
            rastreio: '${CodigoRastreio.atualizacaoESP}.atualizacaoESP',
          ),
        );
      }
    }
    //verifica modo scope
    EnumValidacaoModoScape retornoModoScope = await atualizadorEspService
        .validarModoScape();
    _enumExitModoScape = retornoModoScope;
    notifyListeners();
    //sai do modo scope se estiver
    if (retornoModoScope == EnumValidacaoModoScape.modoScape) {
      bool sairModoScape = await atualizadorEspService.validarComando(
        "AT+EXIT_SCAPE_MODE",
      );
      if (!sairModoScape) {
        _bluetoothConectado = await atualizadorEspService.bluetoothAppService
            .obterStatusConexao();
        notifyListeners();
        return Failure(
          ExceptionApp(
            descricao: "Falha",
            detalhes: 'Não foi possivel sair do modo scope',
            rastreio: "${CodigoRastreio.atualizacaoESP}.49",
          ),
        );
      }
    }
    if (retornoModoScope == EnumValidacaoModoScape.semRetorno) {
      _bluetoothConectado = await atualizadorEspService.bluetoothAppService
          .obterStatusConexao();

      notifyListeners();
      return Failure(
        ExceptionApp(
          descricao: "Falha ao receber resposta",
          detalhes: 'A resposta do comando para sair do scape mode esta vazio',
          rastreio: "${CodigoRastreio.atualizacaoESP}.50",
        ),
      );
    }

    String serial = await buscarSerial();
    if (serial.isEmpty) {
      _estadoAtualizacao = EstadoAtualizacao.falhaAtualizacao;
      return Failure(
        ExceptionApp(
          descricao: "Falha ao receber o serial",
          detalhes: 'O bluetooth não recebeu o serial',
          rastreio: '${CodigoRastreio.atualizacaoESP}.51',
        ),
      );
    }
    //busca a carga de atualizacao para o esp
    Result<CargaAtualizacao?, ExceptionApp> permissaoCarga =
        await atualizadorEspService.buscarCargaRemoto(serial, enderecoMac);

    if (permissaoCarga.isError) {
      _exceptionApp = permissaoCarga.exceptionOrNull()!;
      _bluetoothConectado = await atualizadorEspService.bluetoothAppService
          .obterStatusConexao();
      notifyListeners();
      return Failure(permissaoCarga.exceptionOrNull()!);
    }
    _cargaAtualizacao = permissaoCarga.getOrNull();
    if (_cargaAtualizacao == null) {
      return Success(null);
    }
    double novaVersao = await buscarVersaoEsp();
    log("---->> versao atual esp $novaVersao");
    bool confirmacaoEnviadaServidor =
        sharedPreferences.getBool("atualizacaoCompleta") ?? false;
    //atualizou mas não subiu para o servidor, tenta novamente
    if (_cargaAtualizacao!.versao == novaVersao &&
        !confirmacaoEnviadaServidor) {
      Result<Map<String, dynamic>, ExceptionApp> enviadoServidor =
          await confirmarAtualizacao(
            _cargaAtualizacao!.id!,
            "$novaVersao",
            sharedPreferences.getString('respEndUpdate') ?? "N/A",
          );
      if (enviadoServidor.isError) {
        _estadoAtualizacao = EstadoAtualizacao.falhaAtualizacao;
        notifyListeners();
        return permissaoCarga;
      }
      _estadoAtualizacao = EstadoAtualizacao.atualizacaoCompleta;
      await sharedPreferences.setBool("atualizacaoCompleta", true);
      notifyListeners();
    }
    if (_cargaAtualizacao != null) {
      Result<CargaAtualizacao?, ExceptionApp> resultAtualizacao =
          await atualizar(enderecoMac);
      if (resultAtualizacao.isError) {
        _estadoAtualizacao = EstadoAtualizacao.falhaAtualizacao;
        _exceptionApp = resultAtualizacao.exceptionOrNull()!;
        notifyListeners();
        return Failure(resultAtualizacao.exceptionOrNull()!);
      }
    }

    Result<Map<String, dynamic>, ExceptionApp> retornoAtualizacao =
        await atualizadorEspService.enviarRetornoAtualizacao(
          _cargaAtualizacao!.id!,
          "$novaVersao",
          sharedPreferences.getString('respEndUpdate')!,
        );
    if (retornoAtualizacao.isError) {
      _bluetoothConectado = await atualizadorEspService.bluetoothAppService
          .obterStatusConexao();
      notifyListeners();
      return Failure(retornoAtualizacao.exceptionOrNull()!);
    }
    return permissaoCarga;
  }

  Future<Result<CargaAtualizacao?, ExceptionApp>> atualizar(
    String endereco,
  ) async {
    _estadoAtualizacao = EstadoAtualizacao.modoScape;
    notifyListeners();
    String entraModoScape = await atualizadorEspService.enviarComando(
      "AT+DEVICE_SCAPE_MODE",
    );
    if (falhaReceberComando(entraModoScape)) {
      return Failure(
        ExceptionApp(
          descricao: "Não foi possivel entrar em modo scape ",
          detalhes: entraModoScape,
          rastreio: "${CodigoRastreio.atualizacaoESP}.54",
        ),
      );
    }

    String iniciaAtualizacao = await atualizadorEspService.enviarComando(
      "AT+BEGIN_UPDATE_FLASH",
    );
    _estadoAtualizacao = EstadoAtualizacao.iniciaAtualizacao;
    //não foi possivel iniciar atualização
    if (falhaReceberComando(iniciaAtualizacao)) {
      return Failure(
        ExceptionApp(
          descricao: "Não foi possivel entrar em modo scape ",
          detalhes: entraModoScape,
          rastreio: "${CodigoRastreio.atualizacaoESP}.58",
        ),
      );
    }
    _estadoAtualizacao = EstadoAtualizacao.envioCarga;
    notifyListeners();

    //inicia o envio do arquivo
    List<List<String>> linhasAgrupadas = atualizadorEspService
        .dividirArquivoPorLinhas(_cargaAtualizacao!.carga, 62);

    for (int i = 0; i < linhasAgrupadas.length; i++) {
      double porcentagem = ((i + 1) / linhasAgrupadas.length) * 100;
      _porcentagem = porcentagem.round();
      notifyListeners();

      String resposta = await atualizadorEspService.enviarComando(
        'AT+WRITE_UPDATE_FLASH=${linhasAgrupadas[i].join().replaceAll('\r', '').replaceAll('\n', '')}',
      );
      if (falhaReceberComando(resposta)) {
        return Failure(
          ExceptionApp(
            descricao: "Não foi possível enviar os comandos de atualização",
            detalhes: resposta,
            rastreio: "${CodigoRastreio.atualizacaoESP}.60",
          ),
        );
      }
    }

    _estadoAtualizacao = EstadoAtualizacao.sairScapeMode;
    notifyListeners();
    _bluetoothConectado = await atualizadorEspService.bluetoothAppService
        .obterStatusConexao();
    notifyListeners();
    String resposta = await atualizadorEspService.enviarComando(
      "AT+END_UPDATE_FLASH",
    );
    if (falhaReceberComando(resposta)) {
      return Failure(
        ExceptionApp(
          descricao: "Nao foi possivel finalizar a atualização",
          detalhes: resposta,
          rastreio: "${CodigoRastreio.atualizacaoESP}.56",
        ),
      );
    }
    _estadoAtualizacao = EstadoAtualizacao.sairScapeMode;
    notifyListeners();
    await sharedPreferences.setString('respEndUpdate', resposta);

    _estadoAtualizacao = EstadoAtualizacao.resetPlaca;
    notifyListeners();

    String sairModoScape = await atualizadorEspService.enviarComando(
      "AT+EXIT_SCAPE_MODE",
    );
    log("----->> resposta sair modo scape $sairModoScape");
    if (falhaReceberComando(sairModoScape)) {
      return Failure(
        ExceptionApp(
          descricao: "Nao foi possivel sair do modo scape",
          detalhes: resposta,
          rastreio: "${CodigoRastreio.atualizacaoESP}.57",
        ),
      );
    }

    String resetPlaca = await atualizadorEspService.enviarComando(
      "AT+APP_RESET:00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
    );
    if (!resetPlaca.contains('ER') && resetPlaca.isNotEmpty) {
      String resultado = resetPlaca.substring(
        resetPlaca.length - 4,
        resetPlaca.length,
      );
      return Failure(
        ExceptionApp(
          descricao: "Nao foi possivel sair do modo scape",
          detalhes: resposta,
          rastreio: "${CodigoRastreio.atualizacaoESP}.$resultado",
        ),
      );
    }

    await Future.delayed(const Duration(seconds: 5));
    _bluetoothConectado = await atualizadorEspService.bluetoothAppService
        .obterStatusConexao();
    int qtdTentativas = 0;
    _bluetoothConectado = EstadoConexaoBluetooth.tentandoConectar;
    notifyListeners();
    while (qtdTentativas < 3) {
      if (_bluetoothConectado == EstadoConexaoBluetooth.conectado) {
        break;
      }
      _bluetoothConectado = await reconexao(endereco);
      qtdTentativas++;
    }

    _bluetoothConectado = await atualizadorEspService.bluetoothAppService
        .obterStatusConexao();
    log("---->> estado bluetooth $_bluetoothConectado");
    notifyListeners();
    _estadoAtualizacao = EstadoAtualizacao.confirmandoAtualizacao;
    notifyListeners();

    if (novaVersao == 0.0) {
      return Failure(
        ExceptionApp(
          descricao: "Não foi possivel buscar a versao do esp",
          detalhes: resposta,
          rastreio: "${CodigoRastreio.atualizacaoESP}.61",
        ),
      );
    }

    await sharedPreferences.setBool("atualizacaoCompleta", false);
    String status = sharedPreferences.getString('respEndUpdate') ?? "N/A";
    Result<Map<String, dynamic>, ExceptionApp> retorno =
        await confirmarAtualizacao(
          _cargaAtualizacao!.id!,
          "$novaVersao",
          status,
        );
    notifyListeners();
    if (retorno.isError) {
      return Failure(
        ExceptionApp(
          descricao: "${retorno.exceptionOrNull()}",
          detalhes: resposta,
          rastreio: "${CodigoRastreio.atualizacaoESP}.62",
        ),
      );
    }
    novaVersao = await buscarVersaoEsp();
    if (novaVersao != _cargaAtualizacao!.versao) {
      _estadoAtualizacao = EstadoAtualizacao.falhaAtualizacao;
      return Failure(
        ExceptionApp(
          descricao: "A versao do esp esta diferente da desejada",
          detalhes: resposta,
          rastreio: "${CodigoRastreio.atualizacaoESP}.61",
        ),
      );
    }
    await sharedPreferences.setBool("atualizacaoCompleta", true);
    return Success(null);
  }

  Future<Result<Map<String, dynamic>, ExceptionApp>> confirmarAtualizacao(
    int id,
    String versao,
    String status,
  ) async {
    Result<Map<String, dynamic>, ExceptionApp> result =
        await atualizadorEspService.enviarRetornoAtualizacao(
          id,
          versao,
          status,
        );
    return result;
  }

  Future<String> buscarSerial() async {
    EstadoConexaoBluetooth estadoBt = await atualizadorEspService
        .bluetoothAppService
        .obterStatusConexao();
    if (estadoBt == EstadoConexaoBluetooth.desconectado) {
      return '';
    }
    String resposta = await atualizadorEspService.enviarComando(
      "AT+GET_INFO:AA",
    );

    if (resposta.isEmpty) {
      return '';
    }
    String versao = int.parse(resposta.substring(20, 28), radix: 16).toString();
    return versao;
  }

  Future<double> buscarVersaoEsp() async {
    String resposta = await atualizadorEspService.enviarComando(
      "AT+DEVICE_VERSION",
    );
    if (resposta.isEmpty) {
      return 0.0;
    }
    String replaceVersao = resposta
        .replaceAll('AT+DEVICE_VERSION:00', '')
        .replaceAll('\r\n', "");
    double versao = double.parse(replaceVersao.hexToAscii());
    return versao;
  }

  Future<EstadoConexaoBluetooth> reconexao(String endereco) async {
    _bluetoothConectado = EstadoConexaoBluetooth.tentandoConectar;
    notifyListeners();
    await atualizadorEspService.bluetoothAppService.conectar(endereco);
    EstadoConexaoBluetooth status = await atualizadorEspService
        .bluetoothAppService
        .obterStatusConexao();
    return status;
  }

  bool falhaReceberComando(String comando) {
    if (comando.isEmpty) {
      return true;
    }
    if (comando.contains('ER')) {
      return true;
    }
    return false;
  }
}
