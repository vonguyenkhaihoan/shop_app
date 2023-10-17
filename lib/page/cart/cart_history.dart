import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/widgets/app_icon.dart';
import 'package:shopping_app/widgets/big_text.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCarHistory = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemsPerOder = Map();
    for (int i = 0; i < getCarHistory.length; i++) {
      if (cartItemsPerOder.containsKey(getCarHistory[i].time)) {
        cartItemsPerOder.update(getCarHistory[i].time!, (value) => ++value);
      } else {
        cartItemsPerOder.putIfAbsent(getCarHistory[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemsPerOder.entries.map((e) => e.value).toList();
    }

    List<int> orderTimes = cartOrderTimeToList();

    var saveCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: "Cart History",
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowtColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
