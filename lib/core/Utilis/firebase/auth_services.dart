import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/core/Utilis/firebase/cahce_helper.dart';


class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  CacheHelper cacheHelper = CacheHelper();

  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    var credintial = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    var token = await credintial.user?.getIdToken(false);
    cacheHelper.setUserToken(userToken: credintial.user?.uid ?? '');
    print(credintial.user?.uid ?? '');
  }

  Future<void> login({required String email, required String password}) async {
    var credintial = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    cacheHelper.setUserToken(userToken: credintial.user?.uid ?? '');
  }

}