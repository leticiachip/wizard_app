import 'dart:developer';

import 'package:wizard_app/app/data/dao/usuario/usuario_dao.dart';
import 'package:wizard_app/app/data/repositories/login/amplify_repository.dart';
import 'package:wizard_app/app/data/services/login/enum_result_login.dart';
import 'package:wizard_app/app/data/services/login/exception_login.dart';
import 'package:wizard_app/app/data/services/login/login_service.dart';
import 'package:wizard_app/core/const/regex.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/result.dart';

import '../../../domain/models/usuario/usuario.dart';

class LoginServiceImpl implements LoginService {
  final AmplifyRepository amplifyRepository;
  final UsuarioDAO usuarioDAO;
  LoginServiceImpl({required this.amplifyRepository, required this.usuarioDAO});

  @override
  Future<bool> validaUsuarioLogado() async {
    return await amplifyRepository.buscarUsuarioLogado();
  }

  @override
  Future<void> initAmplify() async {
    await amplifyRepository.configurarAmplify();
  }

  @override
  Future<Result<EnumResultLogin, ExceptionLogin>> login(
    String email,
    String senha,
  ) async {
    Result<EnumResultLogin, ExceptionLogin> resultAutenticacao =
        await amplifyRepository.autenticarUsuario(email, senha);
    await buscaridToken();
    return resultAutenticacao;
  }

  @override
  Future<Result<bool, ExceptionLogin>> deslogarUsuario() async {
    try {
      bool usuarioLogado = await validaUsuarioLogado();
      if (usuarioLogado) {
        Result<bool, ExceptionLogin> resultadoLogout =
            await amplifyRepository.signout();
        return Success(resultadoLogout.getOrNull()!);
      }
      return Success(false);
    } catch (e, stack) {
      return Failure(
        ExceptionLogin(
          descricao: 'Não foi possível validar para sair deslogar',
          detalhes: '$e,$stack',
        ),
      );
    }
  }

  @override
  Future<Result<String, ExceptionApp>> token() async {
    Result<String, ExceptionApp> resultToken = await amplifyRepository
        .buscarToken();

    return resultToken;
  }

  @override
  Future<Result<bool, ExceptionApp>> trocarSenhaPrimeiroUso(String senha) {
    return amplifyRepository.confirmarTrocaSenha(senha);
  }

  @override
  Future<Result<bool, ExceptionApp>> confirmarTrocaSenha(
    String usuario,
    String senha,
    String codigo,
  ) {
    return amplifyRepository.resetarSenha(usuario, senha, codigo);
  }

  @override
  Future<Result<String, ExceptionApp>> enviarEmailResetSenha(String email) {
    return amplifyRepository.envioEmailSenha(email);
  }

  @override
  String? regexEmail(String? input) {
    final RegExp regExp = RegExp(RegexAuthConstants.email);
    if (input == null) {
      return null;
    }
    if (input.isEmpty) {
      return null;
    }
    if (!regExp.hasMatch(input)) {
      return "Emal inválido";
    }

    return null;
  }

  @override
  String? regexSenha(String? input) {
    final verificarCarac = RegExp(r'^[a-zA-Z]+$');
    if (input == null) {
      return null;
    }
    if (input.isEmpty) {
      return null;
    }
    if (verificarCarac.hasMatch(input) ||
        input.toUpperCase() == input ||
        !input.contains(RegExp(r'[0-9]')) ||
        input.length <= 8) {
      return "Senha inválida";
    }

    return null;
  }

  @override
  Future<Result<Map<String, dynamic>, ExceptionLogin>>
  buscaridToken() async {
    Result<Map<String, dynamic>, ExceptionLogin> idToken =
        await amplifyRepository.buscarIdToken();
    if (idToken.isSuccess) {
      log("----->>> inserir dados");
      Map<String, dynamic> token = idToken.getOrNull()!;
      Map<String, dynamic> address = token['address'];
      var usuario = Usuario(
        id: token['userId'],
        nome: token['name'],
        telefone: token['phone_number'],
        endereco: address.values.first,
      );
      await usuarioDAO.inserirUsuario(usuario);
      log("${await usuarioDAO.buscarUsuario()}");
    }
    return idToken;
  }
}
