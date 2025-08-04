import 'package:wizard_app/core/requisicao_app/central_requisicao.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';

class CentralRequisicaoGetIt {
  CentralRequisicaoGetIt._internal();
  static final instance = CentralRequisicaoGetIt._internal();
  registrarCentralReq(){
    getIt.registerLazySingleton<CentralRequisicao>(() => CentralRequisicao());
  }
}