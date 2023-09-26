import 'package:get/get.dart';

class Dimension {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  //dynamic height paddiing and magin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.3;
  static double height45 = screenHeight / 18.76;

  //dynamic width paddiing and magin
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.3;

  static double font20 = screenHeight / 42.2;

  //radious
  static double radious15 = screenHeight / 56.27;
  static double radious20 = screenHeight / 42.2;
  static double radious30 = screenHeight / 28.1;

  // icon size
  static double iconSize24 = screenHeight / 35.17;
}
