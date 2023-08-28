import 'dart:io';
import 'package:dart_exceptions/exceptions/invalid_name_exception.dart';
import 'package:dart_exceptions/models/modelo_aluno.dart';
import 'package:dart_exceptions/models/console_utils.dart';

void executar() {
  print("\nSistema de notas");

  String nome = ConsoleUtils.readStringMessage("\nDigite o nome do aluno: ");
  try {
    if (nome.trim() == "") {
      throw InvalidNameException();
    }
  } on InvalidNameException {
    print(InvalidNameException().toString());
    print("Nome padrão adicionado");
    nome = "Aluno";
  } catch (err) {
    exit(0);
  }
  var aluno = Aluno(nome);
  double? nota;

  do {
    nota = ConsoleUtils.readDoubleMessage("\nDigite a nota do aluno: ");
    if (nota != null) {
      aluno.adicionarNota(nota);
    }
  } while (nota != null);
  print(aluno.getNotas());
  print("\nMédia do aluno ${aluno.getNome()}\n${aluno.calcularMedia()}");
  print((aluno.aprovarAluno(6) ? "\nPassou de ano!" : "\nReprovou o ano."));
}
