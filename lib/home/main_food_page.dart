import 'package:flutter/material.dart';
import 'package:shopping_app/home/food_page_body.dart';
import 'package:shopping_app/utils/colors.dart';
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
    return Scaffold(
        body: Column(
      children: [
        //show the header
        Container(
            child: Container(
                margin: EdgeInsets.only(top: 45, bottom: 15),
                padding: EdgeInsets.only(left: 20, right: 40),
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
                        width: 45,
                        height: 45,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
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
