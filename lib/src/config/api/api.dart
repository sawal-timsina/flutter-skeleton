import 'package:dio/dio.dart';

import '../api/interceptors.dart';
import '../../../config.dart';

late final Dio dio;

class InitDio {
  call() {
    dio = Dio(
      BaseOptions(
        baseUrl: Config.apiUrl,
      ),
    )..interceptors.add(DioAuthInterceptors());
  }
}
