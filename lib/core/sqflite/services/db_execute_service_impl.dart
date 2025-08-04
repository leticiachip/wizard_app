import 'package:sqflite/sqflite.dart';
import 'package:wizard_app/core/sqflite/helper/db_helper.dart'
    show DatabaseHelper;
import 'package:wizard_app/core/sqflite/services/db_execute_service.dart';

//operações do banco de dados
class DbExecuteServiceImpl implements DbExecuteService {
  Future<Database> get db => DatabaseHelper.getInstance().db;
  @override
  Future<void> renomearTabela(
    Database dbClient,
    String nomeTabelaMascara,
    String nomeTabela,
  ) async {
    String query =
        "ALTER TABLE ${nomeTabelaMascara.trim()} RENAME TO ${nomeTabela.trim()}";
    await dbClient.execute(query);
  }

  @override
  Future<void> criarTabela(
    Database dbClient,
    List<Map<String, dynamic>> camposTabelaNova,
    String nomeTabelaNovaDestaque,
  ) async {
    String modeloCampos = "";
    for (var campos in camposTabelaNova) {
      modeloCampos = "$modeloCampos${campos['atributo']} ${campos['tipo']}, ";
    }
    //remover a virgula no final que foi adicionada no for
    String campoVirgulaFinalRemovida = modeloCampos.replaceRange(
      modeloCampos.length - 2,
      modeloCampos.length,
      "",
    );
    String query =
        "CREATE TABLE IF NOT EXISTS ${nomeTabelaNovaDestaque.trim()} ($campoVirgulaFinalRemovida) ";

    await dbClient.execute(query);
    await excluirTodosDadosTabela(nomeTabelaNovaDestaque, dbClient);
  }

  @override
  Future<void> excluirTabela(Database dbClient, String nomeTabela) async {
    await dbClient.execute('DROP TABLE IF EXISTS $nomeTabela');
  }

  @override
  Future<List<Map<String, Object?>>> buscarTodasTabelasBanco(
    Database dbClient,
  ) async {
    List<Map<String, Object?>> todasTabelasBanco = await dbClient.rawQuery(
      '''SELECT name FROM sqlite_master 
                                              WHERE type IN ('table','view')
                                              AND name NOT LIKE 'sqlite_%'
                                              ORDER BY 1;
                                          ''',
    );

    return todasTabelasBanco;
  }

  @override
  //busca todos os campos da tabela e formata como json
  Future<List<Map<String, dynamic>>> buscarCampoTabela(
    Database dbClient,
    String nomeTabela,
  ) async {
    List<Map<String, dynamic>> listaCampos = [];
    final detalhesTabela = await dbClient.rawQuery(
      "PRAGMA table_info($nomeTabela)",
    );
    for (var campos in detalhesTabela) {
      //buscando detalhes do campo

      listaCampos.add({
        "atributo": campos['name'],
        "tipo": campos['pk'] == 1
            ? "${campos['type']} PRIMARY KEY"
            : campos['type'],
      });
    }
    // log("----->>> tabelas banco  $listaCampos");
    return listaCampos;
  }

  //select direto pelo nome da tabela
  Future<List<Map<String, dynamic>>> buscarTodosDadosTabela(
    String nomeTabela,
  ) async {
    var dbClient = await db;
    List<Map<String, dynamic>> todosDados = await dbClient.rawQuery(
      "SELECT * FROM $nomeTabela",
    );
    return todosDados;
  }

  @override
  inserirTodosRegistros(
    String nomeTabela,
    List<String> camposTabela,
    List<dynamic> values,
  ) async {
    var dbClient = await db;
    //remover virgula no final da criacao dos campos
    String campoFormatadoInsert = camposTabela
        .toString()
        .replaceFirst("[", "(")
        .replaceFirst("]", ")");
    String campoFormtadoValue = values
        .toString()
        .replaceFirst("[", "(")
        .replaceFirst("]", ")");
    String query =
        "INSERT OR IGNORE INTO $nomeTabela $campoFormatadoInsert VALUES $campoFormtadoValue";

    await dbClient.rawQuery(query);
  }

  Future<void> excluirTodosDadosTabela(
    String nomeTabela,
    Database dbClient,
  ) async {
    String query = "DELETE FROM $nomeTabela";
    await dbClient.rawQuery(query);
  }

  Future<List<Map<String, Object?>>> buscarTabelasDelete(
    Database dbClient,
  ) async {
    String query =
        "SELECT name FROM sqlite_master WHERE type IN ('table','view') AND name NOT LIKE 'sqlite_%' AND name NOT LIKE 'android_metadata' AND name LIKE 'd_%' ORDER BY 1;";
    return await dbClient.rawQuery(query);
  }
}
