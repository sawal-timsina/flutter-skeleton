import 'package:dio/dio.dart';

import '../../../config.dart';
import '../api/interceptors.dart';
import 'logger_interceptor.dart';

late final Dio dio;

class InitDio {
  void call() {
    dio = Dio(
      BaseOptions(
        baseUrl: Config.apiUrl,
        receiveTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
      ),
    )..interceptors.addAll([DioAuthInterceptors(), LoggerInterceptor()]);
  }
}
