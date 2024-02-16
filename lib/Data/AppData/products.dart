import 'package:flutter/material.dart';
import 'package:sellit/Data/Datasource/Resources/assets.dart';
import 'package:sellit/Domain/Models/product_model.dart';

final ValueNotifier<List<ProductModel>> productsData =
    ValueNotifier(List.generate(
  100,
  (index) => ProductModel(
      imageUrl: Assets.bike2,
      title: 'PEUGEOT - LR01 ',
      subTitle: 'Road Bike',
      description:
          '''The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain.''',
      price: 1920.9 + index,
      cardCount: 1),
));
