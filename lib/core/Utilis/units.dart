import 'package:flutter/material.dart';

class Units {
  static const double designWidth = 375;
  static const double designHeight = 812;

  static double getWidth({
    required BuildContext context,
    required double value,
  }) {
    return value * MediaQuery.of(context).size.width / designWidth;
  }

  static double getHeight({
    required BuildContext context,
    required double value,
  }) {
    return value * MediaQuery.of(context).size.height / designHeight;
  }

  static double fontSize({
    required BuildContext context,
    required double value,
  }) {
    return value * MediaQuery.of(context).size.width / designWidth;
  }

  static double radius({
    required BuildContext context,
    required double value,
  }) {
    return value * MediaQuery.of(context).size.width / designWidth;
  }
}