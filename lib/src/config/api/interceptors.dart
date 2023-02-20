import 'dart:io';

import 'package:dio/dio.dart';

import '../firebase/auth.dart';

class DioAuthInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await firebaseAuth.currentUser?.getIdToken();
    if (token != null) {
      options.headers
          .addAll({HttpHeaders.authorizationHeader: "Bearer $token"});
    }
    handler.next(options);
  }
}
