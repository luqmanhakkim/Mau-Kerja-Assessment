import 'package:dio/dio.dart';

final dio = Dio();

class BaseNetwork {
  Future<Response> callNetwork({
    required String method,
    required String url,
    Map<String, dynamic>? header,
    dynamic data,
    String? contentType = Headers.jsonContentType,
  }) async {
    final option = dioOption(
      method: method,
      contentType: contentType,
      header: header,
    );

    final response = await dio.request<dynamic>(
      url,
      data: data,
      options: option,
    );
    return response;
  }

  Options? dioOption({
    String? method,
    Map<String, dynamic>? header,
    String? contentType,
  }) =>
      Options(
        method: method,
        headers: header,
        contentType: contentType,
      );
}
