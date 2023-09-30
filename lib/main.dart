import 'package:flutter/material.dart';
import 'package:shopping_app/page/food/popular_food_detail.dart';
import 'package:shopping_app/page/food/recommened_food_detail.dart';
import 'package:shopping_app/page/home/main_food_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: RecommenedFoodDetail(),
    );
  }
}
