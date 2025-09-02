import 'package:wizard_app/app/data/repositories/usuario/usuario_repository.dart';
import 'package:wizard_app/app/data/repositories/usuario/usuario_repository_impl.dart';
import 'package:wizard_app/app/data/services/usuario/usuario_service.dart';
import 'package:wizard_app/app/data/services/usuario/usuario_service_impl.dart';
import 'package:wizard_app/app/ui/usuario/view_model/usuario_view_model.dart';
import 'package:wizard_app/core/requisicao_app/services/central_download_service.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';

class UsuarioGetIt {
  UsuarioGetIt._internal();

  static final instance = UsuarioGetIt._internal();

  registrarUsuarioGetIt() {
    getIt.registerLazySingleton<UsuarioRepository>(
      () => UsuarioRepositoryImpl(
        centralDownloadService: getIt<CentralDownloadService>(),
      ),
    );

    getIt.registerLazySingleton<UsuarioService>(
      () => UsuarioServiceImpl(usuarioRepository: getIt<UsuarioRepository>()),
    );

    getIt.registerLazySingleton<UsuarioViewModel>(
      () => UsuarioViewModel(usuarioService: getIt<UsuarioService>()),
    );
  }
}
