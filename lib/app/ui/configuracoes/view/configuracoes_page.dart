import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizard_app/app/ui/configuracoes/view_model/configuracoes_view_model.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';

class ConfiguracoesPage extends StatefulWidget {
  final ConfiguracoesViewModel configuracoesViewModel;
  const ConfiguracoesPage({super.key, required this.configuracoesViewModel});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  ConfiguracoesViewModel get configuracoesViewModel =>
      widget.configuracoesViewModel;
  @override
  void initState() {
    configuracoesViewModel.addListener(() {});
    configuracoesViewModel.logoutUser.addListener(() {
      if (configuracoesViewModel.logoutUser.completed &&
          !configuracoesViewModel.logoutUser.error) {
        context.go(NomesNavegacaoRota.loginPage);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configurações")),
      body: ListView(
        children: [
          ListenableBuilder(
            listenable: configuracoesViewModel.logoutUser,
            builder: (context, child) {
              if (configuracoesViewModel.logoutUser.running) {
                return const Center(child: CircularProgressIndicator());
              }
              if (configuracoesViewModel.logoutUser.error) {
                return Text(configuracoesViewModel.exceptionLogin.descricao);
              }
              return ListTile(
                title: Text("Sair"),
                onTap: () async {
                  configuracoesViewModel.logoutUser.execute();
                },
              );
            },
            child: Text("Teste"),
          ),
        ],
      ),
    );
  }

  void _onViewModelChanged() {
    if (!configuracoesViewModel.logoutUser.error) {
      configuracoesViewModel.logoutUser.clearResult();
      // Show Snackbar
    }
  }

  @override
  void dispose() {
    configuracoesViewModel.logoutUser.removeListener(_onViewModelChanged);
    super.dispose();
  }
}
