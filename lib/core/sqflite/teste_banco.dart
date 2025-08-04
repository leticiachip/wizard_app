import 'package:wizard_app/core/sqflite/helper/base_dao.dart';

class TesteBanco extends BaseDao {
  inserirModelo() async {
    for (int i = 0; i < 5; i++) {
      await query(
        "INSERT INTO MODELO (DESCRICAO, TESTE) VALUES ('meu teste', 'descricao do teste')",
      );
    }
  }

  inserirTextos() async {
    await query(
      "INSERT INTO TEXTOS (DESCRICAO, CATEGORIA_NOVA) VALUES ('texto1', 'categoria1'), ('texto2', 'categoria2')",
    );
  }

  buscar() async {
    var result = await query("SELECT * FROM MODELO");
    print("-> result $result");
  }
}
