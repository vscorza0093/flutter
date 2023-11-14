import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shopping/widgets/product/product.model.dart';

class ProductRepository {
  Future<ProductModel> getProductList() async {
    final dio = Dio();

    String baseUrl = "https://parseapi.back4app.com/classes";
    dio.options.headers['X-PARSE-Application-Id'] =
        dotenv.get('APPLICATION_KEY');
    dio.options.headers['X-PARSE-REST-API-Key'] = dotenv.get('API_KEY');
    dio.options.headers['Content-Type'] = dotenv.get('CONTENT_TYPE');

    final response = await dio.get("$baseUrl/ECommerce_Products");

    debugPrint(response.statusCode.toString());

    return ProductModel.fromJson(response.data);
  }
}
