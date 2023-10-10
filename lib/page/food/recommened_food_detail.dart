import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/controllers/popular_product_controller.dart';
import 'package:shopping_app/controllers/recommended_product_controller.dart';
import 'package:shopping_app/page/cart/cart_page.dart';
import 'package:shopping_app/routes/routes_helper.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/widgets/app_icon.dart';
import 'package:shopping_app/widgets/big_text.dart';
import 'package:shopping_app/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouterHelper.getInital());
                  },
                  child: AppIcon(icon: Icons.clear),
                ),
                // AppIcon(icon: Icons.shopping_cart_outlined)
                GetBuilder<PopularProductController>(
                  builder: (controller) {
                    return Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => CartPage());
                                  },
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
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
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                  child: BigText(
                    size: Dimension.font26,
                    text: "Hamberger Phô Mát" /*product.name! */,
                  ),
                ),
                width: double.infinity,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimension.radious20),
                    topRight: Radius.circular(Dimension.radious20),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowtColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                /*AppConstains.BASE_URL +
                      AppConstains.UPLOAD_URL +
                      popularProduct.img!*/
                "assets/image/food0.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(
                    text: /*product.description */
                        "Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.",
                  ),
                  margin: EdgeInsets.only(
                      left: Dimension.width20, right: Dimension.width20),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimension.width20 * 2.5,
                  right: Dimension.width20 * 2.5,
                  top: Dimension.height10,
                  bottom: Dimension.height10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        iconSize: Dimension.iconSize24,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.remove,
                      ),
                    ),
                    BigText(
                      text: "\$ " + /*${product.price!}*/
                          " X " +
                          "${controller.inCartItems}",
                      color: AppColors.mainBlacktextColor,
                      size: Dimension.font26,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        iconSize: Dimension.iconSize24,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.add,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                        borderRadius:
                            BorderRadius.circular(Dimension.radious20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimension.height20,
                            bottom: Dimension.height20,
                            left: Dimension.width20,
                            right: Dimension.width20),
                        child: BigText(
                          text: "\$ ${product.price!} | Add to Cart",
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.radious20),
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
