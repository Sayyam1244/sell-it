import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sellit/Data/Datasource/Resources/app_colors.dart';
import 'package:sellit/Data/Datasource/Resources/app_textstyles.dart';
import 'package:sellit/Data/Datasource/Resources/extensions/styling.dart';
import 'package:sellit/Presentation/Common/app_text.dart';
import 'package:sellit/Presentation/Common/primary_container.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.black1),
        color: AppColors.black1,
        boxShadow: [
          BoxShadow(
            offset: const Offset(-4, -4),
            blurRadius: 9,
            color: Colors.white.withOpacity(0.1),
            inset: true,
          ),
          const BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 9,
            color: Color(0xff202633),
            inset: true,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Apptext(
                  text: 'Bike30',
                  style: AppTextStyles.circularStdRegular(
                      fontSize: 13,
                      color: AppColors.whiteColor.withOpacity(0.6)))
              .symmetricPadding(horizontal: 20, vertical: 10),
          PrimaryContainer(
              width: 100.w,
              child: Center(
                child: Apptext(
                    text: 'Apply',
                    style: AppTextStyles.circularStdBold(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: AppColors.whiteColor)),
              ))
        ],
      ),
    ).customPadding(l: 20, r: 20, b: 20);
  }
}
