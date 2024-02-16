import 'dart:ui' as ui;
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sellit/Data/Datasource/Resources/app_colors.dart';
import 'package:sellit/Data/Datasource/Resources/extensions/styling.dart';
import 'package:sellit/Presentation/Common/primary_container.dart';

// ignore: must_be_immutable
class BottomNavbarWidget extends StatelessWidget {
  BottomNavbarWidget({super.key, required this.item});
  final List<String> item;
  ValueNotifier bottomBarindex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: bottomBarindex,
      builder: (BuildContext context, value, Widget? child) => SizedBox(
        height: 103,
        child: CustomPaint(
          painter: BottomBarCustomPaint(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: item
                .mapIndexed((index, element) => TabBarItem(
                      isSelected: index == value,
                      ontap: () {
                        bottomBarindex.value = index;
                      },
                      iconUrl: element,
                    ))
                .toList(),
          ).symmetricPadding(horizontal: 20),
        ),
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    super.key,
    required this.isSelected,
    required this.ontap,
    required this.iconUrl,
  });
  final bool isSelected;
  final VoidCallback ontap;
  final String iconUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        height: 44.h,
        width: 48.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            isSelected
                ? Transform(
                    transform: Matrix4.skew(0, -.25),
                    child: PrimaryContainer(
                        shadowOffset: 10, width: 48.h, child: Container()),
                  )
                : Container(),
            // Image.asset(iconUrl)
            SvgPicture.asset(
              iconUrl,
              color: isSelected
                  ? AppColors.whiteColor
                  : AppColors.whiteColor.withOpacity(0.5),
            ).customPadding(b: 10)
          ],
        ),
      ).customPadding(b: 10),
    );
  }
}

class BottomBarCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, 30);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height - 30);
    path.close();
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
          Offset(size.width / 2, 0), Offset(size.width / 2, size.height), [
        AppColors.black1,
        AppColors.black2,
      ]);
    Paint paint2 = Paint()
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..color = AppColors.black1.withOpacity(1);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
