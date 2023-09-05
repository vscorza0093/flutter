import 'package:desafio02/desafio02.dart' as desafio02;
import 'dart:io';

void main(List<String> arguments) {
  List<String> l = <String>['ab', 'za', 'dda', 'ce', 'ef', 'ad', 'ac'];
  l.sort();
  print(l);
  // Entrada de dados
  int saldoTotal = int.parse(stdin.readLineSync()!);
  int valorSaque = int.parse(stdin.readLineSync()!);

  ClienteBanco cliente = ClienteBanco();
  cliente.setSaldo(saldoTotal);

  print(sacarDinheiro(cliente.getSaldo(), valorSaque));
}

String sacarDinheiro(int saldo, int valorSaque) {
  int saldoVerificado = saldo - valorSaque;
  List<String> log = <String>[
    'Saque realizado com sucesso! Novo saldo: ${saldoVerificado}',
    'Saldo insuficiente. Saque nao realizado!'
  ];
  if (saldoVerificado >= 0) {
    return log[0];
  } else {
    return log[1];
  }
}

class ClienteBanco {
  int _saldo = 0;

  void setSaldo(int saldo) {
    _saldo = saldo;
  }

  int getSaldo() => _saldo;
}
