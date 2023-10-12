import 'package:get/get.dart';
import 'package:shopping_app/page/cart/cart_page.dart';
import 'package:shopping_app/page/food/popular_food_detail.dart';
import 'package:shopping_app/page/food/recommened_food_detail.dart';
import 'package:shopping_app/page/home/main_food_page.dart';

class RouterHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommend-food";
  static const String cartPage = "/cart-page";

  static String getInital() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () {
          return MainFoodPage();
        }),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return PopularFoodDetail(pageId: int.parse(pageId!), page:page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return RecommendedFoodDetail(pageId: int.parse(pageId!), page:page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn),
  ];
}
