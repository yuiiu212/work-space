import 'package:flutter_application_1/core/Utilis/Constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPre;

  static Future<void> init() async {
    sharedPre = await SharedPreferences.getInstance();
  }

 Future<void> setUserToken({required String userToken}) async {
  await sharedPre.setString(Constans.kUserToken, userToken);
}

  String getuserToken() {
    return sharedPre.getString(Constans.kUserToken) ?? '';
  }
}
