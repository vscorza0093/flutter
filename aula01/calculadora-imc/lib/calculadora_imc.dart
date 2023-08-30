class CalculadoraIMC {
  static double getIMC(double peso, double altura) {
    return peso / (altura * altura);
  }

  static void checkIMC(double imc) {
    switch (imc) {
      case < 16:
        print("Magreza grave");
        break;
      case >= 16 && < 17:
        print("Magreza moderada");
        break;
      case >= 17 && < 18.5:
        print("Magreza leve");
        break;
      case >= 18.5 && < 25:
        print("Saudável");
        break;
      case >= 25 && < 30:
        print("Sobrepeso");
        break;
      case >= 30 && < 35:
        print("Obesidade I");
        break;
      case >= 35 && < 40:
        print("Obesidade II");
        break;
      case >= 40:
        print("Obesidade III");
        break;
    }
  }
}
