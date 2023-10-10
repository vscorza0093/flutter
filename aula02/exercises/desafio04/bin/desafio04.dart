import 'dart:io';

import 'package:desafio04/desafio04.dart' as desafio04;

void main() {
  final scanner = stdin;

  final entrada = scanner.readLineSync()!;
  final partes = entrada.split('\n');

  String data = '';
  String hora = '';
  String descricao = '';
  double valor = 0;

  for (var e in partes) {
    if (e.contains(':')) {
      hora = e;
    } else if (e.contains('/')) {
      data = e;
    } else if (e.contains('.')) {
      valor = double.parse(e);
    } else {
      descricao = e;
    }
  }

  desafio04.Transacao transacao = desafio04.Transacao(data, hora, descricao, valor)
}
