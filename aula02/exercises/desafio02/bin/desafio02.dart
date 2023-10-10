import 'package:desafio02/desafio02.dart' as desafio02;

void main(List<String> arguments) {
  desafio02.ContaSalario contaSalario =
      desafio02.ContaSalario(10, 'vinic', 100, 10);

  desafio02.ContaSalarioPlus contaSalarioPlus =
      desafio02.ContaSalarioPlus(420, 'Vinic', 300, 420, true);

  print("Salario plus:\n");
  contaSalarioPlus.printInfos();
  print("\n");
  print("Salario normal:\n");
  contaSalario.printInfos();
}
