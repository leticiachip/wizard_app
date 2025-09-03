import 'package:flutter/material.dart';
import 'package:wizard_app/main.dart';

import 'custom_painter.dart';

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
          body,
          IgnorePointer(
            child: CustomPaint(
              painter: WatermarkPainter(
                nomeUsuarioMarcadagua.isEmpty
                    ? ""
                    : nomeUsuarioMarcadagua,
              ),
              size: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
