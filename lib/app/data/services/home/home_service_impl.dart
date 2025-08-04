import 'dart:developer';

import 'package:result_dart/result_dart.dart';
import 'package:wizard_app/app/data/repositories/login/amplify_repository.dart';
import 'package:wizard_app/app/data/services/home/home_service.dart';

import '../../../../core/exceptions_app/model/exception_app.dart';
import '../login/exception_login.dart';

class HomeServiceImpl implements HomeService {
  final AmplifyRepository amplifyRepository;
  HomeServiceImpl({required this.amplifyRepository});
  @override
  Future<ResultDart<List<String>, ExceptionApp>> buscarPermissoes() async {
    try {
      String endPointRef =
          'https://api-driverlog.chiptronicsciencetelematic.com.br/';
      ResultDart<Map<String, dynamic>, ExceptionLogin> getIdToken =
          await amplifyRepository.buscarIdToken();

      if (getIdToken.isSuccess()) {
        Map<String, dynamic> rotas = getIdToken.getOrNull()!;
        log("------>> rotas scope ${rotas}");
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
}
