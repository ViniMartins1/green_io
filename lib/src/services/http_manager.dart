import 'package:dio/dio.dart';

abstract class HttpMethod {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

class HttpManager {
  Future<Map<String, dynamic>> restRequest({
    required String url,
    required String method,
    Map? body,
    Map? headers,
  }) async {
    final defaultHeader = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'g1Oui3JqxnY4S1ykpQWHwEKGOe0dRYCPvPF4iykc',
        'X-Parse-REST-API-Key': 'rFBKU8tk0m5ZlKES2CGieOaoYz6TgKxVMv8jRIsN',
      });
    Dio dio = Dio();

    try {
      Response response = await dio.request(
        'endpoint',
        options: Options(
          method: method,
          headers: defaultHeader,
        ),
        data: body,
      );

      return response.data;
    } on DioException catch (e) {
      return e.response?.data ?? {};
    } catch (e) {
      return {};
    }
  }
}
