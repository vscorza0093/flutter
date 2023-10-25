import 'package:apiviacep/register_cep_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RegisterCEPRepository {
  Future<int> postCEP(String cepNumber) async {
    var dioViacep = Dio();
    var response;
    response = await dioViacep.get("https://viacep.com.br/ws/$cepNumber/json");
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
      await dioBack4App.post("${dotenv.get("BACK_4_APP_BASE_URL")}/$urlPath",
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
    return RegisterCEPModel.fromJson(response.data);
  }

  Future<void> deleteCEP(String objectId) async {
    var dio = Dio();
    var baseURL = dotenv.get("BACK_4_APP_BASE_URL");
    var urlPath = '/cep';
    dio.options.headers["X-Parse-Application-Id"] =
        dotenv.get("APPLICATION_KEY");
    dio.options.headers["X-Parse-REST-API-Key"] = dotenv.get('API_KEY');
    dio.options.headers["Content-Type"] = "application/json";
    await dio.delete("$baseURL$urlPath/$objectId");
  }

  Future<void> putCEP() async {}

  Future<int> checkCEP(String cep) async {
    var response = await getCEP();
    for (var element in response.ceps) {
      if (cep == element.cep) {
        return 1;
      }
    }
    return 0;
  }
}
