import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wizard_app/app/data/services/ordem_servico/ordem_servico_service.dart';
import 'package:wizard_app/app/domain/models/checklist/checklist.dart';
import 'package:wizard_app/app/domain/models/etapas_ordem_servico/etapas_ordem_servico.dart';
import 'package:wizard_app/app/domain/models/ordem_servico/ordem_servico.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/command.dart';

import '../../../../core/utils/result.dart';

class OrdemServicoViewModel extends ChangeNotifier {
  OrdemServicoService ordemServicoService;
  late Command0 buscarOS;
  late Command0 buscarEtpasOS;
  late Command0 buscarCheckList;
  late Command0 buscarManual;
  OrdemServicoViewModel({required this.ordemServicoService}) {
    buscarOS = Command0<void>(_buscarOS);
    buscarEtpasOS = Command0<void>(_buscarEtapas);
    buscarCheckList = Command0<void>(_buscarCheck);
     buscarManual = Command0<void>(_buscarPdf);
  }

  List<OrdemServico> get listaOrdemServico => _listOS;
  List<OrdemServico> _listOS = [];
  List<EtapasOrdemServico> get listaEtapaOS => _listaEtapas;
  Uint8List get bytesArquivoPdf => _bytes;
  late Uint8List _bytes;
  List<EtapasOrdemServico> _listaEtapas = [];
  ExceptionApp get exceptionApp => _exceptionApp;
  late ExceptionApp _exceptionApp;
  CheckList get checkList => _checkListOS;
  late CheckList _checkListOS;

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

  Future<Result<List<EtapasOrdemServico>, ExceptionApp>> _buscarEtapas() async {
    Result<List<EtapasOrdemServico>, ExceptionApp> resultEtapas =
        await ordemServicoService.buscarEtapasOrdemServico();
    if (resultEtapas.isError) {
      _exceptionApp = resultEtapas.exceptionOrNull()!;
      notifyListeners();
      return Failure(_exceptionApp);
    }
    _listaEtapas = resultEtapas.getOrNull()!;
    notifyListeners();
    return Success(_listaEtapas);
  }

  Future<Result<CheckList, ExceptionApp>> _buscarCheck() async {
    Result<CheckList, ExceptionApp> resultCheckList = await ordemServicoService
        .buscarCheckist();
    if (resultCheckList.isError) {
      _exceptionApp = resultCheckList.exceptionOrNull()!;
      notifyListeners();
      return Failure(_exceptionApp);
    }
    _checkListOS = resultCheckList.getOrNull()!;
    print("---->> $_checkListOS");
    notifyListeners();
    return Success(_checkListOS);
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
