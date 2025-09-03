import 'package:wizard_app/app/domain/models/atualizacao/carga_atualizacao.dart';

import '../../../../core/exceptions_app/model/exception_app.dart'
    show ExceptionApp;
import '../../../../core/utils/result.dart';
import 'enum_validacao_modo_scape.dart' show EnumValidacaoModoScape;

abstract class AtualizadorEspService {
  Future<Result<CargaAtualizacao?, ExceptionApp>> buscarCargaRemoto(
    String serial,
    String mac,
  );

  Future<Result<Map<String, dynamic>, ExceptionApp>> enviarRetornoAtualizacao(
    int id,
    String versao,
    String status,
  );

  Future<List<String>> buscarCargaLocal();

  Future<EnumValidacaoModoScape> validarModoScape();

  //QUEBRA O ARQUIVO EM DETERMINADA QUANTIDADE DE LINHAS
  List<List<String>> dividirArquivoPorLinhas(
    List<String> linhas,
    int qtdLinhaPorGrupo,
  );

  Future<bool> validarComando(String comando);

  Future<String> enviarComando(String comando);

  Future<String> buscarSerial();
  Future<double> buscarVersaoEsp();
}
