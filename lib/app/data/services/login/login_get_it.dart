import 'package:wizard_app/app/data/dao/usuario/usuario_dao.dart';
import 'package:wizard_app/app/data/repositories/login/amplify_repository.dart';
import 'package:wizard_app/app/data/repositories/login/amplify_repository_impl.dart';
import 'package:wizard_app/app/data/services/login/login_service.dart';
import 'package:wizard_app/app/data/services/login/login_service_impl.dart';
import 'package:wizard_app/app/ui/login/view_model/esqueci_senha_view_model.dart';
import 'package:wizard_app/app/ui/login/view_model/login_view_model.dart';
import 'package:wizard_app/app/ui/login/view_model/troca_senha_view_model.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';

class LoginGetIt {
  LoginGetIt._internal();
  static final instance = LoginGetIt._internal();
  registrarLoginGetIt() {
    getIt.registerFactory<AmplifyRepository>(() => AmplifyRepositoryImpl());
    getIt.registerFactory<LoginService>(
      () => LoginServiceImpl(
        amplifyRepository: getIt<AmplifyRepository>(),
        usuarioDAO: getIt<UsuarioDAO>(),
      ),
    );
    getIt.registerLazySingleton<LoginViewModel>(
      () => LoginViewModel(loginService: getIt()),
    );
    getIt.registerLazySingleton<TrocaSenhaViewModel>(
      () => TrocaSenhaViewModel(loginService: getIt()),
    );
    getIt.registerLazySingleton<EsqueciSenhaViewModel>(
      () => EsqueciSenhaViewModel(loginService: getIt()),
    );
    getIt.registerLazySingleton<UsuarioDAO>(() => UsuarioDAO());
  }
}
