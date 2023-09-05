import 'package:desafio03/desafio03.dart' as desafio03;
import 'dart:io';

void main(List<String> arguments) {
  var valorInicial = double.parse(stdin.readLineSync()!);
  var taxaJuros = double.parse(stdin.readLineSync()!);
  var periodo = int.parse(stdin.readLineSync()!);

  //TODO: Iterar, baseado no período em anos, para calculo do valorFinal com os juros.

  for (int i = 0; i < periodo; i++) {
    valorInicial = (valorInicial * taxaJuros) + valorInicial;
  }
  print("Valor final do investimento: R\$ ${valorInicial.toStringAsFixed(2)}");
}
