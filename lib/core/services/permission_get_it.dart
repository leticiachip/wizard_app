import 'package:wizard_app/core/utils/injecao_depencias.dart';
import 'package:wizard_app/core/services/permission_services/permission_handler_service.dart';
import 'package:wizard_app/core/services/permission_services/permission_handler_service_impl.dart';

class PermissionGetIt {
  PermissionGetIt._internal();
  static final instance = PermissionGetIt._internal();
  registrarPermissionGetIt() {
    getIt.registerFactory<PermissionHandlerService>(
      () => PermissionHandlerServiceImpl(),
    );
  }
}
