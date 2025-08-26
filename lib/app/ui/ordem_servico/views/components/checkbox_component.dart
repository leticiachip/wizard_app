import 'package:flutter/material.dart';

class CheckboxComponent extends StatelessWidget {
  final bool valor;
  final String descricaoCheckBox;
  final Function(bool?) functionEsquedo;
  final Function(bool?) functionDireito;
  const CheckboxComponent({
    super.key,
    required this.functionEsquedo,
    required this.functionDireito,
    required this.valor,
    required this.descricaoCheckBox,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(descricaoCheckBox),
        Row(
          children: [
            Row(
              children: [
                Checkbox(value: valor, onChanged: functionEsquedo),
                Text("Sim"),
              ],
            ),
            Row(
              children: [
                Checkbox(value: !valor, onChanged: functionEsquedo),
                Text("Não"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
