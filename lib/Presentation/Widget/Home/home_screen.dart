import 'dart:developer';
import 'dart:ui';
import 'package:collection/collection.dart';
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
import 'package:sellit/Presentation/Widget/Home/Common/bottom_bar.dart';
import 'package:sellit/Presentation/Widget/Home/Common/home_background.dart';
import 'package:sellit/Presentation/Widget/Home/Common/home_grid_item.dart';
import 'package:sellit/Presentation/Widget/Home/Common/menu_widget.dart';
import 'dart:ui' as ui;

import 'package:sellit/Presentation/Widget/Home/Common/pageview_item.dart';
import 'package:sellit/Presentation/Widget/ProductDetails/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: CustomPaint(
              painter: CustomBackground(),
              child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        pinned: true,
                        backgroundColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        expandedHeight: MediaQuery.sizeOf(context).height * .65,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Apptext(
                                    text: 'Chose your bike',
                                    style: AppTextStyles.circularStdBold(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24),
                                  ),
                                  PrimaryContainer(
                                      shadowOffset: 14.h,
                                      child: Image.asset(Assets.search))
                                ],
                              ).symmetricPadding(horizontal: 20, vertical: 30),
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * .3,
                                width: MediaQuery.sizeOf(context).width,
                                child: PageView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) =>
                                      const PageViewItem(),
                                ),
                              ),
                              MenuWidget()
                            ],
                          ),
                        ),
                      )
                    ];
                  },
                  body: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 240.h,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemCount: productsData.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return HomeGridItem(
                        colors: index.isEven
                            ? [
                                AppColors.black2,
                                AppColors.black1,
                              ]
                            : [
                                const Color(0xff363E51).withOpacity(0.6),
                                const Color(0xff191E26).withOpacity(0.6),
                                // AppColors.blue1,
                              ],
                        productModel: productsData.value[index],
                        onTap: (productModel) {
                          AppNavigation.to(context,
                              ProductDetailScreen(productModel: productModel));
                        },
                      ).customPadding(t: index.isEven ? 18.h : 0);
                    },
                  ))),
        ),
        bottomNavigationBar: BottomNavbarWidget(
          item: const [
            Assets.byCycleSvg,
            Assets.mapSvg,
            Assets.shopingcartSvg,
            Assets.personSvg,
            Assets.docSvg,
          ],
        ),
      ),
    );
  }
}
