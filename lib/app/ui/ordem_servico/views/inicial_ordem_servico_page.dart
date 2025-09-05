import 'package:flutter/material.dart';
import 'package:wizard_app/app/ui/ordem_servico/view_model/ordem_servico_view_model.dart';

import '../../../../core/ui/marca_dagua/scaffold_marca_dagua.dart';
import '../../../domain/models/ordem_servico/workflow.dart';

class InicialOrdemServicoPage extends StatefulWidget {
  final OrdemServicoViewModel ordemServicoViewModel;
  final String tituloPagina;
  const InicialOrdemServicoPage({
    super.key,
    required this.ordemServicoViewModel,
    required this.tituloPagina,
  });

  @override
  State<InicialOrdemServicoPage> createState() =>
      _InicialOrdemServicoPageState();
}

class _InicialOrdemServicoPageState extends State<InicialOrdemServicoPage>
    with TickerProviderStateMixin {
  OrdemServicoViewModel get ordemServicoViewModel =>
      widget.ordemServicoViewModel;
  TabController? tabController;
  String get titulo => widget.tituloPagina;

  @override
  void initState() {
    ordemServicoViewModel.buscarWorflow.execute();
    ordemServicoViewModel.buscarWorflow.addListener(() {
      if (ordemServicoViewModel.buscarWorflow.completed) {
        setState(() {
          tabController = TabController(
            length: ordemServicoViewModel.workflowOS.length,
            vsync: this,
          );
        });
        tabController!.addListener(() {
          setState(() {});
        });
        tabController!.index = ordemServicoViewModel.workflowOS
            .where((element) => element.dataFim.isNotEmpty)
            .last
            .ordem;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMarcaDagua(
      bottomNavigationBar: tabController == null
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  tabController!.index > 0
                      ? OutlinedButton(
                          onPressed: () {
                            tabController!.index = tabController!.index - 1;
                          },
                          child: Text("Voltar"),
                        )
                      : SizedBox(),
                  tabController!.index + 1 <
                          ordemServicoViewModel.workflowOS.length
                      ? OutlinedButton(
                          onPressed: () {
                            tabController!.index = tabController!.index + 1;
                          },
                          child: Text("Próximo"),
                        )
                      : SizedBox(),
                ],
              ),
            ),

      appBar: AppBar(
        actionsPadding: EdgeInsets.zero,

        title: Text(titulo),
        bottom: tabController == null
            ? null
            : PreferredSize(
                preferredSize: Size.fromHeight(
                  MediaQuery.of(context).size.height * 0.10,
                ),
                child: IgnorePointer(
                  ignoring: true,
                  child: TabBar(
                    enableFeedback: true,
                    indicatorColor: Colors.transparent,
                    tabAlignment: tabController!.length > 4
                        ? TabAlignment.start
                        : null,
                    indicatorSize: TabBarIndicatorSize.label,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.zero,
                    indicatorWeight: 4,
                    isScrollable: tabController!.length > 4,
                    dividerHeight: 0,
                    controller: tabController,
                    tabs: ordemServicoViewModel.workflowOS.asMap().entries.map((
                      entry,
                    ) {
                      int index = entry.key;
                      Workflow item = entry.value;
                      bool selecionado = tabController!.index == index;
                      bool preenchido = item.dataFim.isEmpty ? false : true;
                      return Tab(
                        height: MediaQuery.of(context).size.height * 0.10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: selecionado || preenchido
                                  ? ColorScheme.of(context).primary
                                  : ColorScheme.of(context).primaryContainer,
                              child: selecionado
                                  ? Icon(
                                      Icons.info_outlined,
                                      color: ColorScheme.of(
                                        context,
                                      ).onSecondary,
                                    )
                                  : preenchido
                                  ? Icon(
                                      Icons.check,
                                      color: ColorScheme.of(
                                        context,
                                      ).onSecondary,
                                    )
                                  : Text(
                                      "${item.id ?? 0}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: SizedBox(
                                width: 80,
                                child: Text(
                                  item.nome,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: ColorScheme.of(context).onSurface,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
      ),
      body: AnimatedBuilder(
        animation: ordemServicoViewModel.buscarWorflow,
        builder: (context, _) {
          if (ordemServicoViewModel.buscarWorflow.error) {
            return Text(
              "Não foi possivel buscar as informações ${ordemServicoViewModel.exceptionApp.rastreio}",
            );
          }
          if (ordemServicoViewModel.buscarWorflow.running) {
            return CircularProgressIndicator();
          }
          return DefaultTabController(
            initialIndex: 0,
            length: tabController!.length,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: ordemServicoViewModel.workflowOS
                  .map((item) => Tab(text: item.nome))
                  .toList(),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }
}
