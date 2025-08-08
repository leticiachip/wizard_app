import 'dart:developer';

import 'package:wizard_app/app/adapter/diretorio_adapter.dart';
import 'package:wizard_app/app/data/repositories/login/amplify_repository.dart';
import 'package:wizard_app/app/data/services/home/home_service.dart';
import 'package:wizard_app/core/utils/result.dart';

import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../adapter/image_picker_adapter.dart';
import '../login/exception_login.dart';

class HomeServiceImpl implements HomeService {
  final AmplifyRepository amplifyRepository;
  final ImagePickerAdapter imagePickerAdapter;
  final DiretorioAdapter diretorioAdapter;
  HomeServiceImpl({
    required this.amplifyRepository,
    required this.imagePickerAdapter,
    required this.diretorioAdapter,
  });
  @override
  Future<Result<List<String>, ExceptionApp>> buscarPermissoes() async {
    try {
      String endPointRef =
          'https://api-driverlog.chiptronicsciencetelematic.com.br/';
      Result<Map<String, dynamic>, ExceptionLogin> getIdToken =
          await amplifyRepository.buscarIdToken();

      if (getIdToken.isSuccess) {
        Map<String, dynamic> rotas = getIdToken.getOrNull()!;
        List<String> scope = rotas['scopes'].split(' ');

        List<String> replace = scope
            .map((element) => element.replaceAll(endPointRef, ""))
            .toList();
        return Success(replace);
      }

      return Failure(
        ExceptionApp(
          descricao: getIdToken.exceptionOrNull()!.descricao,
          detalhes: getIdToken.exceptionOrNull()!.detalhes,
        ),
      );
    } catch (error) {
      return Failure(
        ExceptionApp(
          descricao: '$error',
          detalhes: 'Não foi possivel obter os dados do cognito',
        ),
      );
    }
  }

  @override
  Future<void> capturarImagem() async {
    String caminho = await diretorioAdapter.buscarDiretorioFoto();
    log("----->> caminho $caminho");
    await imagePickerAdapter.abrirCamera(caminho);
    //await imagePickerAdapter.excluirFoto('data/data/com.example.wizard_app.dev/app_flutter/capturas/exemplo0311ddde09f2c57c342188b3b954695b.jpeg');
  }

}
