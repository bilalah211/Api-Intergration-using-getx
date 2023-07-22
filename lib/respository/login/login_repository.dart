import 'package:get_a/data/network/network_api_services.dart';
import 'package:get_a/resources/app_urls/app_urls.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) {
    final response = _apiServices.postApi(data, AppUrls.loginUrl);
    return response;
  }
}
