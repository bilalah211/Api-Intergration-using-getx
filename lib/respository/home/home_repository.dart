import 'package:get_a/data/network/network_api_services.dart';
import 'package:get_a/resources/app_urls/app_urls.dart';

import '../../models/user_model.dart';

class HomeRepository {
  final _apiServices = NetworkApiServices();

  Future<UserModel> getUserList() async {
    final response = await _apiServices.getApi(AppUrls.userListUrl);
    return UserModel.fromJson(response);
  }
}
