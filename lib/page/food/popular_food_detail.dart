import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/controllers/popular_product_controller.dart';
import 'package:shopping_app/page/cart/cart_page.dart';
import 'package:shopping_app/page/home/main_food_page.dart';
import 'package:shopping_app/routes/routes_helper.dart';
import 'package:shopping_app/utils/app_constants.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/widgets/app_column.dart';
import 'package:shopping_app/widgets/app_icon.dart';

import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/widgets/expandable_text_widget.dart';
import 'package:shopping_app/widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimension.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstains.BASE_URL +
                      AppConstains.UPLOAD_URL +
                      product.img!),
                ),
              ),
            ),
          ),
          //icon wdiget
          Positioned(
            top: Dimension.height45,
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (page == "cartpage") {
                      Get.toNamed(RouterHelper.getCartPage());
                    } else {
                      Get.toNamed(RouterHelper.getInital());
                    }
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),
                GetBuilder<PopularProductController>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.totalItems >= 1)
                          Get.toNamed(RouterHelper.getCartPage());
                      },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                )
                              : Container(),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  right: 3,
                                  top: 3,
                                  child: BigText(
                                    text: Get.find<PopularProductController>()
                                        .totalItems
                                        .toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          //introduct food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimension.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimension.width20,
                right: Dimension.width20,
                top: Dimension.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimension.radious20),
                    topLeft: Radius.circular(Dimension.radious20)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name!),
                  SizedBox(height: Dimension.height20),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimension.height20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(text: product.description!),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //expandable text widget
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
            height: Dimension.bottomHeighttBar,
            padding: EdgeInsets.only(
              top: Dimension.height30,
              bottom: Dimension.height30,
              left: Dimension.width20,
              right: Dimension.width20,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimension.radious20 * 2),
                topRight: Radius.circular(Dimension.radious20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimension.height20,
                      bottom: Dimension.height20,
                      left: Dimension.width20,
                      right: Dimension.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radious20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimension.width15,
                      ),
                      BigText(text: popularProduct.quantity.toString()),
                      /* thay thế quantity bằng inCartItems thì sẽ hiển thị số lượng đã có trong giỏ hàng khi xem chi tiết*/
                      SizedBox(
                        width: Dimension.width15,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimension.height20,
                        bottom: Dimension.height20,
                        left: Dimension.width20,
                        right: Dimension.width20),
                    child: BigText(
                      text: "\$ ${product.price!}  | Add to Cart",
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radious20),
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


// bottomNavigationBar: Container(
//         height: 120,
//         padding: EdgeInsets.only(
//           top: Dimension.height30,
//           bottom: Dimension.height30,
//           left: Dimension.width20,
//           right: Dimension.width20,
//         ),
//         decoration: BoxDecoration(
//           color: AppColors.buttonBackgroundColor,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(Dimension.radious20 * 2),
//             topRight: Radius.circular(Dimension.radious20 * 2),
//           ),
//         ),
//         child:Column(
//           children: [
//              Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               padding: EdgeInsets.only(
//                   top: Dimension.height20,
//                   bottom: Dimension.height20,
//                   left: Dimension.width20,
//                   right: Dimension.width20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(Dimension.radious20),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.remove,
//                     color: AppColors.signColor,
//                   ),
//                   SizedBox(
//                     width: Dimension.width15,
//                   ),
//                   BigText(text: "0"),
//                   SizedBox(
//                     width: Dimension.width15,
//                   ),
//                   Icon(
//                     Icons.add,
//                     color: AppColors.signColor,
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                   top: Dimension.height20,
//                   bottom: Dimension.height20,
//                   left: Dimension.width20,
//                   right: Dimension.width20),
//               child: BigText(text: "\$10 | Add to Cart"),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(Dimension.radious20),
//                 color: AppColors.mainColor,
//               ),
//             ),
//           ],
//         ),
//             Container(
//               width: double.infinity,
//                padding: EdgeInsets.only(
//                   top: Dimension.height20,
//                   bottom: Dimension.height20,
//                   left: Dimension.width20,
//                   right: Dimension.width20),
//               child: BigText(text: " Add to Cart"),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(Dimension.radious20),
//                 color: AppColors.mainColor,
//               ),
//             )
//           ],
//         ),
//       ),



