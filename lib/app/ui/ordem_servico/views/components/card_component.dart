import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  const CardComponent({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFE4E4E4), width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }
}
