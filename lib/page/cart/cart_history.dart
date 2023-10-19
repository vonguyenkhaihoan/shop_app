import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/base/no_data_page.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/routes/routes_helper.dart';
import 'package:shopping_app/utils/app_constants.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/widgets/app_icon.dart';
import 'package:shopping_app/widgets/big_text.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/widgets/small_text.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCarHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOder = Map();
    for (int i = 0; i < getCarHistoryList.length; i++) {
      if (cartItemsPerOder.containsKey(getCarHistoryList[i].time)) {
        cartItemsPerOder.update(getCarHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOder.putIfAbsent(getCarHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOderToList() {
      return cartItemsPerOder.entries.map((e) => e.value).toList();
    }

    List<String> cartOderTimeToList() {
      return cartItemsPerOder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOder = cartItemsPerOderToList();

    var listCounter = 0;

    Widget timeWidget(int index) {
      var outputDate = DateTime.now().toString();
      if (index < getCarHistoryList.length) {
        DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss")
            .parse(getCarHistoryList[listCounter].time!);
        var inputDate = DateTime.parse(parseDate.toString());
        var outputFormat = DateFormat("dd/MM/yyyy hh:mm a");
         outputDate = outputFormat.format(inputDate);
      }
      return BigText(text: outputDate);
    }

    return Scaffold(
      body: Column(
        children: [
          /*-----Header--------- */
          Container(
            height: Dimension.height10 * 10,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimension.height45),
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
          /*-----Body--------- */
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getCartHistoryList().length > 0
                ? Expanded(
                    child: Container(
                      // color: Colors.red,
                      // height: 500,
                      margin: EdgeInsets.only(
                        top: Dimension.height20,
                        left: Dimension.width20,
                        right: Dimension.width20,
                      ),
                      child: MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView(
                          children: [
                            for (int i = 0; i < itemsPerOder.length; i++)
                              Container(
                                // color: Colors.blue,dung de coi nos nhu nao
                                height: Dimension.height30 * 4,
                                margin:
                                    EdgeInsets.only(bottom: Dimension.height20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    timeWidget(listCounter),
                                    SizedBox(height: Dimension.height10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Wrap(
                                          direction: Axis.horizontal,
                                          children: List.generate(
                                            itemsPerOder[i],
                                            (index) {
                                              if (listCounter <
                                                  getCarHistoryList.length) {
                                                listCounter++;
                                              }
                                              return index <= 2
                                                  ? Container(
                                                      height:
                                                          Dimension.height20 *
                                                              4,
                                                      width:
                                                          Dimension.height20 *
                                                              4,
                                                      margin: EdgeInsets.only(
                                                          right: Dimension
                                                                  .width10 /
                                                              2),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(Dimension
                                                                    .radious15 /
                                                                2),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(AppConstains
                                                                  .BASE_URL +
                                                              AppConstains
                                                                  .UPLOAD_URL +
                                                              getCarHistoryList[
                                                                      listCounter]
                                                                  .img!),
                                                        ),
                                                      ),
                                                    )
                                                  : Container();
                                            },
                                          ),
                                        ),
                                        Container(
                                          // color: Colors.red,xem thu khong gian cua no
                                          height: Dimension.height20 * 4,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              SmallText(text: "Total"),
                                              BigText(
                                                text:
                                                    itemsPerOder[i].toString() +
                                                        " Items",
                                                color: AppColors.titleColor,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  var orderTime =
                                                      cartOderTimeToList();
                                                  Map<int, CartModel> moreOder =
                                                      {};
                                                  for (int j = 0;
                                                      j <
                                                          getCarHistoryList
                                                              .length;
                                                      j++) {
                                                    if (getCarHistoryList[j]
                                                            .time ==
                                                        orderTime[i]) {
                                                      // print("The cart or product id is " + getCarHistoryList[j].product!.id.toString());
                                                      moreOder.putIfAbsent(
                                                          getCarHistoryList[j]
                                                              .id!,
                                                          () => CartModel.fromJson(
                                                              jsonDecode(jsonEncode(
                                                                  getCarHistoryList[
                                                                      j]))));
                                                    }
                                                  }
                                                  Get.find<CartController>()
                                                      .setItems = moreOder;
                                                  Get.find<CartController>()
                                                      .addToCartList();
                                                  Get.toNamed(RouterHelper
                                                      .getCartPage());
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Dimension.width10,
                                                      vertical:
                                                          Dimension.height10 /
                                                              2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimension
                                                                    .radious15 /
                                                                3),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: AppColors
                                                            .mainColor),
                                                  ),
                                                  child: SmallText(
                                                    text: "one more",
                                                    color: AppColors.mainColor,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: const Center(
                      child: NoDataPage(text: "Your didn't buy any thing!"),
                    ),
                  );
          })
        ],
      ),
    );
  }
}
