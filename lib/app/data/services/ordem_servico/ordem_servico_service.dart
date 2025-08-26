import 'dart:typed_data';

import 'package:wizard_app/app/domain/models/checklist/checklist.dart';

import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/utils/result.dart';
import '../../../domain/models/etapas_ordem_servico/etapas_ordem_servico.dart';
import '../../../domain/models/ordem_servico/ordem_servico.dart'
    show OrdemServico;

abstract class OrdemServicoService {
  Future<Result<List<OrdemServico>, ExceptionApp>> buscarOrdemServico();
  Future<Result<List<EtapasOrdemServico>, ExceptionApp>>
  buscarEtapasOrdemServico();
  Future<Result<CheckList, ExceptionApp>> buscarCheckist();
  Future<Result<Uint8List, ExceptionApp>> buscarPdf();
}
