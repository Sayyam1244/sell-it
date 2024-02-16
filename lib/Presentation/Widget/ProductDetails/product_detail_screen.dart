import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sellit/Application/Services/Navigation/app_navigation.dart';
import 'package:sellit/Data/Datasource/Resources/app_colors.dart';
import 'package:sellit/Data/Datasource/Resources/app_textstyles.dart';
import 'package:sellit/Data/Datasource/Resources/assets.dart';
import 'package:sellit/Data/Datasource/Resources/extensions/styling.dart';
import 'package:sellit/Domain/Models/product_model.dart';
import 'package:sellit/Presentation/Common/app_text.dart';
import 'package:sellit/Presentation/Common/primary_container.dart';
import 'package:sellit/Presentation/Widget/Cart/cart_screen.dart';
import 'package:sellit/Presentation/Widget/Home/Common/home_background.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.productModel});
  final ProductModel productModel;
  final ValueNotifier<bool> isDescription = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: CustomPaint(
            painter: CustomBackground(),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    surfaceTintColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    leading: Container(),
                    expandedHeight: MediaQuery.sizeOf(context).height / 2,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  AppNavigation.pop(context);
                                },
                                child: PrimaryContainer(
                                    shadowOffset: 14.h,
                                    child: SvgPicture.asset(Assets.backSvg)
                                        .symmetricPadding(
                                            horizontal: 12.w, vertical: 12.h)),
                              ).customPadding(r: 30),
                              Apptext(
                                text: productModel.title,
                                style: AppTextStyles.circularStdBold(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24),
                              ),
                            ],
                          ).symmetricPadding(horizontal: 20, vertical: 30),
                          SizedBox(
                            height: 200.h,
                            child: PageView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) => Image.asset(
                                Assets.bike2,
                                fit: BoxFit.cover,
                              ).symmetricPadding(horizontal: 20),
                            ),
                          ).customPadding(b: 20),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  border: Border.all(color: AppColors.black1, width: 3),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.black1,
                      AppColors.black2,
                    ],
                  ),
                ),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: isDescription,
                      builder: (context, value, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShadowButton(
                              title: 'Description',
                              isSelected: value,
                              onTap: () {
                                isDescription.value = true;
                              }),
                          ShadowButton(
                              title: 'Specification',
                              isSelected: !value,
                              onTap: () {
                                isDescription.value = false;
                              }),
                        ],
                      ),
                    ).symmetricPadding(horizontal: 30, vertical: 30),
                    Apptext(
                      text: productModel.title,
                      style: AppTextStyles.circularStdBold(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.whiteColor,
                      ),
                    ).customPadding(l: 30, t: 10),
                    Apptext(
                      maxLine: 30,
                      text: productModel.description,
                      style: AppTextStyles.circularStdRegular(
                        fontSize: 15,
                        color: AppColors.whiteColor.withOpacity(0.7),
                      ),
                    ).symmetricPadding(horizontal: 30, vertical: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
        extendBody: true,
        bottomNavigationBar: Container(
          height: 80.h,
          decoration: BoxDecoration(
            border:
                Border.all(color: AppColors.black1.withOpacity(0.8), width: 3),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.black1,
                  AppColors.black2,
                ]),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Apptext(
                text: '\$${productModel.price} ',
                style: AppTextStyles.circularStdBold(
                    color: AppColors.blue1, fontSize: 24),
              ),
              GestureDetector(
                onTap: () {
                  AppNavigation.to(context, CartScreen());
                },
                child: PrimaryContainer(
                  width: 140.w,
                  height: 40.h,
                  child: Center(
                    child: Apptext(
                      text: 'Add to cart',
                      style: AppTextStyles.circularStdBold(
                          fontWeight: FontWeight.w500,
                          color: AppColors.whiteColor,
                          fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ).symmetricPadding(horizontal: 35),
        ),
      ),
    );
  }
}

class ShadowButton extends StatelessWidget {
  const ShadowButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130.w,
        height: 43.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.black1),
          color: AppColors.black1,
          boxShadow: [
            BoxShadow(
              offset: const Offset(-4, -4),
              blurRadius: 9,
              color: Colors.white.withOpacity(0.1),
              inset: !isSelected,
            ),
            BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 9,
              color: const Color(0xff202633),
              inset: !isSelected,
            ),
          ],
        ),
        child: Center(
          child: Apptext(
              text: title,
              style: AppTextStyles.circularStdRegular(
                  fontSize: 15,
                  color: isSelected ? AppColors.blue1 : AppColors.whiteColor)),
        ),
      ),
    );
  }
}
