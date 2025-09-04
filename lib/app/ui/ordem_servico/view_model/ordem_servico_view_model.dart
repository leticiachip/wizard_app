import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wizard_app/app/data/services/ordem_servico/ordem_servico_service.dart';
import 'package:wizard_app/app/domain/models/ordem_servico/ordem_servico.dart';
import 'package:wizard_app/app/domain/models/ordem_servico/workflow.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/command.dart';

import '../../../../core/utils/result.dart';

class OrdemServicoViewModel extends ChangeNotifier {
  OrdemServicoService ordemServicoService;
  late Command0 buscarOS;
  late Command0 buscarWorflow;
  late Command0 buscarManual;
  OrdemServicoViewModel({required this.ordemServicoService}) {
    buscarOS = Command0<void>(_buscarOS);
    buscarManual = Command0<void>(_buscarPdf);
    buscarWorflow = Command0<void>(_buscarWorkflowOrdemServico);
  }
  List<OrdemServico> get listaOrdemServico => _listOS;
  List<OrdemServico> _listOS = [];
  List<Workflow> _workflowOS = [];
  List<Workflow> get workflowOS => _workflowOS;
  Uint8List get bytesArquivoPdf => _bytes;
  late Uint8List _bytes;
  ExceptionApp get exceptionApp => _exceptionApp;
  late ExceptionApp _exceptionApp;

  Future<Result<List<OrdemServico>, ExceptionApp>> _buscarOS() async {
    Result<List<OrdemServico>, ExceptionApp> resultOrdemServico =
        await ordemServicoService.buscarOrdemServico();
    if (resultOrdemServico.isError) {
      _exceptionApp = resultOrdemServico.exceptionOrNull()!;
      notifyListeners();
      return Failure(_exceptionApp);
    }
    _listOS = resultOrdemServico.getOrNull()!;
    notifyListeners();
    return Success(_listOS);
  }

  Future<Result<List<Workflow>, ExceptionApp>>
  _buscarWorkflowOrdemServico() async {
    Result<List<Workflow>, ExceptionApp> resultWorflow =
        await ordemServicoService.buscarWorflow();
    if (resultWorflow.isError) {
      _exceptionApp = resultWorflow.exceptionOrNull()!;
      notifyListeners();
      return Failure(_exceptionApp);
    }
    _workflowOS = resultWorflow.getOrNull()!;

    notifyListeners();
    return Success(_workflowOS);
  }

  Future<Result<Uint8List, ExceptionApp>> _buscarPdf() async {
    Result<Uint8List, ExceptionApp> resultManual = await ordemServicoService
        .buscarPdf();
    if (resultManual.isError) {
      _exceptionApp = resultManual.exceptionOrNull()!;
      notifyListeners();
      return Failure(_exceptionApp);
    }
    _bytes = resultManual.getOrNull()!;
    notifyListeners();
    return Success(_bytes);
  }
}
