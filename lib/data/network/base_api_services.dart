abstract class BaseApiResponse {
  Future<dynamic> postApi(dynamic data, String url);

  Future<dynamic> getApi(String url);
}
