import 'package:wizard_app/app/data/repositories/login/amplify_repository.dart';
import 'package:wizard_app/app/data/services/login/enum_result_login.dart';
import 'package:wizard_app/app/data/services/login/exception_login.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/result.dart';

class FakeAmplifyRepositoryImpl implements AmplifyRepository {
  @override
  Future<Result<EnumResultLogin, ExceptionLogin>> autenticarUsuario(
    String email,
    String senha,
  ) {
    // TODO: implement autenticarUsuario
    throw UnimplementedError();
  }

  @override
  Future<Result<Map<String, dynamic>, ExceptionLogin>> buscarIdToken() async {
    Map<String, dynamic> parse = {
      "sub": "b42c836b-372b-4d00-800a-7fba7c30fdbd",
      "loginId": "90184",
      "email_verified": true,
      "address": {
        "formatted":
            "AV. HUMBERTO MARTIGNONE, 738 - VILA CANTIZANI, PIRAJU - SP",
      },
      "iss": "https://cognito-idp.sa-east-1.amazonaws.com/sa-east-1_a6yhg64Ue",
      "cognito:username": "b42c836b-372b-4d00-800a-7fba7c30fdbd",
      "locale": "pt-BR",
      "userId": "2",
      "origin_jti": "eb8cb55b-1907-4990-81c7-cc6ae1098848",
      "aud": "7mcbdv389vervgs6inrgu8dtfr",
      "event_id": "cd8c75ee-1ac1-4947-9d18-1aef84fc2388",
      "token_use": "id",
      "auth_time": 1754596678,
      "name": "LETICIA  DAMASCENO",
      "phone_number": "+5514000000002",
      "scopes":
          "https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_servico_localizacao https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_empresa_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_veiculo_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_usuario_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_usuario_cargo_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_usuario_foto_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_configuracao_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_contato_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_evento_categoria_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_evento_tipo_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_notificacao_tipo_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_jornada https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_jornada_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_jornada_evento https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_jornada_evento_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_notificacao https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_notificacao_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_jornada_justificativa https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_jornada_justificativa_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_vistoria_imagem_lista_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_vistoria_imagem_item_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_vistoria https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_vistoria_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_vistoria_item https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_vistoria_item_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_vistoria_pneu_condicao_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_vistoria_pneu https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_vistoria_pneu_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_vistoria_vetor_defeito_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_vistoria_vetor https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_vistoria_vetor_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_vistoria_foto https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_usuario_foto_lista_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_usuario_foto_item_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_alerta_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_alerta https://api-driverlog.chiptronicsciencetelematic.com.br/post:app_sincronismo_get https://api-driverlog.chiptronicsciencetelematic.com.br/put:app_sincronismo https://api-driverlog.chiptronicsciencetelematic.com.br/post:driver_trip_event_get https://api-driverlog.chiptronicsciencetelematic.com.br/post:driver_trip_get",
      "exp": 1754683081,
      "iat": 1754596681,
      "jti": "4bd3fe9b-e32d-4739-9824-4b20a6cce206",
      "email": "leticiadamasceno@chiptronic.com.br",
    };
    if (parse.isEmpty) {
      return Failure(
        ExceptionLogin(
          descricao: "Não foi possivel obter idToken",
          detalhes: "id token esta vazio",
        ),
      );
    }
    return Success(parse);
  }

  @override
  Future<Result<String, ExceptionApp>> buscarToken() {
    // TODO: implement buscarToken
    throw UnimplementedError();
  }

  @override
  Future<bool> buscarUsuarioLogado() {
    // TODO: implement buscarUsuarioLogado
    throw UnimplementedError();
  }

  @override
  Future<void> configurarAmplify() {
    // TODO: implement configurarAmplify
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, ExceptionApp>> confirmarTrocaSenha(String senha) {
    // TODO: implement confirmarTrocaSenha
    throw UnimplementedError();
  }

  @override
  Future<Result<String, ExceptionApp>> envioEmailSenha(String email) {
    // TODO: implement envioEmailSenha
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, ExceptionApp>> resetarSenha(
    String email,
    String senha,
    String codigoConfirmacao,
  ) {
    // TODO: implement resetarSenha
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, ExceptionLogin>> signout() {
    // TODO: implement signout
    throw UnimplementedError();
  }
}
