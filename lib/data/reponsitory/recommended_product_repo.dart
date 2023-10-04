import 'package:get/get.dart';
import 'package:shopping_app/data/api/api_client.dart';
import 'package:shopping_app/utils/app_constants.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedProductRepo({required this.apiClient}); //ham xay dung

  //Phuong thức lấy danh sách thức ăn phổ biến
  Future<Response> getRecommendedProductList() async {
    return await apiClient.getData(AppConstains.RECOMMENDED_PRODUCT_URI);
  }
}
     