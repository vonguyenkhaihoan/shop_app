import 'package:get/get.dart';
import 'package:shopping_app/page/food/popular_food_detail.dart';
import 'package:shopping_app/page/food/recommened_food_detail.dart';
import 'package:shopping_app/page/home/main_food_page.dart';

class RouterHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommend-food";

  static String getInital() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () {
          return MainFoodPage();
        },
        transition: Transition.fadeIn),
    GetPage(
      
        name: popularFood,
        page: () {
          var pageId=Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId=Get.parameters['pageId'];

          return RecommendedFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
  ];
}
