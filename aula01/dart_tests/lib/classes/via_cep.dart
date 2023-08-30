import 'dart:convert';

import 'package:http/http.dart' as http;

class ViaCEP {
  Future<Map<dynamic, dynamic>> retornarCEP(String cep) async {
    Uri url =
        Uri(scheme: 'https', host: 'viacep.com.br', path: '/ws/${cep}/json/');
    // Uri url = Uri.parse('https://viacep.com.br/ws/${cep}/json/');
    var response = await http.get(url);
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    print(decodedResponse);
    return decodedResponse;
  }
}
