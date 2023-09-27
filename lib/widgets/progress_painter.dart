import 'dart:math';
import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue // Color of the progress circle
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0; // Adjust the thickness of the circle

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    final progressPaint = Paint()
      ..color = Colors.blue // Color of the progress arc
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0; // Adjust the thickness of the arc

    final progressAngle = 2 * pi * progress;
    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, -pi / 2, progressAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
