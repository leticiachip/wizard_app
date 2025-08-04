import 'dart:developer';

import 'package:sqflite/sqlite_api.dart';
import 'package:wizard_app/core/sqflite/services/db_execute_service_impl.dart';

import '../utils/exception_database.dart';
import 'db_service.dart';

class DbServiceImpl implements DbService {
  final _dbExecute = DbExecuteServiceImpl();

  //buscar todas tabelas que estão disponiveis no banco de dados
  @override
  Future<List<Map<String, dynamic>>> buscarTabelasEmComumComBancoJson(
    Database dbClient,
    List<Map<String, dynamic>> tabelaJson,
  ) async {
    List<Map<String, dynamic>> tabelasBancoEmMap = [];
    List<Map<String, dynamic>> tabelaEmComum = [];
    List<Map<String, dynamic>> tabelasJson = tabelaJson;
    //tabelas que estão no banco de dados
    //transforma os dados do banco para json
    List<Map<String, Object?>> todasTabelasBanco = await _dbExecute
        .buscarTodasTabelasBanco(dbClient);

    for (var tabela in todasTabelasBanco) {
      var campos = await _dbExecute.buscarCampoTabela(
        dbClient,
        tabela['name'].toString(),
      );

      tabelasBancoEmMap.add({"${tabela['name']}": campos});
    }

    //busca tabela em comum com o banco de dados
    for (var tabelas in tabelasBancoEmMap) {
      String nomeTabelaBanco = tabelas.keys.toSet().first;
      bool tabelaExisteNasBases = tabelasJson.any((element) {
        return element.keys.contains(nomeTabelaBanco);
      });
      if (tabelaExisteNasBases) {
        tabelaEmComum.add(tabelas);
      }
    }

    return tabelaEmComum;
  }

  Future<List<Map<String, dynamic>>> buscarTabelasIncomumBanco(
    Database dbClient,
    List<Map<String, dynamic>> tabelaJson,
  ) async {
    List<Map<String, dynamic>> tabelasBancoEmMap = [];
    List<Map<String, dynamic>> tabelaDiferentes = [];
    List<Map<String, dynamic>> tabelasJson = tabelaJson;
    //tabelas que estão no banco de dados
    //transforma os dados do banco para json
    List<Map<String, Object?>> todasTabelasBanco = await _dbExecute
        .buscarTodasTabelasBanco(dbClient);
    for (var tabela in todasTabelasBanco) {
      var campos = await _dbExecute.buscarCampoTabela(
        dbClient,
        tabela['name'].toString(),
      );

      tabelasBancoEmMap.add({"${tabela['name']}": campos});
    }

    //busca tabela em comum com o banco de dados
    for (var tabelas in tabelasBancoEmMap) {
      String nomeTabelaBanco = tabelas.keys.toSet().first;
      bool tabelaExisteNasBases = tabelasJson.any((element) {
        return element.keys.contains(nomeTabelaBanco);
      });
      if (!tabelaExisteNasBases) {
        tabelaDiferentes.add(tabelas);
      }
    }
    return tabelaDiferentes;
  }

  @override
  List<Map<String, dynamic>> buscarCampoTabelaJson(
    List<Map<String, dynamic>> tabelaJson,
    String nomeTabelaBanco,
  ) {
    //pega pelo nome a tabela que está sendo verificada

    List<Map<String, dynamic>> tabelaAtualJson = tabelaJson.where((element) {
      return element.keys.contains(nomeTabelaBanco);
    }).toList();
    return tabelaAtualJson
        .expand<Map<String, dynamic>>((element) => element.values.firstOrNull)
        .toList();
  }

  Future<void> atualizarCamposTabela(
    String nomeTabela,
    List<Map<String, dynamic>> camposTabelaJson,
    List<Map<String, dynamic>> nomeAtributoAtualizado,
    Database dbClient,
  ) async {
    String nomeTabelaDelete = 'd_$nomeTabela';
    String nomeTabelaNova = 'n_$nomeTabela';
    String nomeTabelaOriginal = nomeTabela;
    try {
      List<Map<String, dynamic>> camposTabelaOriginal = camposTabelaJson;

      //captura os campos que serão usados no INSERT depois para migrar os dados
      List<String> camposInsert = camposTabelaOriginal
          .map<String>((e) => e['atributo']!)
          .toList();

      //criar a tabela com os campos que estão na tabela em json
      await _dbExecute.criarTabela(
        dbClient,
        camposTabelaOriginal,
        nomeTabelaNova,
      ); //buscar todos os dados que estão salvos na tabela

      int contadorWhile = 0;

      //tentar manter a integridade dos dados pelo menos 3 vezes
      while (contadorWhile <= 3) {
        bool temMesmaQtdRegistro = await compararQuantidadeRegistro(
          nomeTabelaNova,
          nomeTabelaOriginal,
        );
        if (temMesmaQtdRegistro) {
          contadorWhile = 3;
          break;
        }
        if (contadorWhile == 3) {
          throw ExceptionDatabase(
            mensagem:
                "A quantidade de dados entre a tabela $nomeTabelaNova e $nomeTabelaOriginal estão diferentes",
            rastreio: "1",
          );
        }
        contadorWhile++;
        List<Map<String, dynamic>> todosDados = await _dbExecute
            .buscarTodosDadosTabela(nomeTabela);

        for (var dados in todosDados) {
          List<dynamic> dadosParaInserir = [];
          for (var json in camposTabelaJson) {
            if (dados.containsKey(json['atributo'])) { 
              dadosParaInserir.add(json);
            }
            if (dados.containsKey(json['old']) && json['old'] != "") {
              dadosParaInserir.add(json);
            }
            //valida se a chaveJson é diferente do que está no banco
            //valida se a chaveJson antiga tb é diferente do que esta no banco
            //valida se este dado já foi inserido na lista de campos
            if (!dados.containsKey(json['atributo']) &&
                json['old'] == "" &&
                !dadosParaInserir.contains(json)) {
              dadosParaInserir.add(json);
            }
          }

          //encaixar os dados
          List<dynamic> dadosFormatadosParaInserir = [];
          for (var valor in dadosParaInserir) {
            if (dados[valor['atributo']] == null &&
                dados[valor['old']] != null) {
              dynamic formatador = valor['tipo'] == "TEXT"
                  ? "'${dados[valor['old']]}'"
                  : dados[valor['old']];
              dadosFormatadosParaInserir.add(formatador);
            }
            if (dados[valor['old']] == null &&
                dados[valor['atributo']] != null) {
              dynamic formatador = valor['tipo'] == "TEXT"
                  ? "'${dados[valor['atributo']]}'"
                  : dados[valor['atributo']];

              dadosFormatadosParaInserir.add(formatador);
            }
            if (dados[valor['atributo']] == null &&
                dados[valor['old']] == null) {
              dynamic tipo = valor['tipo'] == "TEXT" ? "''" : 0;
              dadosFormatadosParaInserir.add(tipo);
            }
          }
          _dbExecute.inserirTodosRegistros(
            nomeTabelaNova,
            camposInsert,
            dadosFormatadosParaInserir,
          );
        }
      }

      //se não houver diferença na quantidade de registro, excluir tabela antiga
      await _dbExecute.renomearTabela(
        dbClient,
        nomeTabelaOriginal,
        nomeTabelaDelete,
      );
      //renomear a tabela para o nome original
      await _dbExecute.renomearTabela(
        dbClient,
        nomeTabelaNova,
        nomeTabelaOriginal,
      );
    } catch (e) {
      log("---->> mostre o erro $e");
    }
  }

  //comparar quantidade de registros da tabela nova com a tabela antiga
  Future<bool> compararQuantidadeRegistro(
    String nomeTabelaNova,
    String nomeTabelaAntiga,
  ) async {
    //buscar os dados da tabela nova
    List<Map<String, dynamic>> dadosTabelaNova = await _dbExecute
        .buscarTodosDadosTabela(nomeTabelaNova);
    //buscar os dados da tabela antiga
    List<Map<String, dynamic>> dadosTabelaAntiga = await _dbExecute
        .buscarTodosDadosTabela(nomeTabelaAntiga);

    if (dadosTabelaAntiga.length == dadosTabelaNova.length) {
      return true;
    }
    return false;
  }

  Future<void> apagarTabelas(
    Database dbClient,
    List<Map<String, dynamic>> tabelaJson,
  ) async {
    List<Map<String, dynamic>> tabelasDelete = await _dbExecute
        .buscarTabelasDelete(dbClient);
    List<Map<String, dynamic>> tabelasIncomumBanco =
        await buscarTabelasIncomumBanco(dbClient, tabelaJson);
    log("---->> consulta tabelas apagar $tabelasIncomumBanco");

    if (tabelasDelete.isEmpty && tabelasIncomumBanco.isEmpty) return;
    for (var tabela in tabelasDelete) {
      String nomeTabela = tabela['name'];
      await _dbExecute.excluirTabela(dbClient, nomeTabela);
    }
    for (var tabela in tabelasIncomumBanco) {
      String nomeTabela = tabela.keys.first;
      await _dbExecute.excluirTabela(dbClient, nomeTabela);
    }
  }

  @override
  criar(List<Map<String, dynamic>> tabelaJson, Database dbClient) async {
    List<Map<String, dynamic>> tabelasParaCriar =
        await buscarTabelasQueNaoExistem(tabelaJson, dbClient);
    for (Map<String, dynamic> tabela in tabelasParaCriar) {
      //com traço na frente para depois excluir
      String nomeTabelaDestacada = "${tabela['nomeTabela']}";
      List<Map<String, dynamic>> campoTabela = tabela['camposTabela'];
      _dbExecute.criarTabela(dbClient, campoTabela, nomeTabelaDestacada);
    }
  }

  Future<List<Map<String, dynamic>>> buscarTabelasQueNaoExistem(
    List<Map<String, dynamic>> tabelaJson,
    Database dbClient,
  ) async {
    List<Map<String, dynamic>> tabelasQueNaoExistem = [];
    List<Map<String, Object?>> todasTabelasBanco = await _dbExecute
        .buscarTodasTabelasBanco(dbClient);
    List<String> nomesTabelasExistentes = todasTabelasBanco
        .map((e) => e['name'].toString())
        .toList();
    nomesTabelasExistentes.removeWhere(
      (element) => element.contains("android_metadata"),
    );

    //itera sobre a lista os valores que foram selecionados pelo element
    List<String> nomesTabelasBase = tabelaJson
        .expand((element) => element.keys)
        .toList();
    List<String> nomesTabelasNaoExiste = nomesTabelasBase
        .toSet()
        .difference(nomesTabelasExistentes.toSet())
        .toList();
    for (var nomesTabelas in nomesTabelasNaoExiste) {
      Map<String, dynamic> valores = tabelaJson
          .where((element) => element.keys.first == nomesTabelas)
          .first;

      String modeloCampos = "";
      for (var campos in valores.values.first) {
        modeloCampos = "$modeloCampos${campos['atributo']} ${campos['tipo']}, ";
      }

      String nometabela = valores.keys.first;
      List<Map<String, String>> camposTabela = valores.values.first;
      tabelasQueNaoExistem.add({
        "nomeTabela": nometabela,
        "camposTabela": camposTabela,
      });
    }

    return tabelasQueNaoExistem;
  }

  @override
  List<Map<String, dynamic>> buscarTabelasComAlteracao(
    List<Map<String, dynamic>> camposTabelaJson,
    List<Map<String, dynamic>> camposTabelaBanco,
  ) {
    Set<Map<String, dynamic>> camposExistentes = {};
    List<Map<String, dynamic>> camposDiferentes = [];
    void compararCampos(
      List<Map<String, dynamic>> fonte,
      List<Map<String, dynamic>> referencia,
    ) {
      for (var campoBanco in fonte) {
        log('\x1B[37m $campoBanco\x1B[0m');
        bool encontradoNoBanco = false;

        for (var campojson in referencia) {
          log('\x1B[37m $campoBanco\x1B[0m');
          // Se o campo no banco corresponde ao campo "old" no JSON

          if ((campoBanco['atributo'] == campojson['atributo'] ||
                  campoBanco['atributo'] == campojson['old']) &&
              campoBanco['tipo'] != campojson['tipo']) {
            throw ExceptionDatabase(
              mensagem:
                  "O campo ${campojson['atributo']} deve ser do tipo ${campoBanco['tipo']}",
              rastreio: '0',
            );
          }

          if (campoBanco['atributo'] == campojson['old']) {
            camposDiferentes.add(campojson);
            encontradoNoBanco = true;
            break;
          }

          // Se o campo no banco corresponde ao atributo e tipo no JSON
          if (campoBanco['atributo'] == campojson['atributo'] &&
              campoBanco['tipo'] == campojson['tipo']) {
            camposExistentes.add(campojson);
            encontradoNoBanco = true;
            break;
          }
        }

        // Se não encontrou no banco, adiciona ao camposDiferentes
        if (!encontradoNoBanco) {
          camposDiferentes.add(campoBanco);
        }
      }
    }

    compararCampos(camposTabelaJson, camposTabelaBanco);
    compararCampos(camposTabelaBanco, camposTabelaJson);
    return camposDiferentes;
  }
}
