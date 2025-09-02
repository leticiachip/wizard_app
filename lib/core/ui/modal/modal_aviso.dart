import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'components/button_modal.dart';

class DialogCustomizado extends StatelessWidget {
  final String titulo;
  final String descricao;
  const DialogCustomizado({
    super.key,
    required this.titulo,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titulo),
      content: Text(descricao),
      actions: [
        ButtonModal(
          descricao: "Sim",
          function: () {
            context.pop();
          },
        ),
        ButtonModal(
          descricao: "Não",
          function: () {
            context.pop();
          },
        ),
      ],
    );
  }
}
