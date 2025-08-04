import 'package:sqflite/sqlite_api.dart';

//operações do banco de dados
abstract class DbExecuteService {
  Future<void> renomearTabela(
      Database dbClient, String nomeTabelaOriginal, String nomeTabelaNova);
  Future<void> criarTabela(
      Database dbClient,
      List<Map<String, dynamic>> camposTabelaNova,
      String nomeTabelaNovaDestaque);
  Future<void> excluirTabela(Database dbClient, String nomeTabela);
  Future<List<Map<String, Object?>>> buscarTodasTabelasBanco(Database dbClient);
  Future<List<Map<String, dynamic>>> buscarCampoTabela(
      Database dbClient, String nomeTabela);
  Future<void> inserirTodosRegistros(
      String nomeTabela, List<String> camposTabela, List<dynamic> values);

  
}
