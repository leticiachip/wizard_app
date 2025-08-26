import 'package:flutter/material.dart';
import 'package:wizard_app/app/ui/ordem_servico/view_model/ordem_servico_view_model.dart';
import 'package:wizard_app/app/ui/ordem_servico/views/components/checkbox_component.dart';
import 'package:wizard_app/app/ui/ordem_servico/views/components/text_field_component.dart';

import '../../../domain/models/checklist/checklist_item.dart';

class ChecklistOrdemServicoPage extends StatefulWidget {
  final OrdemServicoViewModel ordemServicoViewModel;
  const ChecklistOrdemServicoPage({
    super.key,
    required this.ordemServicoViewModel,
  });

  @override
  State<ChecklistOrdemServicoPage> createState() =>
      _ChecklistOrdemServicoPageState();
}

class _ChecklistOrdemServicoPageState extends State<ChecklistOrdemServicoPage> {
  OrdemServicoViewModel get ordemServicoViewModel =>
      widget.ordemServicoViewModel;
  @override
  void initState() {
    ordemServicoViewModel.buscarCheckList.execute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checklist')),
      body: ListenableBuilder(
        listenable: ordemServicoViewModel.buscarCheckList,
        builder: (context, child) {
          if (ordemServicoViewModel.buscarCheckList.error) {
            return Text(
              "Não foi possivel buscar checklist ${ordemServicoViewModel.exceptionApp.rastreio}",
            );
          }
          if (ordemServicoViewModel.buscarCheckList.running) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: ordemServicoViewModel.checkList.checkListItem.length,
            itemBuilder: (context, index) {
              ChecklistItem item =
                  ordemServicoViewModel.checkList.checkListItem[index];
              return Column(
                children: [
                  Visibility(
                    visible: item.checkBoxHabilitado == 1,
                    child: CheckboxComponent(
                      descricaoCheckBox: item.descricaoCheckBox,
                      functionEsquedo: (value) {},
                      functionDireito: (value) {},
                      valor: false,
                    ),
                  ),
                  Visibility(
                    visible: item.textFieldHabilitado == 1,
                    child: TextFieldComponent(hint: item.dicaTextField,),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
