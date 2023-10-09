import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/controllers/popular_product_controller.dart';
import 'package:shopping_app/page/home/main_food_page.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/widgets/app_column.dart';
import 'package:shopping_app/widgets/app_icon.dart';

import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/widgets/expandable_text_widget.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

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
                  image: AssetImage(
                      "assets/image/food0.jpg") /*NetworkImage(AppConstains.BASE_URL +
                      AppConstains.UPLOAD_URL +
                      popularProduct.img!),
                )*/
                  ,
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
                    Get.to(
                      () => MainFoodPage(),
                    );
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),
                GetBuilder<PopularProductController>(
                  builder: (controller) {
                    return Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularProductController>().totalItems >= 1
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
                  AppColumn(
                    text: "Hammberger Pho Mat" /*product.name!*/,
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  BigText(
                    text: "Giới Thiệu",
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: /*product.description!*/
                            "Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.",
                      ),
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
                Container(
                  padding: EdgeInsets.only(
                      top: Dimension.height20,
                      bottom: Dimension.height20,
                      left: Dimension.width20,
                      right: Dimension.width20),
                  child: GestureDetector(
                    onTap: () {
                      /*popularProduct.addItem(product);*/
                    },
                    child: BigText(
                      text: "\$10" + /*${product.price!}*/ " | Add to Cart",
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radious20),
                    color: AppColors.mainColor,
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



