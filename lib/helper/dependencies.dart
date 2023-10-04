import 'package:get/get.dart';
import 'package:shopping_app/controllers/popular_product_controller.dart';
import 'package:shopping_app/controllers/recommended_product_controller.dart';
import 'package:shopping_app/data/api/api_client.dart';
import 'package:shopping_app/data/reponsitory/popular_product_repo.dart';
import 'package:shopping_app/data/reponsitory/recommended_product_repo.dart';
import 'package:shopping_app/utils/app_constants.dart';

//phuong thuc
Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstains.BASE_URL));

  //repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
