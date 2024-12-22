import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockWidth;
  static late double blockHeight;

  static late double scaleWidth;
  static late double scaleHeight;

  static void init(BuildContext context, {double designWidth = 390, double designHeight = 844}) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    scaleWidth = screenWidth / designWidth;
    scaleHeight = screenHeight / designHeight;
  }

  static double scaleWidthValue(double value) => value * scaleWidth;
  static double scaleHeightValue(double value) => value * scaleHeight;
  static double fontSize(double designFontSize) => designFontSize * scaleWidth;
}