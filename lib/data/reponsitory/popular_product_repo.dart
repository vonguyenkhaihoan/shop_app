import 'package:get/get.dart';
import 'package:shopping_app/data/api/api_client.dart';
import 'package:shopping_app/utils/app_constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient}); //ham xay dung

  //Phuong thức lấy danh sách thức ăn phổ biến
  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstains.POPULAR_PRODUCT_URI);
  }
}
     