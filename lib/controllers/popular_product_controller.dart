import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/data/reponsitory/popular_product_repo.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/utils/colors.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity; /*== int get quantity { return quantity}*/
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  //----Phương thức nhận danh sách sản phẩm phổ biến ,phuong thuc dieu khien-------------
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

  //------------ Hàm làm tăng giảm số lượng ---------------
  void setQuantity(bool inIncrement) {
    if (inIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      // print("number of items " + _quantity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
      // print("number of items decrement" + _quantity.toString());

    }
    update();
  }

//-------------- Kiểm tra số lượng và thông báo --------------
  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "Số lượng sản phẩm",
        "Bạn không thể giảm sản phẩm được nữa",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if (quantity > 20) {
      //(_inCartItems + quantity)  để khi có số lượng hiện trên trang chi tiết có thể trừ đi
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

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0; //khi vào trang chi tiết số lượng bằng 0
    _inCartItems = 0;
    _cart = cart;

    //--- kiểm tra số lượng sản phẩm có trong giủo hàng khi mà mình xem chi tiết sản phẩm đó ---
    var exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

//---------Thêm sản phẩm ----------
  void addItem(ProductModel product) {
    // if (_quantity > 0) {
    _cart.addItem(product, quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach(
      (key, value) {
        print("ID là " +
            value.id.toString() +
            "số lượng sản phẩm " +
            value.quantity.toString());
      },
    );
    update();
    // } else {
    //   Get.snackbar(
    //     "Số lượng sản phẩm",
    //     "Bạn nên thêm ít nhất một món hàng vào giỏ hàng!",
    //     backgroundColor: AppColors.mainColor,
    //     colorText: Colors.white,
    //   );
    // }
  }

  //------ hàm lấy tổng số vật phẩm -----------
  int get totalItems {
    return _cart.totalItems;
  }
}
