import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/data/reponsitory/cart_repo.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {}; //bảng đồ lưu trữ dữ liệu

  Map<int, CartModel> get items => _items;

/* only for storage and sharepreferences */
  List<CartModel> storageItems = [];

//----------- Thêm sản phẩm vào giỏ hàng ------------
  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity =
            value.quantity! + quantity; //value.quantity đối tượng cũ

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
          product.id!,
          () {
            return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: product,
            );
          },
        );
      } else {
        Get.snackbar(
          "Số lượng sản phẩm",
          "Bạn nên thêm ít nhất một món hàng vào giỏ hàng!",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  //--------- Kiểm tra tồn tại sản phẩm trong giỏ hàng -------------
  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  //----- phương thức lấy số lượng nếy ản phẩm tồn tại trong giỏ hàng ---------
  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  // --- hàm lấy tống số lượng
  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  // hàm trả về danh sách  mô hình giỏ hàng mau the các vật phẩm
  List<CartModel> get getItems {
    return _items.entries.map((e) {
      //entries thuoc tinh nhap cua ban do
      return e.value;
    }).toList();
  }

  //tổng số tiền
  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  // phương thức lấy dữ liệu giỏ hàng
  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;

    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  //ham them vao lichj su gio hang
  void addToHistory() {
    cartRepo.addToCartHistoryList();
    clear();
  }

  void clear() {
    _items = {};
    update();
  }
}
