import 'package:get/get.dart';
import 'package:shopping_app/data/api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient}); //ham xay dung

  //Phuong thức lấy danh sách thức ăn phổ biến
  Future<Response> getPopularProductList() async {
    return await apiClient.getData("https://shopping_app/api/proiduct/popular");
  }
}
