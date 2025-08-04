// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'status_response.dart';

class ResultadoRequisicao {
  //enum estado
  EstadoResponse? estadoResponse;
  //lista de dados que não foram sincronizados
  List<Map<String, dynamic>>? listaItensNaoCadastrados;
  //mensagem de falha
  String? mensagemFalha;
  Map<String, dynamic>? body;
  int codigoRastreio;

  ResultadoRequisicao({
    this.estadoResponse,
    this.listaItensNaoCadastrados,
    this.mensagemFalha,
    this.body,
    required this.codigoRastreio,
  });
  @override
  String toString() {
    return "{estadoCadastrado: $estadoResponse, listaItensNaoCadastrados: $listaItensNaoCadastrados, mensagemFalha: $mensagemFalha, body: $body, codigoRastreio: $codigoRastreio}";
  }
}
