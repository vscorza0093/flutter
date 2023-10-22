import 'package:apiviacep/register_cep_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RegisterCEPRepository {
  Future<int> postCEP(String cepNumber) async {
    var dioViacep = Dio();
    var response;

    try {
      response =
          await dioViacep.get("https://viacep.com.br/ws/$cepNumber/json");
    } catch (e) {
      print(e);
    }
    if (response.data.toString() == "{erro: true}") {
      return 1;
    } else {
      CEP gj = CEP.fromJson(response.data);
      var urlPath = '/cep';
      var dioBack4App = Dio();
      dioBack4App.options.headers["X-Parse-Application-Id"] =
          dotenv.get("APPLICATION_KEY");
      dioBack4App.options.headers["X-Parse-REST-API-Key"] =
          dotenv.get('API_KEY');
      dioBack4App.options.headers["Content-Type"] = "application/json";
      var resp = await dioBack4App.post(
          "${dotenv.get("BACK_4_APP_BASE_URL")}/$urlPath",
          data: gj.toJson());
      return 0;
    }
  }

  Future<RegisterCEPModel> getCEP() async {
    var dio = Dio();
    var url = "${dotenv.get("BACK_4_APP_BASE_URL")}/cep";
    dio.options.headers["X-Parse-Application-Id"] =
        dotenv.get("APPLICATION_KEY");
    dio.options.headers["X-Parse-REST-API-Key"] = dotenv.get('API_KEY');
    dio.options.headers["Content-Type"] = "application/json";
    var response = await dio.get(url);
    debugPrint(response.data.toString());
    return RegisterCEPModel.fromJson(response.data);
  }

  Future<void> deleteCEP() async {}

  Future<void> putCEP() async {}
}
