import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sellit/Data/Datasource/Resources/app_colors.dart';
import 'package:sellit/Data/Datasource/Resources/app_textstyles.dart';
import 'package:sellit/Data/Datasource/Resources/assets.dart';
import 'package:sellit/Data/Datasource/Resources/extensions/styling.dart';
import 'package:sellit/Presentation/Common/app_text.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      // decoration: BoxDecoration(color: AppColors.blackColor),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: CustomPaint(
          painter: PageViewCustomPaint(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20.h),
              Expanded(child: Image.asset(Assets.bike1)),
              Align(
                alignment: Alignment.bottomLeft,
                child: Apptext(
                  text: '30% Off',
                  style: AppTextStyles.circularStdBold(
                    fontSize: 28,
                    color: AppColors.whiteColor.withOpacity(0.5),
                  ),
                ),
              ).customPadding(b: 24, l: 16)
            ],
          ),
        ),
      ),
    );
  }
}

class PageViewCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, 30);
    path.quadraticBezierTo(0, 0, 30, 0);
    path.lineTo(size.width - 30, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 30);

    path.lineTo(size.width, size.height * .8 - 30);
    path.quadraticBezierTo(
        size.width, size.height * .8, size.width - 30, size.height * .85);

    path.lineTo(30, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 30);

    path.lineTo(0, 30);
    path.close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    Paint paint2 = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = AppColors.black1;

    paint.shader = ui.Gradient.linear(
        Offset(size.width, size.height), const Offset(0, 0), [
      AppColors.black1.withOpacity(.8),
      AppColors.black2.withOpacity(.8),
    ]);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
