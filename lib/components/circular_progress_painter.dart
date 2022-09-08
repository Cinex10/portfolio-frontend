import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPainter extends CustomPainter {
  CircularProgressPainter({
    required this.value,
    required this.color,
  }) : super();

  final double value;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - value) * 2 * pi;
    canvas.drawArc(Offset.zero & size, pi * -1.3, progress, false, paint);
  }

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) {
    return true;
  }
}
