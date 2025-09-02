import 'package:wizard_app/app/data/repositories/usuario/usuario_repository.dart';
import 'package:wizard_app/app/data/services/usuario/usuario_service.dart';
import 'package:wizard_app/app/domain/models/usuario/usuario.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/result.dart';

class UsuarioServiceImpl implements UsuarioService {
  final UsuarioRepository usuarioRepository;
  UsuarioServiceImpl({required this.usuarioRepository});
  @override
  Future<Result<Usuario?, ExceptionApp>> buscarDadosUsuario() async {
    var result = await usuarioRepository.buscarUsuario();
    if (result.isError) {
      return Failure(result.exceptionOrNull()!);
    }
    Map<String, dynamic> body = result.getOrNull()!.body!['data'];
    if (body['usuario'] == null) {
      return Success(null);
    }
    Usuario usuario = Usuario.fromJson(body['usuario']);
    return Success(usuario);
  }
}
