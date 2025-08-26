import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final String hint;
  const TextFieldComponent({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(decoration: InputDecoration(label: Text(hint)));
  }
}
