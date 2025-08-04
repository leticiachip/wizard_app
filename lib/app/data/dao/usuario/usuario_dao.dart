import 'package:wizard_app/app/domain/models/usuario/usuario.dart';
import 'package:wizard_app/core/sqflite/helper/base_dao.dart';

class UsuarioDAO extends BaseDao {
  String get nomeTabela => "USUARIO";
  Future<void> inserirUsuario(Usuario usuario) async {
    await query(
      "REPLACE INTO $nomeTabela('ID', 'ID_USUARIO', 'NOME', 'TELEFONE', 'ENDERECO') VALUES (1, ${usuario.id}, '${usuario.nome}', '${usuario.telefone}', '${usuario.endereco}')",
    );
  }

  Future<List<Map<String, dynamic>>> buscarUsuario() async {
    List<Map<String, dynamic>> result = await query(
      "SELECT * FROM $nomeTabela",
    );
    return result;
  }
}
