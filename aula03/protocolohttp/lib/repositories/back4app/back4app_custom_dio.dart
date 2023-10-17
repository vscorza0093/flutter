import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:protocolohttp/repositories/back4app/back4app_dio.interceptor.dart';

class Back4AppCustomDio {
  final _dio = Dio();

  Dio get getDio => _dio;

  Back4AppCustomDio() {
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = dotenv.get("TASK_BASE_URL");
    _dio.interceptors.add(Back4AppDioInterceptor());
  }
}
