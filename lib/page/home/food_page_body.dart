import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/popular_product_controller.dart';
import 'package:shopping_app/controllers/recommended_product_controller.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/page/food/popular_food_detail.dart';
import 'package:shopping_app/routes/routes_helper.dart';
import 'package:shopping_app/utils/app_constants.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
import 'package:shopping_app/widgets/app_column.dart';
import 'package:shopping_app/widgets/big_text.dart';
import 'package:shopping_app/widgets/icon_and_text_widget.dart';
import 'package:shopping_app/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0; //so trang slide
  double _scaleFactor = 0.8;
  double _hightSlide = Dimension.pageViewContainer; // chieu cao slide

  @override //ghi đè
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // super.dispose();
    pageController.dispose(); // xóa cái chỉ mục trang slide để ko tốn bộ nhớ
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  // color: Colors.redAccent, test
                  height: Dimension.pageView,

                  child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.popularProductList.length,
                    itemBuilder: (context, position) {
                      return _buildPageItem(position,
                          popularProducts.popularProductList[position]);
                    },
                  ),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),

        //dots
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.length <= 0
                ? 1
                : popularProducts.popularProductList.length,
            position: _currPageValue.floor(),
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

        //Popular text
        SizedBox(
          height: Dimension.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimension.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: Dimension.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: Dimension.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Food pairing",
                ),
              ),
            ],
          ),
        ),

        //list of food and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            RouterHelper.getRecommendedFood(index, "home"));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimension.width20,
                            right: Dimension.width20,
                            bottom: Dimension.height10),
                        child: Row(
                          children: [
                            //image section
                            Container(
                              width: Dimension.listViewImgSize,
                              height: Dimension.listViewImgSize,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimension.radious20),
                                color: Colors.white38,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstains.BASE_URL +
                                        AppConstains.UPLOAD_URL +
                                        recommendedProduct
                                            .recommendedProductList[index]
                                            .img!)),
                              ),
                            ),

                            //text container
                            Expanded(
                              child: Container(
                                height: Dimension.listViewTextContSize,
                                // width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimension.radious20),
                                    bottomRight:
                                        Radius.circular(Dimension.radious20),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimension.width10,
                                      right: Dimension.width10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(
                                          text: recommendedProduct
                                              .recommendedProductList[index]
                                              .name!),
                                      SizedBox(
                                        height: Dimension.height10,
                                      ),
                                      SmallText(
                                          text:
                                              "Với pho mat được sản xuất từ Pháp"),
                                      SizedBox(
                                        height: Dimension.height10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconAndTextWidget(
                                              icon: Icons.circle_sharp,
                                              text: "Normal",
                                              iconColor: AppColors.iconColor1),
                                          IconAndTextWidget(
                                              icon: Icons.location_on,
                                              text: "1.7km",
                                              iconColor: AppColors.mainColor),
                                          IconAndTextWidget(
                                              icon: Icons.access_time_rounded,
                                              text: "32min",
                                              iconColor: AppColors.iconColor2)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    //funtion zoom slide
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale =
          1 - (_currPageValue - index) * (1 - _scaleFactor); // ti le hien tai
      var curTrans = _hightSlide * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      //slide sau
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var curTrans = _hightSlide * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      // slide trước
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var curTrans = _hightSlide * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, curTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _hightSlide * (1 - _scaleFactor) / 2, 1);
    }

    //hàm trả về nội dung slider
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouterHelper.getPopularFood(index, "home"));
            },
            child: Container(
              height: Dimension.pageViewContainer, // kích thước slide
              margin: EdgeInsets.only(
                  left: Dimension.width10, right: Dimension.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radious30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstains.BASE_URL +
                      AppConstains.UPLOAD_URL +
                      popularProduct.img!),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimension.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimension.width30,
                  right: Dimension.width30,
                  bottom: Dimension.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.radious20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0, //độ mờ
                      offset: Offset(0, 5), // huong do bong
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0), // huong do bong
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0), // huong do bong
                    )
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimension.height15,
                    left: Dimension.height15,
                    right: Dimension.height15),
                child: AppColumn(
                  text: popularProduct.name!,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
