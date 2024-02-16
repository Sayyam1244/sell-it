import 'dart:developer';

import 'package:sellit/Data/Datasource/Resources/app_colors.dart';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:sellit/Data/Datasource/Resources/app_textstyles.dart';
import 'package:sellit/Data/Datasource/Resources/extensions/styling.dart';
import 'package:sellit/Presentation/Common/app_text.dart';
import 'package:sellit/Presentation/Common/primary_container.dart';

class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget({
    super.key,
    required this.loc,
  });

  final ValueNotifier<bool> loc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
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
      child: ValueListenableBuilder(
        valueListenable: loc,
        builder: (context, value, child) => Stack(
          children: [
            SizedBox(
              height: 50,
              child: Center(
                child: Apptext(
                  text: !value ? 'Amazing' : 'Checkout',
                  style: AppTextStyles.circularStdRegular(
                    fontSize: 15,
                    color: AppColors.whiteColor.withOpacity(0.6),
                  ),
                ),
              ),
            ),

            // Positioned(
            //   left: value,
            //   child: GestureDetector(
            //     onHorizontalDragUpdate: (details) {
            //       if (details.localPosition.dx > 0.0 &&
            //           details.localPosition.dx < 150) {
            //         loc.value = details.localPosition.dx;
            //         log(details.localPosition.toString());
            //       }
            //     },
            //     child: const PrimaryAnimatedContainer(
            //       height: 50,
            //       width: 50,
            //       child: Center(
            //         child: Icon(
            //           Icons.arrow_forward_ios,
            //           color: AppColors.whiteColor,
            //         ),
            //       ),
            //     ),
            //   ),
            // )
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: value ? 0.0 : 147,
              right: !value ? 0 : 150,
              child: GestureDetector(
                onTap: () {
                  loc.value = !value;
                },
                child: PrimaryAnimatedContainer(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Icon(
                      value ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                      color: AppColors.whiteColor,
                    ).customPadding(l: value ? 0 : 10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ).customPadding(l: 20, r: 20, b: 20, t: 20);
  }
}
