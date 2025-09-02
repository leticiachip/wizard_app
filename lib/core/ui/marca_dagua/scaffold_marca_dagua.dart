import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';

import 'custom_painter.dart';

class ScaffoldMarcaDagua extends StatefulWidget {
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
  State<ScaffoldMarcaDagua> createState() => _ScaffoldMarcaDaguaState();
}

class _ScaffoldMarcaDaguaState extends State<ScaffoldMarcaDagua> {
  final sharedPreferences = getIt<SharedPreferences>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.floatingActionButton,
      appBar: widget.appBar,
      body: Stack(
        children: [
          IgnorePointer(
            child: CustomPaint(
              painter: WatermarkPainter(
                sharedPreferences.getString("nomeUsuarioMarcaDagua") ??
                    "Nome não encontrado",
              ),
              size: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height,
              ),
            ),
          ),
          widget.body,
        ],
      ),
    );
  }
}
