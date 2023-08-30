class Pessoa {
  String _nome = "";
  double _peso = 0;
  double _altura = 0;
  double _imc = 0;

  Pessoa(this._nome, this._peso, this._altura);

  void setPeso(double peso) {
    _peso = peso;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  void setIMC(double imc) {
    _imc = imc;
  }

  double getPeso() => _peso;
  double getAltura() => _altura;
  double getIMC() => _imc;
}
