import 'package:desafio03/desafio03.dart' as desafio03;

void main() {
  final scanner = desafio03.Scanner();
  final dataInicial = scanner.nextLine();
  final dataFinal = scanner.nextLine();

  final sistemaAcionistas = desafio03.SistemaAcionistas();
  final analises =
      sistemaAcionistas.obterAnalisesDesempenho(dataInicial, dataFinal);

  for (final analise in analises) {
    print(analise);
  }
}
