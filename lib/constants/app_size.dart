import 'package:flutter/material.dart';

class AppSize {
  AppSize._();
  static final AppSize instance = AppSize._();

  final double defaultPadding = 16.0;

  final double groceryHeaderHeight = 85.0;
  final double groceryCartBarHeight = 100.0;

  MediaQueryData? _mediaQueryData;
  double screenWidth = 0;
  double screenHeight = 0;
  double defaultSize = 0;
  Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width ?? 0;
    screenHeight = _mediaQueryData?.size.height ?? 0;
    orientation = _mediaQueryData?.orientation;
  }

  // Get the proportionate height as per screen size
  double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = AppSize.instance.screenHeight;
    // 896 is the layout height that designer use
    // or you can say iPhone 11
    return (inputHeight / 896.0) * screenHeight;
  }

  // Get the proportionate height as per screen size
  double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = AppSize.instance.screenWidth;
    // 414 is the layout width that designer use
    return (inputWidth / 414.0) * screenWidth;
  }

  bool isMobile() => screenWidth < 650;

  bool isTablet() => screenWidth < 1100 && screenWidth >= 650;

  bool isDesktop() => screenWidth >= 1100;
}
