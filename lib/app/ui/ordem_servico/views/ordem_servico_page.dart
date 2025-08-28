import 'package:flutter/material.dart';
import 'package:wizard_app/app/ui/ordem_servico/view_model/ordem_servico_view_model.dart';
import 'package:wizard_app/app/ui/ordem_servico/views/components/card_component.dart';
import 'package:wizard_app/app/ui/ordem_servico/views/components/item_card_component.dart';
import 'package:wizard_app/core/services/formatar_hora.dart';
import 'package:wizard_app/core/ui/scaffold_marca_dagua.dart';

import '../../../../l10n/app_localizations.dart';
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
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.ordemServico)),
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
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: CardComponent(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemCardComponent(
                            titulo: AppLocalizations.of(context)!.ordemServico,
                            descricao: ordemServico.numeroPedido,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFF5474BC)),
                              color: Color(0x3F5474BC),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                ordemServico.descricaoStatusOrdem ?? "N/A",
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ItemCardComponent(
                        titulo: AppLocalizations.of(
                          context,
                        )!.empresaDestinataria,
                        descricao: ordemServico.nomeEmpresaDestinaria,
                      ),
                      ItemCardComponent(
                        titulo: AppLocalizations.of(context)!.responsavel,
                        descricao: ordemServico.nomeCompletoResposavel,
                      ),
                      ItemCardComponent(
                        titulo: AppLocalizations.of(context)!.prazoFinal,
                        descricao: formatarHora(
                          ordemServico.dataHoraPrazoFinal,
                        ),
                      ),
                      Visibility(
                        visible: ordemServico.dataHoraPrazoFinal != null,
                        child:
                            DateTime.parse(
                                  ordemServico.dataHoraPrazoFinal!,
                                ).difference(DateTime.now()).inHours <
                                24
                            ? Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.warning_rounded,
                                    size: 30,
                                    color: ColorScheme.of(context).error,
                                  ),
                                  SizedBox(width: 5),
                                  Text("O prazo está acabando"),
                                ],
                              )
                            : SizedBox(),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
