class ContaBancaria {
  int numeroConta;
  String nomeTitular;
  double saldo;

  ContaBancaria(this.numeroConta, this.nomeTitular, this.saldo);

  void printInfos() {
    print("Conta: $numeroConta");
    print("Titular: $nomeTitular");
    print("Saldo: $saldo");
  }
}

class ContaSalario extends ContaBancaria {
  int digito;

  ContaSalario(int numeroConta, String nomeTitular, double saldo, this.digito)
      : super(numeroConta, nomeTitular, saldo);

  @override
  void printInfos() {
    super.printInfos();
    print("Digito: $digito");
  }
}

class ContaSalarioPlus extends ContaSalario {
  bool plus = false;

  ContaSalarioPlus(
      int numeroConta, String nomeTitular, double saldo, int digito, this.plus)
      : super(numeroConta, nomeTitular, saldo, digito);

  @override
  void printInfos() {
    super.printInfos();
    print("Plus: $plus");
  }
}
