import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'base_network.dart';

final baseNetwork = BaseNetwork();

final environment = dotenv.env['environment'];

final appUrl = dotenv.env['baseUrl'];

/// Main api class for networking.
class ApiUtil {
  factory ApiUtil() => instance;

  ApiUtil.internal();

  // Singleton usage.
  static final ApiUtil instance = ApiUtil.internal();

  Future<dynamic> baseCall({
    String? method,
    String url = '',
    String? baseUrl,
    String? domain,
    Map<String, dynamic>? header,
    dynamic data,
    String? contentType,
    // CancelToken? cancelToken,
  }) async {
    final _basedUrl = baseUrl ?? appUrl;

    final finalUrl = '$_basedUrl$url';

    try {
      final response = await baseNetwork.callNetwork(
        method: method.toString().toUpperCase(),
        header: header,
        data: data,
        url: finalUrl,
        contentType: contentType,
      );

      final statusCode = response.statusCode;

      if (response.data is String) {
        return response.data;
      }

      if (response.data.toString().isEmpty) {
        throw Exception('$statusCode/Empty data');
      }

      return response.data;
    } on DioError {
      rethrow;
    }
  }
}
