import 'package:flutter/material.dart';

class MarcaDagua extends StatelessWidget {
  const MarcaDagua({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
          color: Colors.grey[200],
          'assets/images/logo_sem_subtitulo.png',
          height: 300,
          width: 300,
        );
  }
}
