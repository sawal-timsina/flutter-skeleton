import 'dart:io';

import 'package:dio/dio.dart';

import '../../../config.dart';

class DioAuthInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      options.headers.addAll(
        {HttpHeaders.authorizationHeader: "Bearer ${Config.authToken}"},
      );
      handler.next(options);
    } catch (_) {}
  }
}
