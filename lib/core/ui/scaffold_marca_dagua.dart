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
          body,
          Positioned(
            bottom: 10,
            left: 10,
            child: IgnorePointer(
              ignoring: true,
              child: Container(
                color: Colors.amber,
                height: 60,
                width: 60,
                child: Text("Teste"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
