import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Utilis/units.dart';

class Constans {
  static Size getAppBarSize(BuildContext context) {
    return Size(.infinity, Units.getHeight(context: context, value: 130));
  }

  static const FirebaseTaskCollection = 'Tasks';
  static const String kUserToken = 'kUserToken';
}
