import 'dart:convert';
import 'dart:io';
import 'package:get_a/data/app_exceptions/app_exceptions.dart';
import 'package:get_a/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiResponse {
  @override
  Future<dynamic> postApi(dynamic data, String url) async {
    dynamic jsonResponse;
    try {
      final response = await http.post(Uri.parse(url), body: data);
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http.get(Uri.parse(url));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    }
    return jsonResponse;
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    case 400:
      dynamic jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    case 404:
      throw InvalidUser('');
    default:
      throw FetchDataException(response.statusCode.toString());
  }
}
