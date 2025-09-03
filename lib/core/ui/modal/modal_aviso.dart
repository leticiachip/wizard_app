import 'package:flutter/material.dart';

import 'components/button_modal.dart';

class DialogCustomizado extends StatelessWidget {
  final String titulo;
  final String descricao;
  final String? botaoSim;
  final String? botaoNao;
  final Function? onTapSim;
  final Function? onTapNao;
  const DialogCustomizado({
    super.key,
    required this.titulo,
    required this.descricao,
    this.onTapSim,
    this.onTapNao,
    this.botaoNao,
    this.botaoSim,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titulo),
      content: Text(descricao),
      actions: [
        botaoSim != null
            ? ButtonModal(
                descricao: botaoSim!,
                function: () {
                  onTapSim!();
                },
              )
            : SizedBox(),
        botaoNao != null
            ? ButtonModal(
                descricao: botaoNao!,
                function: () {
                  onTapNao!();
                },
              )
            : SizedBox(),
      ],
    );
  }
}
