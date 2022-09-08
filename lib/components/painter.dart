import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  Painter({
    required this.r,
    required this.n,
  });

  double n = 0.3;
  double r = 1.25;
  final double w = 1;
  final double h = 0.5;
  final double strokeWidth = 200;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.pink
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    Paint paint1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path0 = Path();
    Path path1 = Path();
    path0.moveTo(0 - strokeWidth, size.height * n);
    path1.moveTo(0, size.height * n);

    path0.quadraticBezierTo(size.width * h, size.height * r,
        size.width * w + strokeWidth, size.height * n);
    path1.quadraticBezierTo(
        size.width * h, size.height * r, size.width * w, size.height * n);
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    canvas.drawPath(path1, paint1);
    canvas.drawPath(path0, paint0);
    // canvas.drawCircle(Offset(size.width, size.height), 100, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
