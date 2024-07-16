import 'dart:math';

import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final AnimationController controller;

  CustomLoader({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return CustomPaint(
            painter: LoaderPainter(controller.value),
          );
        },
      ),
    );
  }
}

class LoaderPainter extends CustomPainter {
  final double progress;

  LoaderPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    final double radius = size.width / 2.5;
    final int dotCount = 12;
    final double maxDotRadius = size.width / 24;

    for (int i = 0; i < dotCount; i++) {
      final double angle = (i / dotCount) * 2 * pi;
      final double x = radius + radius * cos(angle + progress * 2 * pi);
      final double y = radius + radius * sin(angle + progress * 2 * pi);

      // Determine opacity and size for each circle
      final double opacity = (i == 0 || i == 1) ? 0.25 : 1.0;
      final double dotRadius = maxDotRadius * (1 + (i / dotCount));

      paint.color = Colors.white.withOpacity(opacity);

      canvas.drawCircle(Offset(x, y), dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
