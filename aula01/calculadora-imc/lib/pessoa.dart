import 'package:calculadora_imc/exceptions/invalid_height_exception.dart';
import 'package:calculadora_imc/exceptions/invalid_name_exception.dart';
import 'package:calculadora_imc/exceptions/invalid_weight_exception.dart';

class Pessoa {
  String _nome = "";
  double _peso = 0;
  double _altura = 0;
  double _imc = 0;

  Pessoa(this._nome, this._peso, this._altura);

  String pessoaNomeTeste(String nome) {
    if (nome == "" || nome == "null" || nome.length < 3) {
      return InvalidNameException().toString();
    } else {
      setNome(nome);
      return getNome();
    }
  }

  String pessoaPesoTeste(double? peso) {
    if (peso == 0 || peso == null) {
      return InvalidWeightException().toString();
    } else {
      setPeso(peso);
      return peso.toString();
    }
  }

  String pessoaAlturaTeste(double? altura) {
    if (altura == 0 || altura == null || altura < 0.54) {
      return InvalidHeightException().toString();
    } else {
      setPeso(altura);
      return altura.toString();
    }
  }

  void setNome(String nome) {
    _nome = nome;
  }

  void setPeso(double peso) {
    if (peso == 0) {
      throw InvalidWeightException();
    }
    _peso = peso;
  }

  void setAltura(double altura) {
    if (altura == 0) {
      throw InvalidHeightException();
    }
    _altura = altura;
  }

  void setIMC(double imc) {
    _imc = imc;
  }

  String getNome() {
    return _nome;
  }

  double getPeso() => _peso;
  double getAltura() => _altura;
  double getIMC() => _imc;
}
