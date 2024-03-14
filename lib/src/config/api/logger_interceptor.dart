import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class LoggerInterceptor extends PrettyDioLogger {
  LoggerInterceptor({
    super.requestBody = true,
    super.requestHeader = true,
    super.responseBody = true,
  });
}
