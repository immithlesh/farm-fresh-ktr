import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    blockSizeHorizontal = screenWidth / 200;
    blockSizeVertical = screenHeight / 200;

    textMultiplier = blockSizeVertical;
    imageSizeMultiplier = blockSizeHorizontal;
    heightMultiplier = blockSizeVertical;

    print("Screen Width: $screenWidth");
    print("Screen Height: $screenHeight");
  }
}

class ResponsiveText {
  static double size(double percentage) {
    return SizeConfig.textMultiplier * percentage;
  }
}

class ResponsiveImage {
  static double size(double percentage) {
    return SizeConfig.imageSizeMultiplier * percentage;
  }
}

class ResponsiveHeight {
  static double size(double percentage) {
    return SizeConfig.heightMultiplier * percentage;
  }
}
