import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Widget child;
  const CardComponent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE4E4E4), width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
