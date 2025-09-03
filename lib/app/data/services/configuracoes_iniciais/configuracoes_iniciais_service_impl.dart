import 'package:wizard_app/app/data/repositories/usuario/usuario_repository.dart';
import 'package:wizard_app/app/data/services/configuracoes_iniciais/configuracoes_iniciais_service.dart';
import 'package:wizard_app/core/const/codigo_rastreio.dart';
import 'package:wizard_app/main.dart';

import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/requisicao_app/utils/resultado_requisicao.dart'
    show ResultadoRequisicao;
import '../../../../core/utils/result.dart';

class ConfiguracoesIniciaisServiceImpl implements ConfiguracoesIniciaisService {
  final UsuarioRepository usuarioRepository;
  ConfiguracoesIniciaisServiceImpl({
    required this.usuarioRepository,
  });
  @override
  Future<Result<bool, ExceptionApp>> iniciarConfiguracao() async {
    Result<ResultadoRequisicao, ExceptionApp> respostaUsuario =
        await usuarioRepository.buscarUsuario();
    await Future.delayed(const Duration(seconds: 2));
    if (respostaUsuario.isError) {
      return Failure(respostaUsuario.exceptionOrNull()!);
    }
    ResultadoRequisicao resultadoBody = respostaUsuario.getOrNull()!;
    Map<String, dynamic> bodyUsuario = resultadoBody.body ?? {};
    if (bodyUsuario.isEmpty) {
      return Failure(
        ExceptionApp(
          descricao: "Os dados do usuario não foi encontrado",
          detalhes:
              "Provavelmente o body esta nulo, e não esta sendo possivel obter as informações do usuario para colocar como marca dgua",
          rastreio: "${CodigoRastreio.usuario}.XX",
        ),
      );
    }
    Map<String, dynamic>? data = bodyUsuario['data'];
    if (data == null || data.isEmpty) {
      ExceptionApp(
        descricao: "Os dados do usuario não foi encontrado",
        detalhes:
            "Provavelmente o body esta nulo, e não esta sendo possivel obter as informações do usuario para colocar como marca dgua",
        rastreio: "${CodigoRastreio.usuario}.XX",
      );
    }
    String dadosUsuario =
        "${data!['usuario']['nome']}\n${data['usuario']['cpf']}";
    nomeUsuarioMarcadagua = dadosUsuario;
    return Success(true);
  }
}
