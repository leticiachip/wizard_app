import 'package:flutter/material.dart';

class ItemCardComponent extends StatelessWidget {
  final String titulo;
  final String? descricao;
  const ItemCardComponent({
    super.key,
    required this.titulo,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo),
          Text(
            descricao ?? "N/A",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Color(0xFF444444)),
          ),
        ],
      ),
    );
  }
}
