import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/utils/app_constants.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    // sharedPreferences.remove(AppConstains.CART_LIST);
    // sharedPreferences.remove(AppConstains.CART_HISTORY_LIST);
    var time = DateTime.now().toString();
    cart = [];

    /* covert object to string because sharedprefences only accet string */
    // cartList.forEach((element) {
    //   return cart.add(jsonEncode(element));
    // }); cach dưới gút gọn hơn trên này
    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstains.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstains.CART_LIST));
    // getCartList();
  }

  // hàm lấy danh sách giỏ hàng
  List<CartModel> getCartList() {
    List<String> carts = [];

    if (sharedPreferences.containsKey(AppConstains.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstains.CART_LIST)!;
      print("inside getCartlist" + carts.toString());
    }

    List<CartModel> cartList = [];

    // carts.forEach((element) {
    //   cartList.add(CartModel.fromJson(jsonDecode(element)));
    // });cách dưới rút gọn của cái này
    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }

  // ham lay danh sach lich su gio hang
  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstains.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstains.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) =>
        cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }

  // them vao lich su gio hang
  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstains.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstains.CART_HISTORY_LIST)!;
    }

    for (int i = 0; i < cart.length; i++) {
      print("history list " + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(
        AppConstains.CART_HISTORY_LIST, cartHistory);
    print("The lenght of history list is" +
        getCartHistoryList().length.toString());
    for (int i = 0; i < getCartHistoryList().length; i++) {
      print("The time for the order is " +
        getCartHistoryList()[i].time.toString());
    }
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstains.CART_LIST);
  }
}
