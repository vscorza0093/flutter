import 'dart:convert';

import 'package:http/http.dart' as http;

double calcularDesconto(double valor, double desconto, bool percentual) {
  if (valor <= 0) {
    throw ArgumentError(
        "O valor do produto não pode ser menor ou igual a zero");
  }
  if (desconto <= 0) {
    throw ArgumentError(
        "O valor do desconto não pode ser menor ou igual a zero");
  }
  if (percentual) {
    return valor - (valor * desconto / 100);
  }
  return valor - desconto;
}

Future<Map<dynamic, dynamic>> retornarCEP(String cep) async {
  Uri url =
      Uri(scheme: 'https', host: 'viacep.com.br', path: '/ws/${cep}/json/');
  // Uri url = Uri.parse('https://viacep.com.br/ws/${cep}/json/');
  var response = await http.get(url);
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  return decodedResponse;
}

int retornaValor(int num) {
  return num;
}
