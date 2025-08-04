import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';
import 'package:wizard_app/app/data/services/login/login_service.dart';
import 'package:wizard_app/app/ui/bluetooth/views/teste_bluetooth_page.dart';
import 'package:wizard_app/app/ui/configuracoes/view/configuracoes_page.dart';
import 'package:wizard_app/app/ui/configuracoes/view_model/configuracoes_view_model.dart';
import 'package:wizard_app/app/ui/home/view_model/home_view_model.dart';
import 'package:wizard_app/app/ui/login/view_model/esqueci_senha_view_model.dart';
import 'package:wizard_app/app/ui/login/view_model/troca_senha_view_model.dart';
import 'package:wizard_app/app/ui/login/views/confirmar_email_page.dart';
import 'package:wizard_app/app/ui/login/views/login_page.dart';
import 'package:wizard_app/app/ui/login/view_model/login_view_model.dart';
import 'package:wizard_app/app/ui/login/views/troca_senha_page.dart';
import 'package:wizard_app/core/flavors/flavors.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';
import 'package:wizard_app/core/splash/views/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wizard_app/l10n/app_localizations.dart';

import 'app/ui/home/view/home_page.dart';
import 'app/ui/login/views/esqueci_senha_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencias();

  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: NomesNavegacaoRota.homePage,
      builder: (BuildContext context, GoRouterState state) {
        final homeViewModel = getIt<HomeViewModel>();
        return HomePage(homeViewModel: homeViewModel);
      },
    ),
    GoRoute(
      path: NomesNavegacaoRota.splashPage,
      builder: (BuildContext context, GoRouterState state) {
        final loginService = getIt<LoginService>();
        return SplashPage(loginService: loginService);
      },
    ),
    GoRoute(
      path: NomesNavegacaoRota.loginPage,
      builder: (BuildContext context, GoRouterState state) {
        final loginViewModel = getIt<LoginViewModel>();
        return LoginPage(loginViewModel: loginViewModel);
      },
    ),
    GoRoute(
      path: NomesNavegacaoRota.configuracaoPage,
      builder: (BuildContext context, GoRouterState state) {
        final configuracoesViewModel = getIt<ConfiguracoesViewModel>();
        return ConfiguracoesPage(
          configuracoesViewModel: configuracoesViewModel,
        );
      },
    ),

    GoRoute(
      path: NomesNavegacaoRota.testeBluetoothPage,
      builder: (BuildContext context, GoRouterState state) {
        final btService = getIt<BluetoothBleService>();
        return TesteBluetoothPage(bluetoothBleService: btService);
      },
    ),
    GoRoute(
      path: NomesNavegacaoRota.trocaSenhaPrimeiroUso,
      builder: (BuildContext context, GoRouterState state) {
        final trocaSenhaViewModel = getIt<TrocaSenhaViewModel>();
        return TrocaSenhapage(trocaSenhaViewModel: trocaSenhaViewModel);
      },
    ),
    GoRoute(
      path: NomesNavegacaoRota.esqueciSenhaPage,
      builder: (BuildContext context, GoRouterState state) {
        String email = state.extra as String;
        final esqueciSenhaViewModel = getIt<EsqueciSenhaViewModel>();
        return EsqueciSenhaPage(
          esqueciSenhaViewModel: esqueciSenhaViewModel,
          email: email,
        );
      },
    ),
    GoRoute(
      path: NomesNavegacaoRota.confirmacaoEmailPage,
      builder: (BuildContext context, GoRouterState state) {
        final esqueciSenhaViewModel = getIt<EsqueciSenhaViewModel>();
        return ConfirmarEmailPage(esqueciSenhaViewModel: esqueciSenhaViewModel);
      },
    ),
  ],
  initialLocation: NomesNavegacaoRota.splashPage,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
        Locale('pt'), // Spanish
      ],
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: Flavor.isProduction()
          ? ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
              primaryColor: Colors.blue,
            )
          : ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              primaryColor: Colors.pink,
              appBarTheme: AppBarTheme(color: Colors.purple),
              scaffoldBackgroundColor: Colors.pink[50]
            ),
    );
  }
}
