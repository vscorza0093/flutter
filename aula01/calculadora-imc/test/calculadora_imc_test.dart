import 'package:calculadora_imc/calculadora_imc.dart';
import 'package:calculadora_imc/pessoa.dart';
import 'package:test/test.dart';

void main() {
  group('Nome inválido', () {
    Pessoa pessoa = Pessoa("", 0, 0);
    var valuesToTest = {
      {'nome': ""}: "InvalidNameException: Nome inválido",
      {'nome': null}: "InvalidNameException: Nome inválido",
      {'nome': 'ar'}: "InvalidNameException: Nome inválido",
    };
    valuesToTest.forEach((key, value) {
      test('Nome inválido', () {
        expect(pessoa.pessoaNomeTeste(key['nome'].toString()),
            equals(value.toString()));
      });
    });
  });

  group('Peso inválido', () {
    Pessoa pessoa = Pessoa("", 0, 0);
    var valuesToTest = {
      {'peso': 0.0}: "InvalidWeightException: Peso inválido",
      {'peso': null}: "InvalidWeightException: Peso inválido",
    };
    valuesToTest.forEach((key, value) {
      test('Peso inválido', () {
        expect(pessoa.pessoaPesoTeste(key['peso']), equals(value.toString()));
      });
    });
  });

  group('Altura inválida', () {
    Pessoa pessoa = Pessoa("", 0, 0);
    var valuesToTest = {
      {'altura': 0.0}: "InvalidHeightException: Altura inválida",
      {'altura': null}: "InvalidHeightException: Altura inválida",
      {'altura': 0.54}: "0.54",
      {'altura': 0.53}: "InvalidHeightException: Altura inválida"
    };
    valuesToTest.forEach((key, value) {
      test('Altura inválida', () {
        expect(
            pessoa.pessoaAlturaTeste(key['altura']), equals(value.toString()));
      });
    });
  });

  group('Teste de calculo IMC', () {
    var valuesToTest = {
      {'peso': 0.0, 'altura': 0.0}:
          "InvalidHeightWeightException: Peso e/ou Altura inválidos",
      {'peso': null, 'altura': 0.0}:
          "InvalidHeightWeightException: Peso e/ou Altura inválidos",
      {'peso': 0.0, 'altura': null}:
          "InvalidHeightWeightException: Peso e/ou Altura inválidos",
      {'peso': 30.0, 'altura': 30.0}: (30.0 / (30.0 * 30.0)).toString()
    };
    valuesToTest.forEach((key, value) {
      test('Teste de calculo IMC', () {
        expect(CalculadoraIMC.getIMCTeste(key['peso'], key['altura']),
            equals(value));
      });
    });
  });

  group('Teste de resultado IMC', () {
    var valuesToTest = {
      {'nome': 'vinicius', 'peso': 50, 'altura': 1.68}: "Magreza leve",
      {'nome': 'vinicius', 'peso': 70, 'altura': 1.68}: "Saudável",
    };
    valuesToTest.forEach((key, value) {
      test('Teste de resultado Saudavel', () {
        expect(
            CalculadoraIMC.checkIMC(CalculadoraIMC.getIMC(
                double.parse(key['peso'].toString()),
                double.parse(key['altura'].toString()))),
            equals(value));
      });
    });
  });
}
