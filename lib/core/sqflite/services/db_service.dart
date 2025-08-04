import 'package:sqflite/sqflite.dart';

abstract class DbService {
  Future<List<Map<String, dynamic>>> buscarTabelasEmComumComBancoJson(
      Database dbClient, List<Map<String, dynamic>> tabelaJson);
  List<Map<String, dynamic>> buscarCampoTabelaJson(
      List<Map<String, dynamic>> tabelaJson, String nomeTabelaBanco);
  Future<void> criar(List<Map<String, dynamic>> tabelaJson, Database dbClient);
  List<Map<String, dynamic>> buscarTabelasComAlteracao(
      List<Map<String, dynamic>> camposTabelaJson,
      List<Map<String, dynamic>> camposTabelaBanco);
}
