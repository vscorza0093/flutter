import 'package:desafio01/desafio01.dart' as desafio01;
import 'dart:io';

void main(List<String> arguments) {
  //Entrada dos tipos de ativos
  var quantidadeAtivos = int.parse(stdin.readLineSync()!);

  List<String> ativos = [];

  // Entrada dos códigos dos ativos
  for (var i = 0; i < quantidadeAtivos; i++) {
    var codigoAtivo = stdin.readLineSync()!;
    ativos.add(codigoAtivo);
  }

  for (var i = 0; i < quantidadeAtivos; i++) {
    for (var j = 0; j < quantidadeAtivos; j++) {
      if (ativos[i].codeUnitAt(0) < ativos[j].codeUnitAt(0)) {
        String temp = ativos[i];
        ativos[i] = ativos[j];
        ativos[j] = temp;
      }
    }
  }

  for (var i = 0; i < quantidadeAtivos; i++) {
    print(ativos[i]);
  }
}
