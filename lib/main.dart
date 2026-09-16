import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/Utilis/firebase/cahce_helper.dart' show CacheHelper;
import 'package:flutter_application_1/core/style/colormanagement.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/workspace.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorManager.NeutralWhite,
      statusBarIconBrightness: .dark,
    ),
  );
  runApp(workspace());
}