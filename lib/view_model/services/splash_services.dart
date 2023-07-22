import 'dart:async';

import 'package:get/get.dart';
import 'package:get_a/resources/routes/route_name/routes_name.dart';
import 'package:get_a/view_model/user_preferences/user_preference.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUserLogin().then((value) {
      print(value.token);
      if (value.token!.isEmpty || value.token.toString() == 'null') {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteNames.loginScreen));
      } else {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteNames.homeScreen));
      }
    });
  }
}
