import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moneyloveapp/ui/ultil-widgets/ultil_widget.dart';

class RegisterPainter extends MyPainter {
  final double dY;
  final double dX;

  RegisterPainter(this.dX, this.dY, {double radius, Color color})
      : super(radius, color);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final center = Offset(dX, dY);
    final paint = Paint()
      ..color = color != null ? color : Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;
    canvas.drawCircle(center, radius != null ? radius : 60, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
