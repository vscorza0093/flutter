import 'package:dio/dio.dart';

class JsonPlaceholderCustomDio {
  final _dio = Dio();

  JsonPlaceholderCustomDio() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
  }

  Dio get baseUrl => _dio;
}


