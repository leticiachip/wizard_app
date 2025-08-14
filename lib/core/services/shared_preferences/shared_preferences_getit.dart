import 'package:shared_preferences/shared_preferences.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';

class SharedPreferencesGetit {
  SharedPreferencesGetit._internal();
  static final instance = SharedPreferencesGetit._internal();

  registrarSharedPrefences() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  }
}
