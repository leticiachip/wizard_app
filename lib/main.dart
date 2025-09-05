import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:wizard_app/app/data/services/bluetooth/bluetooth_service.dart';
import 'package:wizard_app/app/data/services/login/login_service.dart';
import 'package:wizard_app/app/ui/atualizador_connectbus/view/atualizador_connectbus_page.dart';
import 'package:wizard_app/app/ui/atualizador_connectbus/view_model/atualizador_connectbus_view_model.dart';
import 'package:wizard_app/app/ui/atualizador_esp/view/atualizacao_page.dart';
import 'package:wizard_app/app/ui/atualizador_esp/view_model/atualizador_view_model.dart';
import 'package:wizard_app/app/ui/bluetooth/view_model/scan_view_model.dart';
import 'package:wizard_app/app/ui/bluetooth/views/teste_bluetooth_page.dart';
import 'package:wizard_app/app/ui/configuracoes/view/configuracoes_page.dart';
import 'package:wizard_app/app/ui/configuracoes/view_model/configuracoes_view_model.dart';
import 'package:wizard_app/app/ui/configuracoes_iniciais/view/configuracoes_iniciais_page.dart';
import 'package:wizard_app/app/ui/configuracoes_iniciais/view_model/configuracoes_iniciais_view_model.dart';
import 'package:wizard_app/app/ui/home/view_model/home_view_model.dart';
import 'package:wizard_app/app/ui/login/view_model/esqueci_senha_view_model.dart';
import 'package:wizard_app/app/ui/login/view_model/troca_senha_view_model.dart';
import 'package:wizard_app/app/ui/login/views/confirmar_email_page.dart';
import 'package:wizard_app/app/ui/login/views/login_page.dart';
import 'package:wizard_app/app/ui/login/view_model/login_view_model.dart';
import 'package:wizard_app/app/ui/login/views/troca_senha_page.dart';
import 'package:wizard_app/app/ui/ordem_servico/view_model/ordem_servico_view_model.dart';
import 'package:wizard_app/app/ui/ordem_servico/views/ordem_servico_page.dart';
import 'package:wizard_app/app/ui/usuario/view_model/usuario_view_model.dart';
import 'package:wizard_app/core/flavors/flavors.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';
import 'package:wizard_app/core/ui/splash/views/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wizard_app/l10n/app_localizations.dart';

import 'app/ui/bluetooth/views/scan_bluetooth_page.dart' show ScanBluetoothPage;
import 'app/ui/home/view/home_page.dart';
import 'app/ui/login/views/esqueci_senha_page.dart';
import 'app/ui/ordem_servico/views/inicial_ordem_servico_page.dart';
import 'app/ui/ordem_servico/views/pdf_manual_page.dart';

String nomeUsuarioMarcadagua = "";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencias();
  if (Flavor.isProduction()) {
    const MethodChannel channel = MethodChannel('screen_shot');
    channel.invokeMethod('proibirPrint');
  }
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: NomesNavegacaoRota.homePage,
      builder: (BuildContext context, GoRouterState state) {
        final homeViewModel = getIt<HomeViewModel>();
        final atualizadorViewModel = getIt<AtualizadorViewModel>();
        String mac = state.extra as String;
        return HomePage(
          homeViewModel: homeViewModel,
          atualizadorViewModel: atualizadorViewModel,
          enderecoMac: mac,
        );
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
        final btService = getIt<BluetoothAppService>(instanceName: 'classic');
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
    GoRoute(
      path: NomesNavegacaoRota.scanBluetoothPage,
      builder: (BuildContext context, GoRouterState state) {
        final scanViewModel = getIt<ScanViewModel>();
        return ScanBluetoothPage(scanViewModel: scanViewModel);
      },
    ),

    GoRoute(
      path: NomesNavegacaoRota.atualizadorEspPage,
      builder: (BuildContext context, GoRouterState state) {
        final atualizadorViewModel = getIt<AtualizadorViewModel>();
        String mac = state.extra as String;
        return AtualizadorPage(
          atualizadorViewModel: atualizadorViewModel,
          enderecoMac: mac,
        );
      },
    ),
    GoRoute(
      path: NomesNavegacaoRota.atualizadorConnectPage,
      builder: (BuildContext context, GoRouterState state) {
        final atualizadorConnectViewModel =
            getIt<AtualizadorConnectbusViewModel>();
        String mac = state.extra as String;
        return AtualizadorConnectbusPage(
          mac: mac,
          atualizadorConnectbusViewModel: atualizadorConnectViewModel,
        );
      },
    ),
    GoRoute(
      path: NomesNavegacaoRota.ordemServicoPage,
      builder: (BuildContext context, GoRouterState state) {
        OrdemServicoViewModel ordemServicoViewModel =
            getIt<OrdemServicoViewModel>();
        UsuarioViewModel usuarioViewModel = getIt<UsuarioViewModel>();
        return OrdemServicoPage(
          ordemServicoViewModel: ordemServicoViewModel,
          usuarioViewModel: usuarioViewModel,
        );
      },
    ),
    GoRoute(
      path: NomesNavegacaoRota.inicioOrdemServicoPage,
      builder: (BuildContext context, GoRouterState state) {
        String tituloPagia = state.extra as String;
        OrdemServicoViewModel ordemServicoViewModel =
            getIt<OrdemServicoViewModel>();
        return InicialOrdemServicoPage(
          ordemServicoViewModel: ordemServicoViewModel,
          tituloPagina: tituloPagia,
        );
      },
    ),

    GoRoute(
      path: NomesNavegacaoRota.pdfPage,
      builder: (BuildContext context, GoRouterState state) {
        OrdemServicoViewModel ordemServicoViewModel =
            getIt<OrdemServicoViewModel>();
        return PdfManualPage(ordemServicoViewModel: ordemServicoViewModel);
      },
    ),
    GoRoute(
      path: NomesNavegacaoRota.configuracoesIniciaisPage,
      builder: (BuildContext context, GoRouterState state) {
        ConfiguracoesIniciaisViewModel configuracoesIniciaisViewModel =
            getIt<ConfiguracoesIniciaisViewModel>();
        Map<String, dynamic> map = state.extra as Map<String, dynamic>;
        String mac = map['mac'];
        String serial = map['serial'];

        return ConfiguracoesIniciaisPage(
          configuracoesIniciaisViewModel: configuracoesIniciaisViewModel,
          macVeiculo: mac,
          serial: serial,
        );
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
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: ButtonStyle(
                  side: WidgetStateProperty.all<BorderSide>(
                    BorderSide(color: Color(0xFF123D9E)),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              tabBarTheme: TabBarThemeData(labelColor: Color(0xFF000000)),
              dialogTheme: DialogThemeData(
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF000000),
                ),
              ),
              progressIndicatorTheme: ProgressIndicatorThemeData(
                linearTrackColor: Colors.grey[200],
              ),
              primaryColor: Color(0xFF123D9E),

              fontFamily: 'Montserrat',
              appBarTheme: AppBarTheme(
                centerTitle: true,
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(Colors.white),

                  elevation: WidgetStateProperty.all(0.0),
                  fixedSize: WidgetStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 40),
                  ),
                  backgroundColor: WidgetStateProperty.all(Color(0xFF123D9E)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: const Color(0xFF123D9E),
                onPrimary: const Color(0xFFFFFFFF),
                primaryContainer: const Color(0xFFCDDCFF),
                onPrimaryContainer: const Color(0xFF123D9E),
                secondary: const Color(0xFFFFFFFF),
                onSecondary: const Color(0xFFFFFFFF),
                secondaryContainer: const Color(0xFFFFFFFF),
                onSecondaryContainer: Colors.white,
                tertiary: const Color(0xFFFFFFFF),
                onTertiary: Colors.white,
                tertiaryContainer: const Color(0xFFFFFFFF),
                onTertiaryContainer: Colors.white,
                error: Colors.red,
                errorContainer: Colors.white,
                onError: Colors.red.shade200,
                onErrorContainer: Colors.red.shade800,
                surface: Colors.white,
                onSurface: Colors.black,
                onSurfaceVariant: const Color.fromARGB(255, 104, 104, 104),
              ),
            )
          : ThemeData(
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: ButtonStyle(
                  side: WidgetStateProperty.all<BorderSide>(
                    BorderSide(color: Color(0xFFED142F)),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              tabBarTheme: TabBarThemeData(labelColor: Color(0xFF000000)),
              dialogTheme: DialogThemeData(
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF000000),
                ),
              ),
              progressIndicatorTheme: ProgressIndicatorThemeData(
                linearTrackColor: Colors.grey[200],
              ),
              primaryColor: Color(0xFFED142F),

              fontFamily: 'Montserrat',
              appBarTheme: AppBarTheme(
                centerTitle: true,
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(Colors.white),

                  elevation: WidgetStateProperty.all(0.0),
                  fixedSize: WidgetStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 40),
                  ),
                  backgroundColor: WidgetStateProperty.all(Color(0xFFED142F)),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: const Color(0xFFED142F),
                onPrimary: const Color(0xFFFFFFFF),
                primaryContainer: const Color(0xFFCDDCFF),
                onPrimaryContainer: const Color(0xFFED142F),
                secondary: const Color(0xFFFFFFFF),
                onSecondary: const Color(0xFFFFFFFF),
                secondaryContainer: const Color(0xFFFFFFFF),
                onSecondaryContainer: Colors.white,
                tertiary: const Color(0xFFFFFFFF),
                onTertiary: Colors.white,
                tertiaryContainer: const Color(0xFFFFFFFF),
                onTertiaryContainer: Colors.white,
                error: Colors.red,
                errorContainer: Colors.white,
                onError: Colors.red.shade200,
                onErrorContainer: Colors.red.shade800,
                surface: Colors.white,
                onSurface: Colors.black,
                onSurfaceVariant: const Color.fromARGB(255, 104, 104, 104),
              ),
            ),
    );
  }
}
