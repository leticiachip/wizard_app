import 'package:flutter/material.dart';
import 'package:wizard_app/app/data/services/home/home_service.dart';
import 'package:wizard_app/core/utils/result.dart';

import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/utils/command.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeService homeService;
  late Command0 buscaPermissao;
  HomeViewModel({required this.homeService}) {
    buscaPermissao = Command0<void>(buscarPermissaoExibicaoComponentes);
  }
  List<Map<String, dynamic>> recursosPermitidos = [];
  ExceptionApp get exceptionApp => _exceptionApp;
  late ExceptionApp _exceptionApp;

  final Map<String, dynamic> _rotasReferencia = {
    "recursos": [
      {
        "id": "elemento1",
        "nome": "Configurações",
        "rotas": [
          "post:app_empresa_get",
          "post:app_veiculo_get",
          "post:app_usuario_get",
        ],
      },
      {
        "id": "elemento2",
        "nome": "Capturar imagem",
        "rotas": [
          "post:app_usuario_foto_get",
          "post:app_configuracao_get",
          "post:app_contato_get",
          "post:app_evento_categoria_get",
        ],
      },
      {
        "id": "elemento3",
        "nome": "Ordem de serviço",
        "rotas": [
          "post:app_evento_tipo_get",
          "post:app_notificacao_tipo_get",
          "post:app_jornada",
          "post:app_jornada_get",
          "post:app_jornada_evento_get",
        ],
      },
      {
        "id": "elemento4",
        "nome": "Atualizador ESP",
        "rotas": ["post:app_notificacao"],
      },
      {
        "id": "elemento5",
        "nome": "Atualização connect teste",
        "rotas": ["post:driver_trip_event_get", "post:driver_trip_get"],
      },
    ],
  };

  Future<Result<List<String>, ExceptionApp>>
  buscarPermissaoExibicaoComponentes() async {
    Result<List<String>, ExceptionApp> resultPermissao = await homeService
        .buscarPermissoes();
    if (resultPermissao.isSuccess) {
      List<String> listaScope = resultPermissao.getOrNull()!;
      compararRotas(listaScope);
    }
    if (resultPermissao.isError) {
      _exceptionApp = resultPermissao.exceptionOrNull()!;
    }

    notifyListeners();
    return resultPermissao;
  }

  Future<void> compararRotas(List<String> lista) async {
    recursosPermitidos.clear();

    for (var recursos in _rotasReferencia['recursos']) {
      bool todasRotasEncontradas = recursos['rotas'].every(
        (rota) => lista.contains(rota),
      );
      if (todasRotasEncontradas) {
        recursosPermitidos.add({
          "id": recursos["id"],
          "nome": recursos['nome'],
        });
      }
    }
    notifyListeners();
  }

  capturarImagem()async{
    await homeService.capturarImagem();
  }
}
