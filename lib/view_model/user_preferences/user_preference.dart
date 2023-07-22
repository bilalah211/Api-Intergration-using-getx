import 'package:get_a/models/user_login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUserLogin(LoginApiModel loginModel) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString('token', loginModel.token.toString());
    return true;
  }

  Future<LoginApiModel> getUserLogin() async {
    final sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    return LoginApiModel(token: token.toString());
  }

  Future<bool> removeUser() async {
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
