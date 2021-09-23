import 'package:flutter/material.dart';
extension ScreenSize on BuildContext{
  Size screenSize() {
    return MediaQuery.of(this).size;
  }

  double screenHeight( {double h = 1}) {
    return screenSize().height * h;
  }

  double screenWidth({double w = 1}) {
    return screenSize().width * w;
  }
}