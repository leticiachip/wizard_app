import 'package:flutter/material.dart';
import 'package:wizard_app/core/ui/marca_dagua.dart';

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
      body: Stack(children: [MarcaDagua(), body]),
    );
  }
}
