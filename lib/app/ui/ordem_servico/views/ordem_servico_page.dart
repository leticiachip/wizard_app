import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizard_app/app/ui/ordem_servico/view_model/ordem_servico_view_model.dart';
import 'package:wizard_app/core/services/formatar_hora.dart';
import 'package:wizard_app/core/ui/scaffold_marca_dagua.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';

import '../../../domain/models/ordem_servico/ordem_servico.dart';

class OrdemServicoPage extends StatefulWidget {
  final OrdemServicoViewModel ordemServicoViewModel;
  const OrdemServicoPage({super.key, required this.ordemServicoViewModel});

  @override
  State<OrdemServicoPage> createState() => _OrdemServicoPageState();
}

class _OrdemServicoPageState extends State<OrdemServicoPage> {
  OrdemServicoViewModel get ordemServicoViewModel =>
      widget.ordemServicoViewModel;
  @override
  void initState() {
    ordemServicoViewModel.addListener(() {});
    ordemServicoViewModel.buscarOS.execute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMarcaDagua(
      appBar: AppBar(title: Text("Ordem serviço")),
      body: AnimatedBuilder(
        animation: ordemServicoViewModel.buscarOS,
        builder: (context, _) {
          if (ordemServicoViewModel.buscarOS.running) {
            return CircularProgressIndicator();
          }
          if (ordemServicoViewModel.buscarOS.error) {
            return Text("Não foi possivel buscar OS");
          }
          if (ordemServicoViewModel.listaOrdemServico.isEmpty) {
            return Text("Nada encontrado");
          }
          return ListView.builder(
            itemCount: ordemServicoViewModel.listaOrdemServico.length,
            itemBuilder: (context, index) {
              OrdemServico ordemServico =
                  ordemServicoViewModel.listaOrdemServico[index];
              return ListTile(
                onTap: (){
                  context.push(NomesNavegacaoRota.inicioOrdemServicoPage);
                },
                title: Text(ordemServico.informacoesAdicionais ?? "N/A"),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text(formatarHora(ordemServico.dataHoraInicio ?? "")),
                ]),
              );
            },
          );
        },
      ),
    );
  }
}
