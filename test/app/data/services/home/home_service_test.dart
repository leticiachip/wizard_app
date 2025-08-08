import 'package:flutter_test/flutter_test.dart';
import 'package:wizard_app/app/adapter/diretorio_adapter.dart';
import 'package:wizard_app/app/adapter/image_picker_adapter.dart';
import 'package:wizard_app/app/data/services/home/home_service_impl.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart'
    show ExceptionApp;
import 'package:wizard_app/core/utils/result.dart';

import '../../repositories/login/fake_amplify_repository.dart';

int add(int a, int b) {
  return a + b;
}

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
      "nome": "Elemento 3",
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
      "nome": "Elemento 4",
      "rotas": ["post:app_notificacao"],
    },
    {
      "id": "elemento5",
      "nome": "Elemento 5",
      "rotas": ["post:driver_trip_event_get", "post:driver_trip_get"],
    },
  ],
};

List<Map<String, dynamic>> compararRotas(List<String> lista) {
  List<Map<String, dynamic>> recursosPermitidos = [];

  for (var recursos in _rotasReferencia['recursos']) {
    bool todasRotasEncontradas = recursos['rotas'].every(
      (rota) => lista.contains(rota),
    );
    if (todasRotasEncontradas) {
      recursosPermitidos.add({"id": recursos["id"], "nome": recursos['nome']});
    }
  }
  return recursosPermitidos;
}

void main() {
  group('start teste de permissões', () {
    test(('vir apenas rotas existentes'), () async {
      final homeService = HomeServiceImpl(
        amplifyRepository: FakeAmplifyRepositoryImpl(),
        diretorioAdapter: DiretorioAdapter(),
        imagePickerAdapter: ImagePickerAdapter(),
      );
      Result<List<String>, ExceptionApp> resultado = await homeService
          .buscarPermissoes();

      if (resultado.isError) {
        expect(resultado.isError, isTrue);
      }
      if (resultado.isSuccess) {
        var resultadoComponentes = compararRotas(resultado.getOrNull()!);

        expect(resultadoComponentes, [
          {"id": "elemento1", "nome": "Configurações"},
          {"id": "elemento2", "nome": "Capturar imagem"},
          {"id": "elemento3", "nome": "Elemento 3"},
          {"id": "elemento4", "nome": "Elemento 4"},
          {"id": "elemento5", "nome": "Elemento 5"},
        ]);
      }
    });
    test(('Erro dados retornados'), () async {
      final homeService = HomeServiceImpl(
        amplifyRepository: FakeAmplifyRepositoryImpl(),
        diretorioAdapter: DiretorioAdapter(),
        imagePickerAdapter: ImagePickerAdapter(),
      );
      Result<List<String>, ExceptionApp> resultado = await homeService
          .buscarPermissoes();

      if (resultado.isError) {
        expect(resultado.isError, isTrue);
      }
      if (resultado.isSuccess) {
        var resultadoComponentes = compararRotas(resultado.getOrNull()!);

        expect(resultadoComponentes, [
          {"id": "elemento1", "nome": "Configurações"},
          {"id": "elemento2", "nome": "Capturar imagem"},
          {"id": "elemento3", "nome": "Elemento 3"},
          {"id": "elemento4", "nome": "Elemento 4"},
        ]);
      }
    });
  });
}
