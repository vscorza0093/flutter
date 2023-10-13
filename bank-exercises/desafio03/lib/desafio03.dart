import 'dart:io';

class Scanner {
  final _input = stdin;

  String nextLine() {
    return _input.readLineSync()!;
  }
}

class SistemaAcionistas {
  List<String> obterAnalisesDesempenho(
      String dataInicialStr, String dataFinalStr) {
    final dataInicial = _parseDate(dataInicialStr);
    final dataFinal = _parseDate(dataFinalStr);

    final analises = <Analise>[
      Analise(_parseDate('01/01/2023'), 'Analise de Desempenho Financeiro'),
      Analise(_parseDate('15/02/2023'), 'Analise de Riscos e Exposicoes'),
      Analise(_parseDate('31/03/2023'), 'Analises Corporativas'),
      Analise(
          _parseDate('01/04/2023'), 'Analise de Politicas e Regulamentacoes'),
      Analise(_parseDate('15/05/2023'), 'Analise de Ativos'),
      Analise(_parseDate('30/06/2023'), 'Analise de Inovacao e Tecnologia'),
    ];
    int zero = 0;
    List<String> filtered = <String>[];
    final dates = <DateTime>[];
    DateTime date = DateTime.now();

    for (int i = 0; i < analises.length; i++) {
      date = DateTime.now();
      for (int j = 0; j <= 9; j++) {
        date = analises[i].data;
      }
      dates.add(date);
    }

    for (int i = 0; i < analises.length; i++) {
      if (dates[i].isAtSameMomentAs(dataInicial) ||
          dates[i].isAtSameMomentAs(dataFinal) ||
          (dates[i].isAfter(dataInicial) && dates[i].isBefore(dataFinal))) {
        filtered.add(analises[i].descricao);
      }
    }

    for (var e in filtered) {
      print(e);
    }

    return <String>[];
    //TODO: Implemente o filtro das análises dentro do período especificado. Dica: Crie uma lista para armazenar as análises filtradas e use um loop for para filtrar as análises.

    // TODO: Retorne a lista de análises filtradas.
  }

  DateTime _parseDate(String dateStr) {
    final parts = dateStr.split('/');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);
    return DateTime(year, month, day);
  }
}

class Analise {
  final DateTime data;
  final String descricao;

  Analise(this.data, this.descricao);
}
