import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';

import '../../../app/data/services/login/login_service.dart';

class SplashPage extends StatefulWidget {
  final LoginService loginService;
  const SplashPage({super.key, required this.loginService});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  LoginService get loginService => widget.loginService;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      await loginService.initAmplify();
      bool usuarioLogado = await loginService.validaUsuarioLogado();
      if (!mounted) return;
      if (usuarioLogado) {
        context.go(NomesNavegacaoRota.homePage);
      } else {
        context.go(NomesNavegacaoRota.loginPage);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("SplashPage")));
  }
}
