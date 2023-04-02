import 'dart:math' as math;

import 'package:flutter/material.dart';

class HalfCircleShapeWidget extends StatelessWidget {
  final double width;
  final double height;

  const HalfCircleShapeWidget({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: Colors.pink,
      alignment: Alignment.bottomCenter,
      child: CustomPaint(
        painter: MyPainter(),
        size: Size(width, height),
      ),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    canvas.drawArc(Rect.fromCenter(center: Offset(size.height / 2, size.width / 2), height: size.height, width: size.width), math.pi, math.pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
