import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/controllers/popular_product_controller.dart';
import 'package:shopping_app/controllers/recommended_product_controller.dart';
import 'package:shopping_app/data/api/api_client.dart';
import 'package:shopping_app/data/reponsitory/cart_repo.dart';
import 'package:shopping_app/data/reponsitory/popular_product_repo.dart';
import 'package:shopping_app/data/reponsitory/recommended_product_repo.dart';
import 'package:shopping_app/utils/app_constants.dart';

//phuong thuc
Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstains.BASE_URL));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
