import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sellit/Application/Services/Navigation/app_navigation.dart';
import 'package:sellit/Data/AppData/products.dart';
import 'package:sellit/Data/Datasource/Resources/app_colors.dart';
import 'package:sellit/Data/Datasource/Resources/app_textstyles.dart';
import 'package:sellit/Data/Datasource/Resources/assets.dart';
import 'package:sellit/Data/Datasource/Resources/extensions/styling.dart';
import 'package:sellit/Presentation/Common/app_text.dart';
import 'package:sellit/Presentation/Common/primary_container.dart';
import 'package:sellit/Presentation/Widget/Cart/Common/cart_item.dart';
import 'package:sellit/Presentation/Widget/Cart/Common/checkout_widget.dart';
import 'package:sellit/Presentation/Widget/Cart/Common/coupon_widget.dart';
import 'package:sellit/Presentation/Widget/Cart/Common/title_subtitle.dart';
import 'package:sellit/Presentation/Widget/Cart/Common/total_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  ValueNotifier<bool> checkout = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.black2,
      body: Column(
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
                        .symmetricPadding(horizontal: 12.w, vertical: 12.h)),
              ),
              Apptext(
                text: 'My Shopping cart',
                style: AppTextStyles.circularStdBold(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ).customPadding(l: 30),
            ],
          ).symmetricPadding(horizontal: 20, vertical: 30),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: productsData,
              builder: (context, value, child) => ListView.separated(
                itemCount: value.length,
                itemBuilder: (context, index) => CartItem(
                  productModel: value[index],
                  i: index,
                ),
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: AppColors.whiteColor.withOpacity(0.3),
                  thickness: 0.5,
                ),
              ),
            ),
          ),
          Apptext(
            text: 'Your cart qualifies for free shipping',
            style: AppTextStyles.circularStdRegular(
                fontSize: 15, color: AppColors.whiteColor),
          ).symmetricPadding(vertical: 30),
          const CouponWidget(),
          const TitleSubtitle(title: 'Subtotal:', subTitle: '\$6119.99'),
          const TitleSubtitle(title: 'Delivery Fee:', subTitle: '\$0'),
          const TitleSubtitle(title: 'Discount:', subTitle: '%30'),
          const TotalWidget(),
          CheckoutWidget(loc: checkout)
        ],
      ),
    ));
  }
}
