import 'package:flutter/material.dart';

class WatermarkPainter extends CustomPainter {
  final String text;

  WatermarkPainter(this.text);

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = TextStyle(
      color: Colors.black.withValues(alpha: 0.04),
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final double diagonalSpacing = 140;

    for (double y = -size.height; y < size.height * 2; y += diagonalSpacing) {
      for (double x = -size.width; x < size.width * 2; x += diagonalSpacing) {
        canvas.save();

        // Translada para posição desejada
        canvas.translate(x, y);

        // Rotaciona o canvas
        canvas.rotate(-0.785398); // -45 graus em radianos

        // Desenha o texto
        textPainter.paint(canvas, Offset.zero);

        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
