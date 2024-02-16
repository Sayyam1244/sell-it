import 'package:flutter/material.dart';
import 'package:sellit/Data/Datasource/Resources/app_colors.dart';
import 'package:sellit/Data/Datasource/Resources/app_textstyles.dart';
import 'package:sellit/Data/Datasource/Resources/extensions/styling.dart';
import 'package:sellit/Presentation/Common/app_text.dart';

class TitleSubtitle extends StatelessWidget {
  const TitleSubtitle({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Apptext(
            text: title,
            style: AppTextStyles.circularStdBold(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: AppColors.whiteColor)),
        Apptext(
            text: subTitle,
            style: AppTextStyles.circularStdRegular(
                fontSize: 15, color: AppColors.whiteColor.withOpacity(0.6))),
      ],
    ).symmetricPadding(horizontal: 20, vertical: 4);
  }
}
