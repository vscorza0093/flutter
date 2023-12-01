import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shopping/widgets/product/product.model.dart';

class ProductRepository {
  Future<ProductModel> getProductList() async {
    final response = await getDio().get("/ECommerce_Products");

    return ProductModel.fromJson(response.data);
  }

  Dio getDio() {
    return dioSetUp();
  }

  Dio dioSetUp() {
    final dio = Dio();

    dio.options.baseUrl = dotenv.get('BASE_URL');
    dio.options.headers['X-PARSE-Application-Id'] =
        dotenv.get('APPLICATION_KEY');
    dio.options.headers['X-PARSE-REST-API-Key'] = dotenv.get('API_KEY');
    dio.options.headers['Content-Type'] = dotenv.get('CONTENT_TYPE');

    return dio;
  }
}
