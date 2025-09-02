import 'package:flutter/material.dart';
import 'package:wizard_app/app/data/services/usuario/usuario_service.dart';
import 'package:wizard_app/app/domain/models/usuario/usuario.dart';
import 'package:wizard_app/core/const/codigo_rastreio.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/command.dart';
import 'package:wizard_app/core/utils/result.dart';

class UsuarioViewModel extends ChangeNotifier {
  final UsuarioService usuarioService;
  late Command0 buscarUsuario;
  UsuarioViewModel({required this.usuarioService}) {
    buscarUsuario = Command0<void>(_buscarUser);
  }

  late Usuario _usuario;
  Usuario get usuario => _usuario;

  
  Future<Result<Usuario?, ExceptionApp>> _buscarUser() async {
    Result<Usuario?, ExceptionApp> result = await usuarioService
        .buscarDadosUsuario();
    if (result.isError) {
      return Failure(result.exceptionOrNull()!);
    }
    Usuario? usuarioRecebido = result.getOrNull();
    if(usuarioRecebido == null){
      return Failure(ExceptionApp(descricao: "O usuário esta nulo", detalhes: "O retorno da requisição veio nulo, nenhum usuario foi encontrado", rastreio: "${CodigoRastreio.usuario}.1"));
    }
    _usuario = usuarioRecebido;
    notifyListeners();
    return Success(usuarioRecebido);
  }
}
