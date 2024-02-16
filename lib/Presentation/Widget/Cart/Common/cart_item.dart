import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sellit/Data/AppData/products.dart';
import 'package:sellit/Data/Datasource/Resources/app_colors.dart';
import 'package:sellit/Data/Datasource/Resources/app_textstyles.dart';
import 'package:sellit/Data/Datasource/Resources/extensions/styling.dart';
import 'package:sellit/Domain/Models/product_model.dart';
import 'package:sellit/Presentation/Common/app_text.dart';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:sellit/Presentation/Common/primary_container.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.productModel,
    required this.i,
  });
  final ProductModel productModel;
  final int i;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 90,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff363E51),
                Color(0xff4C5770),
              ],
            ),
            border: Border.all(
              width: 3,
              color: AppColors.black1.withOpacity(0.4),
            ),
          ),
          child: Image.asset(productModel.imageUrl)
              .symmetricPadding(horizontal: 5, vertical: 5),
        ),
        SizedBox(
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Apptext(
                text: productModel.title,
                style: AppTextStyles.circularStdBold(
                    color: AppColors.whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
              Apptext(
                text: '\$ ${productModel.price}',
                style: AppTextStyles.circularStdBold(
                  color: AppColors.blue1,
                  fontSize: 13,
                ),
              )
            ],
          ).customPadding(l: 16, t: 7, b: 7),
        ),
        const Spacer(),
        Container(
          height: 30.h,
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
            children: [
              GestureDetector(
                onTap: () {
                  productsData.value[i].cardCount++;
                  productsData.notifyListeners();
                },
                child: PrimaryContainer(
                  height: 24.h,
                  width: 24.h,
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
              Apptext(
                text: productModel.cardCount.toString(),
                style: AppTextStyles.circularStdBold(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor.withOpacity(0.6),
                ),
              ).customPadding(l: 10, r: 10),
              GestureDetector(
                onTap: () {
                  if (productsData.value[i].cardCount > 1) {
                    productsData.value[i].cardCount--;
                    productsData.notifyListeners();
                  }
                },
                child: PrimaryContainer(
                  height: 24.h,
                  width: 24.h,
                  borderColor: Colors.transparent,
                  colors: const [AppColors.black1, AppColors.black2],
                  child: Center(
                    child: Apptext(
                      text: '−',
                      style: AppTextStyles.circularStdBold(
                        color: AppColors.whiteColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ).symmetricPadding(horizontal: 3, vertical: 3),
        ),
      ],
    ).symmetricPadding(horizontal: 20, vertical: 8);
  }
}
