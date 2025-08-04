import 'package:sqflite/sqflite.dart';

import '../services/db_service_impl.dart';
import '../services/validacoes_modelo.dart';

class DbUpgrade {
  final _dbService = DbServiceImpl();
  final _validacaoModelo = ValidacoesModelo();

  final List<Map<String, dynamic>> _todasTabelas = [
    {
      "USUARIO": [
        {"atributo": "ID", "tipo": "INTEGER PRIMARY KEY", "old": ""},
        {"atributo": "ID_USUARIO", "tipo": "INTEGER", "old": ""},
        {"atributo": "NOME", "tipo": "TEXT", "old": ""},
        {"atributo": "TELEFONE", "tipo": "TEXT", "old": ""},
        {"atributo": "ENDERECO", "tipo": "TEXT", "old": ""},
      ],
    },
  ];

  onUpgrade(Database dbClient) async {
    _validacaoModelo.validacoes(_todasTabelas);
    //primeiro fluxo - criar tabelas que não existem
    await _dbService.criar(_todasTabelas, dbClient);
    List<Map<String, dynamic>> tabelasEmComum = await _dbService
        .buscarTabelasEmComumComBancoJson(dbClient, _todasTabelas);

    //ALTERAÇÃO DAS TABELAS
    for (var tabela in tabelasEmComum) {
      String nomeTabela = tabela.keys.first;
      //pegar somente os campos
      List<Map<String, dynamic>> camposTabelaBanco = tabela.values.first;
      List<Map<String, dynamic>> camposTabelaJson = _dbService
          .buscarCampoTabelaJson(_todasTabelas, nomeTabela);
      List<Map<String, dynamic>> camposComAlteracao = _dbService
          .buscarTabelasComAlteracao(camposTabelaJson, camposTabelaBanco);
      if (camposComAlteracao.isNotEmpty) {
        await _dbService.atualizarCamposTabela(
          nomeTabela,
          camposTabelaJson,
          camposComAlteracao,
          dbClient,
        );
      }
    }
    await _dbService.apagarTabelas(dbClient, _todasTabelas);
  }
}
