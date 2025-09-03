import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizard_app/app/ui/configuracoes_iniciais/view_model/configuracoes_iniciais_view_model.dart';
import 'package:wizard_app/core/ui/marca_dagua/scaffold_marca_dagua.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';

class ConfiguracoesIniciaisPage extends StatefulWidget {
  final ConfiguracoesIniciaisViewModel configuracoesIniciaisViewModel;
  final String macVeiculo;
  final String serial;
  const ConfiguracoesIniciaisPage({
    super.key,
    required this.configuracoesIniciaisViewModel,
    required this.macVeiculo,
    required this.serial,
  });

  @override
  State<ConfiguracoesIniciaisPage> createState() =>
      _ConfiguracoesIniciaisPageState();
}

class _ConfiguracoesIniciaisPageState extends State<ConfiguracoesIniciaisPage> {
  ConfiguracoesIniciaisViewModel get configuracoesIniciaisViewModel =>
      widget.configuracoesIniciaisViewModel;
  String get serial => widget.serial;
  String get macVeiculo => widget.macVeiculo;
  @override
  void initState() {
    configuracoesIniciaisViewModel.buscarConfiguracoesIniciasCommand
        .addListener(() {
          if (configuracoesIniciaisViewModel
                  .buscarConfiguracoesIniciasCommand
                  .completed &&
              configuracoesIniciaisViewModel.atualizacaoEspHabilitado) {
            context.go(
              NomesNavegacaoRota.atualizadorEspPage,
              extra: macVeiculo,
            );
            return;
          }
          if (configuracoesIniciaisViewModel
              .buscarConfiguracoesIniciasCommand
              .completed) {
            context.go(NomesNavegacaoRota.ordemServicoPage);
            return;
          }
        });
    configuracoesIniciaisViewModel.buscarConfiguracoesIniciasCommand.execute(
      macVeiculo,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMarcaDagua(
      appBar: AppBar(title: Text('Configuracoes iniciais')),
      body: ListenableBuilder(
        listenable:
            configuracoesIniciaisViewModel.buscarConfiguracoesIniciasCommand,
        builder: (context, child) {
          if (configuracoesIniciaisViewModel
              .buscarConfiguracoesIniciasCommand
              .error) {
            return Text(
              "Não foi possivel buscar informações iniciais ${configuracoesIniciaisViewModel.exceptionApp.rastreio}",
            );
          }
          if (configuracoesIniciaisViewModel
              .buscarConfiguracoesIniciasCommand
              .running) {
            return Center(child: CircularProgressIndicator());
          }
          return Text("Completo");
        },
      ),
    );
  }
}
