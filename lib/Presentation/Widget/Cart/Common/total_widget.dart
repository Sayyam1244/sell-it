import 'package:flutter/material.dart';
import 'package:sellit/Data/Datasource/Resources/app_colors.dart';
import 'package:sellit/Data/Datasource/Resources/app_textstyles.dart';
import 'package:sellit/Data/Datasource/Resources/extensions/styling.dart';
import 'package:sellit/Presentation/Common/app_text.dart';

class TotalWidget extends StatelessWidget {
  const TotalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Apptext(
            text: 'Total:',
            style: AppTextStyles.circularStdBold(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: AppColors.whiteColor)),
        Apptext(
            text: '\$4,283.99',
            style: AppTextStyles.circularStdRegular(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: AppColors.blue1)),
      ],
    ).customPadding(t: 16, l: 20, r: 20, b: 10);
  }
}
