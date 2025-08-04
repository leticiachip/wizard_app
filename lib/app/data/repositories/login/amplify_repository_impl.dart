import 'package:result_dart/result_dart.dart' show Failure, ResultDart, Success;
import 'package:wizard_app/app/data/repositories/login/amplify_repository.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:wizard_app/app/data/utils/parse_jwt.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';

import '../../../../amplifyconfiguration.dart' show amplifyconfig;
import '../../services/login/enum_result_login.dart';
import '../../services/login/exception_login.dart';

class AmplifyRepositoryImpl implements AmplifyRepository {
  @override
  Future<ResultDart<EnumResultLogin, ExceptionLogin>> autenticarUsuario(
    String email,
    String senha,
  ) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: email,
        password: senha,
      );
      String nextStep = result.nextStep.signInStep.name;
      if (nextStep.contains('confirmSignInWithNewPassword')) {
        return Success(EnumResultLogin.trocaSenha);
      }
      return Success(EnumResultLogin.prosseguir);
    } on NotAuthorizedServiceException catch (e, stack) {
      var exception = ExceptionLogin(
        descricao: "NotAuthorizedServiceException",
        detalhes: "$e$stack",
      );
      switch (e.message) {
        case 'Incorrect username or password.':
          exception = ExceptionLogin(
            descricao: "Usuário ou senha incorreto",
            detalhes: '$e$stack',
          );
          break;
        case 'Password attempts exceeded.':
          exception = ExceptionLogin(
            descricao: "Tentativas excedidas",
            detalhes: '$e$stack',
          );
          break;
        case 'Unable to resolve host.':
          exception = ExceptionLogin(
            descricao: "Não foi possivel acessar o host",
            detalhes: '$e$stack',
          );
          break;
        case 'Unable to execute HTTP request: failed to connect.':
          exception = ExceptionLogin(
            descricao: "Serviço offline",
            detalhes: '$e$stack',
          );
          break;
        case 'Unable to execute HTTP request: timeout.':
          exception = ExceptionLogin(
            descricao: "Tempo excedido",
            detalhes: '$e$stack',
          );
          break;
        case 'Temporary password has expired and must be reset by an administrator.':
          exception = ExceptionLogin(
            descricao: "Senha inválida, entre em contato com o suporte",
            detalhes: '$e$stack',
          );
          break;
        case 'Password attempts exceeded':
          exception = ExceptionLogin(
            descricao: "Tentativas de senha excedidas",
            detalhes: "$e$stack",
          );
          break;
      }
      return Failure(exception);
    } on NetworkException catch (e, stack) {
      return Failure(
        ExceptionLogin(
          descricao: "Verifique a conexão com a internet",
          detalhes: '$e$stack',
        ),
      );
    } on AuthException catch (e, stack) {
      var exception = ExceptionLogin(
        descricao: "Não rastreado",
        detalhes: "$e$stack",
      );
      switch (e.message) {
        case 'A user is already signed in.':
          exception = ExceptionLogin(
            descricao: 'O usuário já esta logado',
            detalhes: '$e$stack',
          );
          break;
        case 'Sign in failed':
          exception = ExceptionLogin(
            descricao: 'Usuário ou senha não existem',
            detalhes: '$e$stack',
          );
          break;
        case 'Missing required parameter USERNAME':
          exception = ExceptionLogin(
            descricao: 'Digite o email',
            detalhes: '$e$stack',
          );
          break;
        case 'No password given':
          exception = ExceptionLogin(
            descricao: 'Forneça a sua senha para continuar',
            detalhes: '$e$stack',
          );
          break;
        case 'unauthorized':
          exception = ExceptionLogin(
            descricao: 'Usuário não autorizado',
            detalhes: '$e$stack',
          );
          break;
      }
      return Failure(exception);
    } catch (e, stack) {
      return Failure(
        ExceptionLogin(
          descricao: "Falha ao realizar login",
          detalhes: "$e$stack",
        ),
      );
    }
  }

  @override
  Future<void> configurarAmplify() async {
    if (!Amplify.isConfigured) {
      try {
        final auth = AmplifyAuthCognito();
        await Amplify.addPlugin(auth);
        await Amplify.configure(amplifyconfig);
      } on Exception catch (e) {
        print('erro ao configurar amplify: $e');
      }
    }
  }

  @override
  Future<bool> buscarUsuarioLogado() async {
    final AuthSession result = await Amplify.Auth.fetchAuthSession();
    result as CognitoAuthSession;
    return result.isSignedIn;
  }

  @override
  Future<ResultDart<bool, ExceptionLogin>> signout() async {
    try {
      await Amplify.Auth.signOut(
        options: const SignOutOptions(globalSignOut: true),
      );
      return Success(true);
    } catch (e, stack) {
      return Failure(
        ExceptionLogin(
          descricao: 'Não foi possível deslogar',
          detalhes: '$e,$stack',
        ),
      );
    }
  }

  @override
  Future<ResultDart<Map<String, dynamic>, ExceptionLogin>>
  buscarIdToken() async {
    try {
      AuthSession result = await Amplify.Auth.fetchAuthSession(
        options: FetchAuthSessionOptions(forceRefresh: true),
      );
      result as CognitoAuthSession;
      Map<String, dynamic> mapJwt = parseJwt(
        result.userPoolTokensResult.value.idToken.toJson(),
      );

      /* String scopes = mapJwt['scopes'];
      scopes.split(' '); */
      // log("---->> scopes $scopes");

      return Success(mapJwt);
    } catch (e) {
      return Failure(
        ExceptionLogin(
          descricao: 'Não foi possivel obter rotas scopes',
          detalhes: '$e',
        ),
      );
    }
  }

  @override
  Future<ResultDart<String, ExceptionApp>> buscarToken() async {
    try {
      AuthSession result = await Amplify.Auth.fetchAuthSession(
        options: FetchAuthSessionOptions(forceRefresh: true),
      );
      result as CognitoAuthSession;
      String acessToken = result.userPoolTokensResult.value.accessToken
          .toJson();

      return Success(acessToken);
    } catch (e) {
      return Failure(ExceptionApp(descricao: "token", detalhes: "$e"));
    }
  }

  @override
  Future<ResultDart<bool, ExceptionApp>> confirmarTrocaSenha(
    String senha,
  ) async {
    try {
      final result = await Amplify.Auth.confirmSignIn(confirmationValue: senha);
      return Success(result.isSignedIn);
    } catch (e) {
      return Failure(
        ExceptionApp(descricao: "Falha ao trocar a senha", detalhes: "$e"),
      );
    }
  }

  @override
  Future<ResultDart<bool, ExceptionApp>> resetarSenha(
    String email,
    String senha,
    String codigoConfirmacao,
  ) async {
    try {
      await Amplify.Auth.confirmResetPassword(
        username: email,
        newPassword: senha,
        confirmationCode: codigoConfirmacao,
      );
      return Success(true);
    } catch (e) {
      return Failure(
        ExceptionApp(
          descricao: 'Não foi possível resetar a senha ',
          detalhes: '$e',
        ),
      );
    }
  }

  @override
  Future<ResultDart<String, ExceptionApp>> envioEmailSenha(String email) async {
    try {
      final result = await Amplify.Auth.resetPassword(username: email);
      return Success(result.nextStep.updateStep.name);
    } catch (e) {
      return Failure(
        ExceptionApp(
          descricao: "Não foi possível enviar email",
          detalhes: "$e",
        ),
      );
    }
  }
}
