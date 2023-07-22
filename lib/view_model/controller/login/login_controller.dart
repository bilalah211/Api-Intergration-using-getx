import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_a/models/user_login_model.dart';
import 'package:get_a/resources/routes/route_name/routes_name.dart';
import 'package:get_a/resources/utils/utils.dart';
import 'package:get_a/respository/login/login_repository.dart';
import 'package:get_a/view_model/user_preferences/user_preference.dart';

class LoginController extends GetxController {
  final _myRepo = LoginRepository();
  final emailC = TextEditingController();
  final passC = TextEditingController();

  RxBool loading = false.obs;

  isLogin() {
    loading.value = true;
    Map data = {'email': emailC.value.text, 'password': passC.value.text};
    _myRepo.loginApi(data).then((value) {
      if (value['error'] == 'user not found') {
        loading.value = false;
        Utils.myToast('User Not Found');
      } else {
        UserPreference()
            .saveUserLogin(LoginApiModel.fromJson(value))
            .then((value) {
          Get.toNamed(RouteNames.homeScreen);
        }).onError((error, stackTrace) {
          return;
        });
        loading.value = false;
        Utils.myToast('Login Successfully');
      }
    }).onError((error, stackTrace) {
      Utils.myToast(error.toString());
    });
  }
}
