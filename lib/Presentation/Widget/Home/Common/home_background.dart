import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:sellit/Data/Datasource/Resources/app_colors.dart';

class CustomBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    path.moveTo(size.width, size.height * .3);
    path.lineTo(size.width - 200, size.height * .2);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * .2);

    path.close();

    Paint paint = Paint()..style = PaintingStyle.fill;

    paint.shader = ui.Gradient.linear(
        Offset(size.width, size.height), const Offset(0, 0), [
      AppColors.blue2,
      AppColors.blue1,
    ]);
    Paint paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = AppColors.primaryColor;

    Path path2 = Path();

    path2.moveTo(0, 0);
    path2.lineTo(size.width, 0);
    path2.lineTo(size.width, size.height);
    path2.lineTo(0, size.height);
    path2.lineTo(0, 0);

    canvas.drawPath(path2, paint2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
