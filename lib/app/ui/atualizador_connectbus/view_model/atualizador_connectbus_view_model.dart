import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wizard_app/app/data/utils/enum_estado_atualizacao_connnect.dart';
import 'package:wizard_app/core/const/codigo_rastreio.dart';
import 'package:wizard_app/core/utils/command.dart';

import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/utils/result.dart';
import '../../../data/services/atualizador_connectbus/atualizador_connectbus_service.dart'
    show AtualizadorConnectbusService;
import '../../../domain/models/atualizacao_connect/atualizacao_connect.dart';

class AtualizadorConnectbusViewModel extends ChangeNotifier {
  final AtualizadorConnectbusService atualizadorConnectBusService;
  late Command1 startAtualizacao;
  AtualizadorConnectbusViewModel({required this.atualizadorConnectBusService}) {
    startAtualizacao = Command1<void, String>(_iniciarAtualizacao);
  }
  EnumEstadoAtualizacaoConnnect get estadoAtualizacaoConnect =>
      _estadoAtualizacaoConnect;
  EnumEstadoAtualizacaoConnnect _estadoAtualizacaoConnect =
      EnumEstadoAtualizacaoConnnect.nenhum;
  int get porcentagem => _porcentagem;
  int _porcentagem = 0;
  ExceptionApp get exceptionApp => _exception;
  late ExceptionApp _exception;

  Future<Result<void, ExceptionApp>> _iniciarAtualizacao(
    String endereco,
  ) async {
    int qtdLinhas = 3;
    _estadoAtualizacaoConnect = EnumEstadoAtualizacaoConnnect.erase;
    notifyListeners();
    Result<CargaConnect, ExceptionApp> resultCarga =
        await atualizadorConnectBusService.buscarCargaConnect();
    if (resultCarga.isError) {
      _exception = resultCarga.exceptionOrNull()!;
      notifyListeners();
      return Failure(_exception);
    }
    CargaConnect carga = resultCarga.getOrNull()!;

    bool reconectarBluetooth = await atualizadorConnectBusService
        .reconectarBluetooth(endereco);
    if (!reconectarBluetooth) {
      _exception = ExceptionApp(
        descricao: "Não foi possivel conectar ao equipamento",
        detalhes: "Falha de conexão bluetooth",
        rastreio: CodigoRastreio.atualizacaoConnect,
      );
      notifyListeners();
      return Failure(_exception);
    }
    /* Result<bool?, ExceptionApp> resultConsultaVersao = await consultarVersao(
      carga.id!,
    );
    if (resultConsultaVersao.isError) {
      _exception = resultConsultaVersao.exceptionOrNull()!;
      notifyListeners();
      return Failure(_exception);
    }
    bool resultVerificacao = resultConsultaVersao.getOrNull()!;

    if (resultVerificacao) {
      _estadoAtualizacaoConnect = EnumEstadoAtualizacaoConnnect.sucesso;
      notifyListeners();
      return Success(null);
    } */

    String resultErase = await atualizadorConnectBusService.enviarComando(
      "AT+BL_ERASE",
    );
    String statusResposta = resultErase.split(':').last;
    print("--------->>> statusResposta $statusResposta");
    if (statusResposta != '00') {
      _exception = ExceptionApp(
        descricao: "Não foi possivel enviar comando AT+BL_ERASE",
        detalhes: "Falha de conexão bluetooth",
        rastreio: "${CodigoRastreio.atualizacaoConnect}.$statusResposta",
      );
      notifyListeners();
      return Failure(_exception);
    }
    _estadoAtualizacaoConnect = EnumEstadoAtualizacaoConnnect.bldata;
    notifyListeners();
    String startUpdate = carga.arquivo.split('\r\n').first;
    String resulStartUpdate = await atualizadorConnectBusService.enviarComando(
      "AT+BL_UPDATE_START:$startUpdate",
    );
    print("--->> resposta $resulStartUpdate");
    String statusStartUpdate = resulStartUpdate.split(':').last.substring(0, 2);
    if (statusStartUpdate != "00") {
      _exception = ExceptionApp(
        descricao: "Não foi possivel enviar comando AT+BL_UPDATE_START",
        detalhes: "Falha transferencia de comandos",
        rastreio: "${CodigoRastreio.atualizacaoConnect}.$statusStartUpdate",
      );
      notifyListeners();
      return Failure(_exception);
    }

    List<String> result = dividirLinha(carga.arquivo, qtdLinhas);

    for (int i = 0; i < result.length; i++) {
      double porcentagem = ((i + 1) / result.length) * 100;
      _porcentagem = porcentagem.round();
      notifyListeners();
      String indice = (i * qtdLinhas + 1)
          .toRadixString(16)
          .padLeft(8, '0')
          .toUpperCase();
      print('\x1B[35m inicio: ${DateTime.now()}\x1B[0m');
      String resultBlData = await atualizadorConnectBusService.enviarComando(
        "AT+BL_DATA:$indice${result[i]}",
      );
      print('\x1B[35m fim: ${DateTime.now()}\x1B[0m');
      print("--->> teste $resultBlData");
      //se vier vazio continua enviando os dados
      if (resultBlData.isEmpty) {
        _exception = ExceptionApp(
          descricao: "Não foi continuar atualização ",
          detalhes:
              "comando AT+BL_DATA:$indice${result[i]} - resposta: $resultBlData",
          rastreio: "${CodigoRastreio.atualizacaoConnect}.algo",
        );
        notifyListeners();
        //trava usuario
        return Failure(_exception);
      }
    }
    _estadoAtualizacaoConnect = EnumEstadoAtualizacaoConnnect.finish;
    notifyListeners();
    String finish = await atualizadorConnectBusService.enviarComando(
      "AT+BL_UPDATE_FINISH",
    );

    String statusFinish = finish.split(':').last.substring(0, 2);
    if (statusFinish != "00") {
      _exception = ExceptionApp(
        descricao: "Não foi finalizar atualização",
        detalhes: "comando finish",
        rastreio: "${CodigoRastreio.atualizacaoConnect}.$statusFinish",
      );
      notifyListeners();
      return Failure(_exception);
    }
    print("> $finish");
    await Future.delayed(const Duration(seconds: 15));
    bool reconectarNovamente = await atualizadorConnectBusService
        .reconectarBluetooth(endereco);
    print("---->>> reconectar $reconectarNovamente");
    if (!reconectarNovamente) {
      _exception = ExceptionApp(
        descricao: "Não foi possivel reconectar no equipamento",
        detalhes:
            "Na hora de conectar para consultar a versão antiga e a da API deu falha de conexão",
        rastreio: "${CodigoRastreio.atualizacaoConnect}.algo",
      );
      notifyListeners();
      return Failure(_exception);
    }
    _estadoAtualizacaoConnect = EnumEstadoAtualizacaoConnnect.info;
    notifyListeners();
    Result<bool?, ExceptionApp> resultTeste = await consultarVersao(carga.id!);
    if (resultTeste.isError) {
      _exception = resultTeste.exceptionOrNull()!;
      notifyListeners();
      return Failure(_exception);
    }
    bool resultadoAtualizacao = resultTeste.getOrNull()!;
    if (resultadoAtualizacao) {
      _exception = ExceptionApp(
        descricao: "Não foi possivel confirmar atualização",
        detalhes:
            "A validação de versão connect bus e servidor deu errado, pode ser que não tenha atualizado",
        rastreio: "${CodigoRastreio.atualizacaoConnect}.0",
      );
      notifyListeners();
      return Failure(_exception);
    }
    _estadoAtualizacaoConnect = EnumEstadoAtualizacaoConnnect.sucesso;
    notifyListeners();
    return Success(null);
  }

  Future<Result<bool?, ExceptionApp>> consultarVersao(String idCarga) async {
    print("----->>>> AT+GET_APP_INFO:AA - ${DateTime.now()}");
    String resultInfo = await atualizadorConnectBusService.enviarComando(
      "AT+GET_APP_INFO:AA",
    );
    print("---->>> result get info $resultInfo - ${DateTime.now()}");
    if (resultInfo.isEmpty) {
      _exception = ExceptionApp(
        descricao: "Não foi possivel obter as informações",
        detalhes: resultInfo,
        rastreio: "${CodigoRastreio.atualizacaoConnect}.algo",
      );
      notifyListeners();
      return Failure(_exception);
    }
    String versaoAtual = int.parse(
      resultInfo.substring(30, 38),
      radix: 16,
    ).toString();

    String versaoRota = int.parse(idCarga, radix: 16).toString();
    print("--->> versao rota $versaoRota");
    print("---->>> versao atual $versaoAtual");

    return Success(versaoAtual == versaoRota);
  }

  List<String> dividirArquivo(int qtdPacote, String linhasArquivo) {
    String linhas = linhasArquivo.replaceAll('\r\n', '');
    List<String> pacotesAgrupados = [];
    int tamanhoPacote = qtdPacote * 256;
    // print("-> tamanho pacote $tamanhoPacote");
    int posicaoAtual = 0;
    while (posicaoAtual < linhas.length) {
      if (posicaoAtual + 8 > linhas.length) break;
      String indice = linhas.substring(posicaoAtual, posicaoAtual + 8);
      int inicioDados = posicaoAtual + 8;
      int fimDados = inicioDados + tamanhoPacote;
      String pacote;
      if (fimDados <= linhas.length) {
        pacote = linhas.substring(inicioDados, fimDados);
        // print("-> tamanho pacote laço ${pacote.length}");
      } else {
        pacote = linhas.substring(inicioDados);
      }

      posicaoAtual = inicioDados + pacote.length;
      //      print("indice: $indice");
      //      print("pacote: $pacote");
      //      int taamnho = indice.length + pacote.length;
      //      print("tamanho $taamnho");
      pacotesAgrupados.add("$indice$pacote");
    }
    return pacotesAgrupados;
  }

  List<String> dividirLinha(String linhasArquivo, int qtdLinhaPorPacote) {
    List<String> carga = linhasArquivo.split('\r\n');

    List<String> linhasAgrupadas = [];
    //começa o laço no indice 1, evita pegar a primeira linha
    for (int i = 1; i < carga.length; i += qtdLinhaPorPacote) {
      int end = i + qtdLinhaPorPacote;

      String group = carga
          .sublist(i, end > carga.length ? carga.length : end)
          .join();
      // print('\x1B[37m $group\x1B[0m');
      linhasAgrupadas.add(group);
    }
    return linhasAgrupadas;
  }
}
