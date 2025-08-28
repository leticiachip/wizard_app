import 'package:flutter/material.dart';

class ScaffoldMarcaDagua extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget? floatingActionButton;
  final Widget body;
  const ScaffoldMarcaDagua({
    super.key,
    required this.appBar,
    required this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      appBar: appBar,
      body: Stack(
        children: [
          Center(
            child: IgnorePointer(
              ignoring: true,
              child: Image.asset(
                color: Colors.grey[200],
                'assets/images/logo_sem_subtitulo.png',
                height: 300,
                width: 300,
              ),
            ),
          ),
          body,
        ],
      ),
    );
  }
}
