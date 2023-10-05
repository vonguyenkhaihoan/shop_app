import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/reponsitory/popular_product_repo.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/utils/colors.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity; /*== int get quantity { return quantity}*/
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  //Phương thức nhận danh sách sản phẩm phổ biến ,phuong thuc dieu khien
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      // print("get products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print("could not get product popular");
    }
  }

  //############ Hàm làm tăng giảm số lượng ###############
  void setQuantity(bool inIncrement) {
    if (inIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        "Số lượng sản phẩm",
        "Bạn không thể giảm sản phẩm được nữa",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (quantity > 20) {
      Get.snackbar(
        "Số lượng sản phẩm",
        "Bạn không thể thêm sản phẩm được nữa",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct() {
    _quantity = 0;
  }
}
