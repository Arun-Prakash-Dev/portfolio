import 'package:flutter/material.dart';

class Pointer extends CustomPainter {
  final double radius;
  Pointer(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      const Offset(0, 0),
      radius,
      Paint()
        ..color = Colors.white
        ..blendMode = BlendMode.difference,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class HoverPointer extends CustomPainter {
  final double radius;
  HoverPointer(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
        const Offset(0, 0),
        radius,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
