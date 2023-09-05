import 'dart:convert';

import 'package:desafio00/desafio00.dart' as desafio00;
import 'dart:io';

import 'package:test/expect.dart';

void main(List<String> arguments) {
  print("Saldo Atual: ");
  String? saldoInput = stdin.readLineSync(encoding: utf8);
  print("\nValor do Deposito");
  String? depositoInput = stdin.readLineSync(encoding: utf8);
  print("\nValor do Saque");
  String? saqueInput = stdin.readLineSync(encoding: utf8);

  double saldoAtual = 0;
  double valorDeposito = 0;
  double valorRetirada = 0;

  try {
    (saldoInput == null)
        ? throwsA(TypeMatcher<ArgumentError>())
        : saldoAtual = (double.parse(saldoInput));
  } catch (e) {
    print(e);
    exit(1);
  }

  try {
    (depositoInput == null)
        ? throwsA(TypeMatcher<ArgumentError>())
        : valorDeposito = (double.parse(depositoInput));
  } catch (e) {
    print(e);
    exit(1);
  }

  try {
    (saqueInput == null)
        ? throwsA(TypeMatcher<ArgumentError>())
        : valorRetirada = (double.parse(saqueInput));
  } catch (e) {
    print(e);
    exit(1);
  }

  print(atualizarSaldo(saldoAtual, valorDeposito, valorRetirada));
}

String atualizarSaldo(
    double saldoAtual, double valorDeposito, double valorRetirada) {
  saldoAtual = saldoAtual + valorDeposito - valorRetirada;
  String log = "Saldo atualizado na conta: ${saldoAtual.toStringAsFixed(1)}";
  return log;
}
