import 'package:dart_tests/classes/via_cep.dart';
import 'package:dart_tests/dart_tests.dart' as app;
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'dart_tests_test.mocks.dart';

@GenerateMocks([MockViaCEP])
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
    MockMockViaCEP mockViaCEP = MockMockViaCEP();
    when(mockViaCEP.retornarCEP('01001000'))
        .thenAnswer((realInvocation) => Future.value({
              "cep": "01001-000",
              "logradouro": "Praça da Sé",
              "complemento": "lado ímpar",
              "bairro": "Sé",
              "localidade": "São Paulo",
              "uf": "SP",
              "ibge": "3550308",
              "gia": "1004",
              "ddd": "11",
              "siafi": "7107",
            }));

    var body = await mockViaCEP.retornarCEP('01001000');
    expect(body["cep"], equals("01001-000"));
    expect(body["logradouro"], equals("Praça da Sé"));
  });
}

class MockViaCEP extends Mock implements ViaCEP {}
