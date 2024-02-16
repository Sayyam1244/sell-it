import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

import 'package:sellit/Data/Datasource/Resources/app_colors.dart';
import 'package:sellit/Data/Datasource/Resources/app_textstyles.dart';
import 'package:sellit/Data/Datasource/Resources/assets.dart';
import 'package:sellit/Data/Datasource/Resources/extensions/styling.dart';
import 'package:sellit/Domain/Models/product_model.dart';
import 'package:sellit/Presentation/Common/app_text.dart';

class HomeGridItem extends StatelessWidget {
  const HomeGridItem(
      {super.key,
      required this.colors,
      required this.productModel,
      required this.onTap});
  final List<Color> colors;
  final ProductModel productModel;
  final Function(ProductModel productModel) onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(productModel);
      },
      child: CustomPaint(
        painter: HomeGridCustomPaint(colors: colors),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.favorite_outline,
                color: AppColors.whiteColor,
                size: 20,
              ),
            ),
            Expanded(
                child: Image.asset(
              Assets.bike2,
            )),
            Apptext(
              text: productModel.subTitle,
              style: AppTextStyles.circularStdRegular(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor.withOpacity(0.8)),
            ),
            Apptext(
              text: productModel.title,
              style: AppTextStyles.circularStdBold(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteColor),
            ).customPadding(b: 4),
            Apptext(
              text: '\$ ${productModel.price}',
              style: AppTextStyles.circularStdBold(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteColor.withOpacity(0.6)),
            ).customPadding(b: 4)
          ],
        ).symmetricPadding(vertical: 23.h, horizontal: 20.h),
      ),
    );
  }
}

class HomeGridCustomPaint extends CustomPainter {
  final List<Color> colors;

  HomeGridCustomPaint({super.repaint, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, size.height * .12);
    path.quadraticBezierTo(0, size.height * .07, 20, size.height * .05);
    path.lineTo(size.width - 20, 4);
    path.quadraticBezierTo(size.width, 0, size.width, 20);

    path.lineTo(size.width, size.height * .95 - 20);
    path.quadraticBezierTo(
        size.width, size.height * .94, size.width - 20, size.height * .96);

    path.lineTo(20, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 20);

    path.lineTo(0, size.height * .85);
    path.close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    Paint paint2 = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = AppColors.black1;

    paint.shader = ui.Gradient.linear(
        Offset(size.width, size.height), const Offset(0, 0), colors);

    canvas.drawPath(path, paint2);
    final paintShadow = Paint()
      ..style = PaintingStyle.fill
      ..color = colors.first.withOpacity(0.4)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5.0);

    canvas.drawPath(path.shift(Offset(5.0, 5.0)), paintShadow);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
