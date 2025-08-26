// #region tipos de requisições que são usadas no app se a telemetria criar mais uma adicionar aqui
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:wizard_app/app/data/services/login/login_service.dart';
import 'package:wizard_app/core/const/endpoint.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';
import 'package:wizard_app/core/utils/result.dart';

import '../utils/coverter_base64.dart';
import '../utils/resultado_requisicao.dart';
import '../utils/status_response.dart';

enum TiposRequisicao {
  post,
  put;

  Function get tipo {
    switch (this) {
      case TiposRequisicao.post:
        return http.post;

      case TiposRequisicao.put:
        return http.put;
    }
  }
}
// #endregion

class CentralRequisicaoRepository {
  final _loginService = getIt<LoginService>();
  // #region metodo que faz a requisição do app independente se foi escolhido rota PUT ou POST

  Future<Result<ResultadoRequisicao, ExceptionApp>> requisicaoPrincipal({
    required String urlRota,
    Map<String, dynamic>? body,
    required Function tipo,
    required String rastreio,
  }) async {
    try {
      //metodo renova o token se ele estiver expirado, se der erro deve ser interrompido o fluxo
      Result<String, ExceptionApp> resultadoToken = await _loginService.token();

      //quer dizer que o token nao veio porque deu erro dentro do metodo na hora de pegar

      if (resultadoToken.isError) {
        return Failure(resultadoToken.exceptionOrNull()!);
      }
      String token = resultadoToken.getOrNull()!;

      String bodyEnviar = body == null ? json.encode({}) : json.encode(body);

      http.Response response = await tipo(
        Uri.parse(url.valor + urlRota),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: bodyEnviar,
      ).timeout(const Duration(seconds: 40));

      Result<ResultadoRequisicao, ExceptionApp> resultadoAPI =
          tratamentoRespostaAPI(response, '');

      if (resultadoAPI.isError) {
        return Failure(resultadoAPI.exceptionOrNull()!);
      }
      ResultadoRequisicao resultadoRequisicao = resultadoAPI.getOrNull()!;

      if (resultadoRequisicao.estadoResponse !=
              EstadoResponse.todasInformacoesCadastrada &&
          resultadoRequisicao.estadoResponse !=
              EstadoResponse.sucessoBuscarDados) {
        print("entrou neste metodo");
      }

      return Success(resultadoRequisicao);
    } catch (erro, stackTrace) {
      log("-> erro $erro | type erro ${erro.runtimeType} | stack $stackTrace");

      Exception exception = erro is TypeError ? Exception() : erro as Exception;

      ExceptionApp resultadoException = _centralTratamentoException(
        exception,
        stackTrace,
        body,
        rastreio,
      );
      return Failure(resultadoException);
    }
  }

  // #endregion
  ///[tratativas de erros que foram lançados pela API]
  // #region trata todas as exceptions que a API deve lançar, as tratativas foram baseadas na documentação da telemetria, se criarem mais deve ser colocado aqui
  Result<ResultadoRequisicao, ExceptionApp> tratamentoRespostaAPI(
    http.Response responseData,
    String codigoRastreio,
  ) {
    Map<String, dynamic> response = json.decode(
      utf8.decode(responseData.bodyBytes),
    );
    if (response.containsKey("message") && responseData.statusCode == 401) {
      //falha de autorizacao
      return Failure(
        ExceptionApp(
          descricao: response["message"],
          detalhes: "falha no servidor, houve uma falha com autorização",
          rastreio: codigoRastreio,
        ),
      );
    }
    if (response.containsKey("message") && responseData.statusCode == 403) {
      //forbidden
      return Failure(
        ExceptionApp(
          descricao: response["message"],
          detalhes: "falha no servidor, houve uma falha com autorização",
          rastreio: codigoRastreio,
        ),
      );
    }
    if (response.containsKey("message") && responseData.statusCode == 400) {
      //paremetros invalidos
      return Failure(
        ExceptionApp(
          descricao: "falha servidor",
          detalhes: response["message"],
          rastreio: codigoRastreio,
        ),
      );
    }
    //deu certo a busca de dados do servidor
    if (response["data"] != null && responseData.statusCode == 200) {
      return Success(
        ResultadoRequisicao(
          estadoResponse: EstadoResponse.sucessoBuscarDados,
          listaItensNaoCadastrados: [],
          mensagemFalha: response["message"],
          body: response,
          codigoRastreio: 5,
        ),
      );
    }

    if (response["data"] == null && responseData.statusCode == 200) {
      //quer dizer que não houve erro nenhum
      return Success(
        ResultadoRequisicao(
          body: response,
          estadoResponse: EstadoResponse.todasInformacoesCadastrada,
          listaItensNaoCadastrados: [],
          mensagemFalha: response["message"],
          codigoRastreio: 6,
        ),
      );
    }
    if (response["data"]["erros"] != null && responseData.statusCode == 200) {
      //deu erro no cadastro de algum dado na API
      //pegar o array de erros e colocar dados sincronizados apenas para os eventos que não foram retornados pela API

      List<Map<String, dynamic>> lista = List<Map<String, dynamic>>.from(
        response["data"]["erros"],
      );
      return Success(
        ResultadoRequisicao(
          estadoResponse:
              EstadoResponse.informacoesNaoForamCadastradaCorretamente,
          listaItensNaoCadastrados: lista,
          mensagemFalha: response["message"],
          codigoRastreio: 7,
        ),
      );
    }
    if (responseData.statusCode == 500) {
      //erro diretamente na API
      return Failure(
        ExceptionApp(
          descricao: "Falha diretamente na API",
          detalhes: response["message"],
          rastreio: codigoRastreio,
        ),
      );
    }

    return Failure(
      ExceptionApp(
        descricao: "Falha ainda não rastreada",
        detalhes: "Falha ainda não rastreada",
        rastreio: codigoRastreio,
      ),
    );
  }

  // #endregion
  ExceptionApp _centralTratamentoException(
    Exception exception,
    StackTrace stackTrace,
    Map<String, dynamic>? body,
    String rastreio,
  ) {
    log("stacktrace $exception");
    if (exception is SocketException) {
      return ExceptionApp(
        descricao: "Sem conexão com a internet",
        detalhes: convertBase64(
          "exception $exception | stackTrace $stackTrace",
        ),
        rastreio: rastreio,
      );
    }
    if (exception is TimeoutException) {
      return ExceptionApp(
        descricao: "Não foi possível completar solicitação",
        detalhes: convertBase64(
          "exception $exception | stackTrace $stackTrace",
        ),
        rastreio: rastreio,
      );
    }
    if (exception is FormatException) {
      return ExceptionApp(
        descricao: "Formato de alguns parametros estão incorretos",
        detalhes: convertBase64(
          "exception $exception | stackTrace $stackTrace",
        ),
        rastreio: rastreio,
      );
    }

    if (exception is http.ClientException) {
      return ExceptionApp(
        descricao: "Falha na resposta ou solicitação",
        detalhes: convertBase64(
          "exception $exception | stackTrace $stackTrace",
        ),
        rastreio: rastreio,
      );
    }
    return ExceptionApp(
      descricao: "Exception ainda não rastreada",
      detalhes: convertBase64("exception $exception | stackTrace $stackTrace"),
      rastreio: rastreio,
    );
  }

  Future<Result<Uint8List, ExceptionApp>> executarCarregamentoArquivo(
    String urlPdf,
    String rastreio,
  ) async {
    try {
      final url = Uri.parse(urlPdf);
      var response = await http.get(url);
      return Success(response.bodyBytes);
    } catch (e, stack) {
      return Failure(
        ExceptionApp(
          descricao: 'Não foi possivel buscar o arquivo',
          detalhes: '$e $stack',
          rastreio: rastreio,
        ),
      );
    }
  }
}
