// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:wizard_app/app/data/services/ordem_servico/ordem_servico_service.dart';
import 'package:wizard_app/app/domain/models/ordem_servico/ordem_servico.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/command.dart';

import '../../../../core/utils/result.dart';

class OrdemServicoViewModel extends ChangeNotifier {
  OrdemServicoService ordemServicoService;
  late Command0 buscarOS;
  OrdemServicoViewModel({required this.ordemServicoService}) {
    buscarOS = Command0<void>(_buscarOS);
  }
  List<OrdemServico> get listaOrdemServico => _listOS;
  List<OrdemServico> _listOS = [];
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
}
