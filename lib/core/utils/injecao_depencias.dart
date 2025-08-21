import 'package:get_it/get_it.dart' show GetIt;
import 'package:wizard_app/app/data/services/atualizador_connectbus/atualizador_connectbus_getit.dart';
import 'package:wizard_app/app/data/services/atualizador_esp/atualizador_getit.dart';
import 'package:wizard_app/app/data/services/configuracoes/configuracoes_get_it.dart';
import 'package:wizard_app/app/data/services/home/home_get_it.dart';
import 'package:wizard_app/app/data/services/login/login_get_it.dart';
import 'package:wizard_app/core/requisicao_app/services/central_requisicao_get_it.dart';
import 'package:wizard_app/core/services/permission_get_it.dart';
import 'package:wizard_app/core/services/shared_preferences/shared_preferences_getit.dart';

import '../../app/data/services/bluetooth/bluetooth_get_it.dart'
    show BluetoothGetIt;

final getIt = GetIt.instance;

void setupDependencias() {
  LoginGetIt.instance.registrarLoginGetIt();
  ConfiguracoesGetIt.instance.registrarConfiguracoesGetIt();
  BluetoothGetIt.instance.registrarBluetoothGetIt();
  PermissionGetIt.instance.registrarPermissionGetIt();
  HomeGetIt.instance.registrarHomeGetIt();
  CentralRequisicaoGetIt.instance.registrarCentralReq();
  AtualizadorGetit.instance.registrarAtualizadorGetit();
  SharedPreferencesGetit.instance.registrarSharedPrefences();
  AtualizadorConnectbusGetit.instance.registrarAtualizadorConnectbusGetit();
}
