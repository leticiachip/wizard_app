import 'package:wizard_app/app/domain/models/usuario/usuario.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/result.dart';

abstract class UsuarioService {
  Future<Result<Usuario?, ExceptionApp>> buscarDadosUsuario();
}
