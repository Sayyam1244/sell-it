import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sellit/Data/Datasource/Resources/app_colors.dart';
import 'package:sellit/Data/Datasource/Resources/app_textstyles.dart';
import 'package:sellit/Data/Datasource/Resources/assets.dart';
import 'package:sellit/Data/Datasource/Resources/extensions/styling.dart';
import 'package:sellit/Presentation/Common/app_text.dart';
import 'package:sellit/Presentation/Common/primary_container.dart';

class MenuWidget extends StatelessWidget {
  MenuWidget({
    super.key,
  });
  final List<String> menuIcons = [
    'All',
    Assets.cycle2Svg,
    Assets.roadSvg,
    Assets.mountainSvg,
    Assets.helmetSvg,
  ];
  ValueNotifier<int> index = ValueNotifier(0);
  List<Color> selected = [AppColors.blue1, AppColors.blue2];
  List<Color> unSelected = [
    AppColors.black1.withOpacity(0.8),
    AppColors.black2.withOpacity(0.8)
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      height: 120,
      child: ValueListenableBuilder(
        valueListenable: index,
        builder: (context, value, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => index.value = 0,
              child: PrimaryContainer(
                  colors: value == 0 ? selected : unSelected,
                  child: Center(
                    child: Apptext(
                        text: 'All',
                        style: AppTextStyles.circularStdRegular(
                            fontSize: 13,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600)),
                  )).customPadding(t: (60).toDouble()),
            ),
            GestureDetector(
                    onTap: () => index.value = 1,
                    child: PrimaryContainer(
                        colors: value == 1 ? selected : unSelected,
                        child: Center(child: SvgPicture.asset(menuIcons[1]))))
                .customPadding(t: (45).toDouble()),
            GestureDetector(
                    onTap: () => index.value = 2,
                    child: PrimaryContainer(
                        colors: value == 2 ? selected : unSelected,
                        child: Center(child: SvgPicture.asset(menuIcons[2]))))
                .customPadding(t: (30).toDouble()),
            GestureDetector(
                    onTap: () => index.value = 3,
                    child: PrimaryContainer(
                        colors: value == 3 ? selected : unSelected,
                        child: Center(child: SvgPicture.asset(menuIcons[3]))))
                .customPadding(t: (15).toDouble()),
            GestureDetector(
                    onTap: () => index.value = 4,
                    child: PrimaryContainer(
                        colors: value == 4 ? selected : unSelected,
                        child: Center(child: SvgPicture.asset(menuIcons[4]))))
                .customPadding(t: (0).toDouble())
          ],
        ),
      ),
    ).symmetricPadding(horizontal: 20);
  }
}


// List<Widget> arrangeMenuItem() {
//     List<String> menuIcons = [
//       'All',
//       Assets.cycle2Svg,
//       Assets.roadSvg,
//       Assets.mountainSvg,
//       Assets.helmetSvg,
//     ];
//     List<Widget> menuItem = [
//       PrimaryContainer(
//           child: Center(
//         child: Apptext(
//             text: 'All',
//             style: AppTextStyles.circularStdRegular(
//                 fontSize: 13,
//                 color: AppColors.whiteColor,
//                 fontWeight: FontWeight.w600)),
//       )).customPadding(t: (60).toDouble()),
//       PrimaryContainer(colors: [
//         AppColors.black1.withOpacity(0.8),
//         AppColors.black2.withOpacity(0.8),
//       ], child: Center(child: SvgPicture.asset(menuIcons[1])))
//           .customPadding(t: (45).toDouble()),
//       PrimaryContainer(colors: [
//         AppColors.black1.withOpacity(0.8),
//         AppColors.black2.withOpacity(0.8),
//       ], child: Center(child: SvgPicture.asset(menuIcons[2])))
//           .customPadding(t: (30).toDouble()),
//       PrimaryContainer(colors: [
//         AppColors.black1.withOpacity(0.8),
//         AppColors.black2.withOpacity(0.8),
//       ], child: Center(child: SvgPicture.asset(menuIcons[3])))
//           .customPadding(t: (15).toDouble()),
//       PrimaryContainer(colors: [
//         AppColors.black1.withOpacity(0.8),
//         AppColors.black2.withOpacity(0.8),
//       ], child: Center(child: SvgPicture.asset(menuIcons[4])))
//           .customPadding(t: (0).toDouble())
//     ];
//     // for (var i = 0; i < menuIcons.length; i++) {
//     //   log((20 * i).toDouble().toString());
//     //   if (i == 0) {
//     //     menuItem.add(PrimaryContainer(
//     //         child: Center(
//     //       child: Apptext(
//     //           text: 'All',
//     //           style: AppTextStyles.circularStdRegular(
//     //               fontSize: 13,
//     //               color: AppColors.whiteColor,
//     //               fontWeight: FontWeight.w600)),
//     //     )).customPadding(b: (i * 15).toDouble()));
//     //   } else {
//     //     menuItem.add(PrimaryContainer(colors: [
//     //       AppColors.black1.withOpacity(0.8),
//     //       AppColors.black2.withOpacity(0.8),
//     //     ], child: Image.asset(menuIcons[i]))
//     //         .customPadding(
//     //       b: (i * 15).toDouble(),
//     //     ));
//     //   }
//     // }
//     return menuItem;
//   }
