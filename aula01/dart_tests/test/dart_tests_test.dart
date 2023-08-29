import 'dart:convert';

import 'package:dart_tests/dart_tests.dart' as app;
import 'package:test/test.dart';

void main() {
  group('Calcula o valor do produto com desconto', () {
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 850,
      {'valor': 300, 'desconto': 80, 'percentual': false}: 220,
      {'valor': 1000, 'desconto': 15, 'percentual': true}: 850,
      {'valor': 300, 'desconto': 80, 'percentual': true}: 60
    };
    valuesToTest.forEach((key, value) {
      test('Calcula o valor do produto com desconto', () {
        expect(
            app.calcularDesconto(
                double.parse(key['valor'].toString()),
                double.parse(key['desconto'].toString()),
                key['percentual'].toString() == 'true'),
            anything);
      });
    });
  });

  group('Produto com valor igual a zero', () {
    var valuesToTest = {
      {'valor': 0, 'desconto': 150, 'percentual': false},
    };
    valuesToTest.forEach((key) {
      test('Produto com valor igual a zero', () {
        expect(
            () => app.calcularDesconto(
                double.parse(key['valor'].toString()),
                double.parse(key['desconto'].toString()),
                key['percentual'].toString() == 'false'),
            throwsA(isArgumentError));
      });
    });
  });

  test('Retornar CEP', () async {
    var body = await app.retornarCEP('01001000');
    print(body);
    expect(body["bairro"], equals("Sé"));
    expect(body["complemento"], equals("lado ímpar"));
  });
}
