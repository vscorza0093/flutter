class Aluno {
  String _nome = "";
  final List<double> _notas = [];

  Aluno(this._nome);

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  List<double> getNotas() {
    print("Notas do aluno ${getNome()}");
    return _notas;
  }

  void adicionarNota(double nota) {
    _notas.add(nota);
  }

  double calcularMedia() {
    double total = _notas.reduce((value, element) => value + element);

    var media = total / _notas.length;
    return media.isNaN ? 0 : media;
  }

  bool aprovarAluno(double notaCorte) {
    var media = calcularMedia();

    return media >= notaCorte ? true : false;
  }
}
