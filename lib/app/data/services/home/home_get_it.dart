import 'package:wizard_app/app/adapter/diretorio_adapter.dart';
import 'package:wizard_app/app/adapter/image_picker_adapter.dart';
import 'package:wizard_app/app/data/repositories/login/amplify_repository.dart';
import 'package:wizard_app/app/data/services/home/home_service.dart';
import 'package:wizard_app/app/data/services/home/home_service_impl.dart';
import 'package:wizard_app/app/ui/home/view_model/home_view_model.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';

class HomeGetIt {
  HomeGetIt._internal();
  static final instance = HomeGetIt._internal();

  registrarHomeGetIt() {
    getIt.registerFactory<HomeService>(
      () => HomeServiceImpl(
        amplifyRepository: getIt<AmplifyRepository>(),
        diretorioAdapter: getIt<DiretorioAdapter>(),
        imagePickerAdapter: getIt<ImagePickerAdapter>(),
      ),
    );
    getIt.registerLazySingleton<HomeViewModel>(
      () => HomeViewModel(homeService: getIt<HomeService>()),
    );
    getIt.registerFactory<DiretorioAdapter>(() => DiretorioAdapter());
    getIt.registerFactory<ImagePickerAdapter>(() => ImagePickerAdapter());
  }
}
