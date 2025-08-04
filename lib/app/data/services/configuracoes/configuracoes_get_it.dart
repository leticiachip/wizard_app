import 'package:wizard_app/app/data/services/configuracoes/configuracoes_service.dart';
import 'package:wizard_app/app/data/services/configuracoes/configuracoes_service_impl.dart';
import 'package:wizard_app/app/data/services/login/login_service.dart';
import 'package:wizard_app/app/ui/configuracoes/view_model/configuracoes_view_model.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';

class ConfiguracoesGetIt {
  ConfiguracoesGetIt._internal();
  static final instance = ConfiguracoesGetIt._internal();
  registrarConfiguracoesGetIt() {
    getIt.registerFactory<ConfiguracoesService>(
      () => ConfiguracoesServiceImpl(loginService: getIt<LoginService>()),
    );
    getIt.registerFactory<ConfiguracoesViewModel>(
      () => ConfiguracoesViewModel(
        configuracoesService: getIt<ConfiguracoesService>(),
      ),
    );
  }
}
