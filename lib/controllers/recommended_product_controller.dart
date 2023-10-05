import 'package:get/get.dart';
import 'package:shopping_app/data/reponsitory/popular_product_repo.dart';
import 'package:shopping_app/data/reponsitory/recommended_product_repo.dart';
import 'package:shopping_app/models/product_model.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  //Phương thức nhận danh sách sản phẩm phổ biến ,phuong thuc dieu khien
  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      // print("get products reconmmended");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print("could not get product recommended");
    }
  }
}
