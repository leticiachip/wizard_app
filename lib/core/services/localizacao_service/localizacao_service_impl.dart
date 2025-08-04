import 'package:wizard_app/core/services/localizacao_service/localizacao_service.dart';
import 'package:wizard_app/core/services/permission_services/permission_handler_service.dart';

class LocalizacaoServiceImpl implements LocalizacaoService{
  final PermissionHandlerService permissionHandlerService;

  LocalizacaoServiceImpl({required this.permissionHandlerService});
  @override
  Future<bool> solicitarLocalizacao() async{
   return await permissionHandlerService.permissaoLocalizacaoPrimeiroPlano();
  }
}