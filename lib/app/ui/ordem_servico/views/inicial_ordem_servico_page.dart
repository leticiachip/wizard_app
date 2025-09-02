import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizard_app/app/domain/models/etapas_ordem_servico/etapas_ordem_servico.dart';
import 'package:wizard_app/app/ui/ordem_servico/view_model/ordem_servico_view_model.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';

import '../../../../core/ui/marca_dagua/scaffold_marca_dagua.dart';

class InicialOrdemServicoPage extends StatefulWidget {
  final OrdemServicoViewModel ordemServicoViewModel;
  const InicialOrdemServicoPage({
    super.key,
    required this.ordemServicoViewModel,
  });

  @override
  State<InicialOrdemServicoPage> createState() =>
      _InicialOrdemServicoPageState();
}

class _InicialOrdemServicoPageState extends State<InicialOrdemServicoPage> {
  OrdemServicoViewModel get ordemServicoViewModel =>
      widget.ordemServicoViewModel;
  @override
  void initState() {
    ordemServicoViewModel.buscarEtpasOS.execute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMarcaDagua(
      appBar: AppBar(title: Text("Page inicial")),
      body: AnimatedBuilder(
        animation: ordemServicoViewModel.buscarEtpasOS,
        builder: (context, _) {
          if (ordemServicoViewModel.buscarEtpasOS.error) {
            return Text(
              "Não foi possivel buscar as informações ${ordemServicoViewModel.exceptionApp.rastreio}",
            );
          }
          if (ordemServicoViewModel.buscarEtpasOS.running) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: ordemServicoViewModel.listaEtapaOS.length,
            itemBuilder: (context, index) {
              EtapasOrdemServico etapas =
                  ordemServicoViewModel.listaEtapaOS[index];
              return ListTile(
                leading: Icon(Icons.warning_amber_rounded, color: Colors.amber),
                title: Text(etapas.descricao),
                onTap: () {
                  direcionarPage(etapas.tipo);
                },
              );
            },
          );
        },
      ),
    );
  }

  direcionarPage(int tipo) {
    switch (tipo) {
      case 1:
        context.push(NomesNavegacaoRota.checklistVeiculo);
      case 2:
        context.push(NomesNavegacaoRota.pdfPage);
      case 3:
        print("outros");
    }
  }
}
