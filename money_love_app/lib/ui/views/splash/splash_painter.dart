import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moneyloveapp/ui/ultil-widgets/my_painter.dart';

class SplashPainter extends MyPainter {
  final double width;
  final double height;

  SplashPainter(this.width, this.height, {double radius, Color color})
      : super(radius, color);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final double dX = Random().nextInt(width.ceil()).ceilToDouble();
    final double dY = Random().nextInt(height.ceil()).ceilToDouble();
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
