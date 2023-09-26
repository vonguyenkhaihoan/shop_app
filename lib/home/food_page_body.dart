import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:shopping_app/utils/dimensions.dart';
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
        Container(
          // color: Colors.redAccent,
          height: Dimension.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue.floor(),
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
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
          Container(
            height: Dimension.pageViewContainer, // kích thước slide
            margin: EdgeInsets.only(
                left: Dimension.width10, right: Dimension.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radious30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/food0.jpg"))),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimension.pageViewTextContainer,
                margin: EdgeInsets.only(left: Dimension.width30, right: Dimension.width30, bottom: Dimension.height30),
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: "Pizza Hurt"),
                        SizedBox(
                          height: Dimension.height10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Icon(
                                        Icons.star,
                                        color: AppColors.mainColor,
                                        size: 15,
                                      )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(text: "4.5"),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(text: "15"),
                            SizedBox(
                              width: 10,
                            ),
                            SmallText(text: "Binh luan"),
                          ],
                        ),
                        SizedBox(
                          height: Dimension.height20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        )
                      ]),
                ),
              ))
        ],
      ),
    );
  }
}
