import 'package:flutter/material.dart';
import 'package:shopping_app/controllers/popular_product_controller.dart';
import 'package:shopping_app/controllers/recommended_product_controller.dart';
import 'package:shopping_app/page/cart/cart_page.dart';
import 'package:shopping_app/page/food/popular_food_detail.dart';
import 'package:shopping_app/page/food/recommened_food_detail.dart';
import 'package:shopping_app/page/home/food_page_body.dart';
import 'package:shopping_app/page/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:shopping_app/routes/routes_helper.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: MainFoodPage(),
      initialRoute: RouterHelper.initial,
      getPages: RouterHelper.routes,
    );
  }
}
