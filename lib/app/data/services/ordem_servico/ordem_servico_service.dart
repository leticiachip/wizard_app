import 'dart:typed_data';


import 'package:wizard_app/app/domain/models/ordem_servico/workflow.dart';

import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/utils/result.dart';
import '../../../domain/models/ordem_servico/ordem_servico.dart'
    show OrdemServico;

abstract class OrdemServicoService {
  Future<Result<List<OrdemServico>, ExceptionApp>> buscarOrdemServico();
Future<Result<List<Workflow>, ExceptionApp>> buscarWorflow();
  Future<Result<Uint8List, ExceptionApp>> buscarPdf();
  //Future<Result<TipoOrdemServico, ExceptionApp>> buscarOrdemServicoEspecifico();
}
