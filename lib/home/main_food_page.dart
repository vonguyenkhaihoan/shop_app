import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/home/food_page_body.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/widgets/big_text.dart';
import 'package:shopping_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("height is " + MediaQuery.of(context).size.height.toString());
    return Scaffold(
        body: Column(
      children: [
        //show the header
        Container(
            child: Container(
                margin: EdgeInsets.only(
                    top: Dimension.height45, bottom: Dimension.height15),
                padding: EdgeInsets.only(
                    left: Dimension.width20, right: Dimension.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: "Cần Thơ", color: AppColors.mainColor),
                        Row(
                          children: [
                            SmallText(
                              text: "Thành Phố Cần Thơ",
                              color: Colors.black54,
                            ),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimension.height45,
                        height: Dimension.height45,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimension.iconSize24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.radious15),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ))),

        // show slider
        FoodPageBody(),
      ],
    ));
  }
}
