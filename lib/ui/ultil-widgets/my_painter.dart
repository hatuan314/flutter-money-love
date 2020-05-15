import 'dart:math';

import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final double radius;
  final Color color;
  final double dX;
  final double dY;

  MyPainter(this.dX, this.dY, this.radius, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final center = Offset(dX, dY);
    final paint = Paint()
      ..color = color != null ? color : Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;
    canvas.drawCircle(center, radius != null ? radius : 50, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
