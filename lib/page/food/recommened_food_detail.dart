import 'package:flutter/material.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/widgets/app_icon.dart';
import 'package:shopping_app/widgets/big_text.dart';

class RecommenedFoodDetail extends StatelessWidget {
  const RecommenedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                  child: BigText(
                    size: Dimension.font26,
                    text: "Hamberger Phô Mát",
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
              background: Image.asset(
                "assets/image/food0.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              "Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.Một chiếc bánh hamburger pho mát cơ bản bao gồm bánh mì kẹp thịt bò xay, phô mai và các loại topping khác. Bánh mì kẹp hamburger thường được làm từ bánh mì tròn, có thể là bánh mì nguyên hạt hoặc bánh mì trắng. Thịt bò xay thường được làm từ thịt bò nạc, nhưng cũng có thể được làm từ thịt bò mỡ hoặc thịt lợn. Phô mai thường được dùng là phô mai cheddar, nhưng cũng có thể được dùng là phô mai mozzarella, phô mai Gruyère hoặc các loại phô mai khác. Các loại topping khác thường được thêm vào để tăng hương vị và độ ngon của món ăn.",
            ),
          )
        ],
      ),
    );
  }
}
