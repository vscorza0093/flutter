import 'package:calculadora_imc/exceptions/invalid_height_weight_exception.dart';

class CalculadoraIMC {
  static double getIMC(double? peso, double? altura) {
    if (peso == 0 || altura == 0 || peso == null || altura == null) {}
    return peso! / (altura! * altura);
  }

  static String getIMCTeste(double? peso, double? altura) {
    if (peso == 0 || altura == 0 || peso == null || altura == null) {
      return InvalidHeightWeightException().toString();
    }
    return (peso / (altura * altura)).toString();
  }

  static String checkIMC(double imc) {
    switch (imc) {
      case >= 5 && < 16:
        return "Magreza grave";
      case >= 16 && < 17:
        return ("Magreza moderada");
      case >= 17 && < 18.5:
        return ("Magreza leve");
      case >= 18.5 && < 25:
        return ("Saudável");
      case >= 25 && < 30:
        return ("Sobrepeso");
      case >= 30 && < 35:
        return ("Obesidade I");
      case >= 35 && < 40:
        return ("Obesidade II");
      case >= 40:
        return ("Obesidade III");
    }
    return "ERRO";
  }
}
