import 'package:wizard_app/app/data/repositories/usuario/usuario_repository.dart';
import 'package:wizard_app/app/data/services/atualizador_esp/atualizador_esp_service.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';
import 'package:wizard_app/app/data/services/configuracoes_iniciais/configuracoes_iniciais_service.dart';
import 'package:wizard_app/app/data/services/configuracoes_iniciais/configuracoes_iniciais_service_impl.dart';
import 'package:wizard_app/app/ui/configuracoes_iniciais/view_model/configuracoes_iniciais_view_model.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';

class ConfiguracoesIniciaisGetIt {
  ConfiguracoesIniciaisGetIt._internal();
  static final instance = ConfiguracoesIniciaisGetIt._internal();

  registrarConfiguracoesInciais() {
    getIt.registerFactory<ConfiguracoesIniciaisViewModel>(
      () => ConfiguracoesIniciaisViewModel(
        configuracoesIniciaisService: getIt<ConfiguracoesIniciaisService>(),
        atualizadorEspService: getIt<AtualizadorEspService>(),
        bluetoothAppService: getIt<BluetoothAppService>(instanceName: 'classic'),
      ),
    );
    getIt.registerFactory<ConfiguracoesIniciaisService>(
      () => ConfiguracoesIniciaisServiceImpl(
        usuarioRepository: getIt<UsuarioRepository>(),
      ),
    );
  }
}
