import 'dart:math';

import 'package:flutter/material.dart';

/// all the app sizes needed to the widgets
class Sizes {
  static double screenHeigth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenDiagnol(BuildContext context) {
    double width = screenWidth(context);
    double height = screenHeigth(context);
    return pow((pow(height, 2) + pow(width, 2)), 0.5).toDouble();
  }

  static double normalizeSize(int size, BuildContext context) {
    double aPower = pow(screenHeigth(context), 2).toDouble();
    double bPower = pow(screenWidth(context), 2).toDouble();
    double diagnol = sqrt(aPower + bPower);
    return (1 + (diagnol / 15000)) * size;
  }
}
