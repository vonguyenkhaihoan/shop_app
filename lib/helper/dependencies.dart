import 'package:get/get.dart';
import 'package:shopping_app/controllers/popular_product_controller.dart';
import 'package:shopping_app/data/api/api_client.dart';
import 'package:shopping_app/data/reponsitory/popular_product_repo.dart';

//phuong thuc
Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https//shopping_app/"));

  //repo
  Get.lazyPut(
    () => PopularProductRepo(apiClient: Get.find()),
  );

  //Controllers
    Get.lazyPut(
    () => PopularProductController(popularProductRepo: Get.find()),
  );
}
