import 'dart:convert';
import 'dart:io';

import 'package:dart_exceptions/models/Aluno.dart';
import 'package:dart_exceptions/models/console_utils.dart';

void executar() {
  print("Sistema de notas\n\n");

  String nome = ConsoleUtils.readAndPrintString("Digite o nome do aluno:");

  var aluno = Aluno(nome);
}
