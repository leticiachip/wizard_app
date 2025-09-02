import 'package:wizard_app/core/services/marca_dagua/marca_dagua_service.dart';
import 'package:wizard_app/core/services/marca_dagua/marca_dagua_service_impl.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';

class MarcaDaguaGetIt {
  MarcaDaguaGetIt.internal();
  static final instance = MarcaDaguaGetIt.internal();

  registrarMarcaDagua() {
    getIt.registerLazySingleton<MarcaDaguaService>(
      () => MarcaDaguaServiceImpl(),
    );
  }
}
