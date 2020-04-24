import 'package:flutter/material.dart';

abstract class MyPainter extends CustomPainter {
  final double radius;
  final Color color;

  MyPainter(this.radius, this.color);
}
