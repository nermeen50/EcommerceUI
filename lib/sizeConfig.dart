import 'package:flutter/cupertino.dart';

class SizeConfig {
  static MediaQueryData _mediaQuery;
  static double _sizeWidth;
  static double _sizeHeight;
  static double _defaultScreenSize;
  static Orientation _oriantation;
  void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    _sizeWidth = _mediaQuery.size.width;
    _sizeHeight = _mediaQuery.size.height;
    _oriantation = _mediaQuery.orientation;
  }
}

double getPropertScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig._sizeHeight;
  return (inputHeight / 812.0) * screenHeight;
}

double getPropertScreenWidth(double inputWidth) {
  double screenwidth = SizeConfig._sizeWidth;
  return (inputWidth / 375.0) * screenwidth;
}
