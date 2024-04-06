import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenH;
  static double? screenW;
  static double? defaultS;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenH = _mediaQueryData!.size.height;
    screenW = _mediaQueryData!.size.width;
    orientation = _mediaQueryData!.orientation;
  }
}

double getScreenH(double inputH) {
  double screenH = SizeConfig.screenH!;
  return (inputH / 812.0) * screenH;
}

double getScreenW(double inputW) {
  double screenW = SizeConfig.screenW!;
  return (inputW / 375.0) * screenW;
}
