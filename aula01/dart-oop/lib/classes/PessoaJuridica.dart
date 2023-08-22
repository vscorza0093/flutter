import 'package:dart_oop/classes/Pessoa.dart';

class PessoaJuridica extends Pessoa {
  PessoaJuridica(String name, String address, String registerNumber)
      : super(name, address, registerNumber);

  @override
  String toString() {
    return {
      "Nome": getName(),
      "Endereço": getAddress(),
      "CNPJ": getRegisterNumber(),
    }.toString();
  }
}
