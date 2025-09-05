import 'app_print.dart';
import 'core/flavors/flavors.dart';
import 'main.dart' as main_common;

Future<void> main() async {
  Flavor.flavorType = FlavorTypes.dev;
  appPrint = (message) => print(message); // Habilita prints no dev
  main_common.main();
}
