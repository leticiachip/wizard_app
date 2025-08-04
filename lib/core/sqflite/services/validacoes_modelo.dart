import 'package:wizard_app/core/sqflite/utils/is_upper_case.dart';

import '../utils/exception_database.dart';

class ValidacoesModelo {
  bool validacoes(List<Map<String, dynamic>> todasTabelas) {
    for (var tabela in todasTabelas) {
      String nomeTabela = tabela.keys.first;
      if (nomeTabela.isEmpty) {
        throw ExceptionDatabase(
            mensagem: "O nome da tabela não pode ser vazia", rastreio: '1');
      }

      for (var value in tabela.values.first) {
        Map<String, String> mapValor = value;

        if (!mapValor.containsKey('atributo') ||
            !mapValor.containsKey('tipo') ||
            !mapValor.containsKey('old')) {
          throw ExceptionDatabase(
              mensagem:
                  "As chaves atributo, tipo e old são necessárias na tabela $nomeTabela",
              rastreio: '0');
        }

        if (value['tipo'] == null || value['atributo'] == null) {
          throw ExceptionDatabase(
              mensagem:
                  "Chave atributo ou o tipo na tabela $nomeTabela deve ser declarado",
              rastreio: '2');
        }
        if (!value['tipo'].contains('TEXT') &&
            !value['tipo'].contains('INTEGER')) {
          throw ExceptionDatabase(
              mensagem:
                  "O tipo do dado ${value['atributo']} deve ser INTEGER ou TEXT",
              rastreio: '2');
        }
        if (value['atributo'].isEmpty || value['tipo'].isEmpty) {
          throw ExceptionDatabase(
              mensagem:
                  "Alguns atributos ou tipos dos dados da tabela ${tabela.keys.first} não podem ser vazio",
              rastreio: '3');
        }
        if (!mapValor['atributo']!.isUpperCase ||
            !mapValor['tipo']!.isUpperCase ||
            (mapValor['old']!.isNotEmpty && !mapValor['old']!.isUpperCase)) {
          throw ExceptionDatabase(
              mensagem: "Todos os dados devem estar em maiúsculo",
              rastreio: '0');
        }
      }
    }
    return true;
  }

  bool teste(int valor) {
    if (valor == 1) {
      return true;
    }
    return false;
  }
}
