import 'package:flutter/material.dart';

class ButtonModal extends StatelessWidget {
  final String descricao;
  final Function function;
  const ButtonModal({super.key, required this.descricao, required this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 60,
      child: TextButton(
        onPressed: () {
          function();
        },
        child: Text(descricao),
      ),
    );
  }
}
