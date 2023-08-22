import 'package:dart_oop/classes/Pessoa.dart';

class PessoaFisica extends Pessoa {
  String _lastname = "";

  PessoaFisica(
      String name, String lastname, String address, String registerNumber)
      : super(name, address, registerNumber) {
    _lastname = lastname;
  }

  @override
  String toString() {
    return {
      "Nome": getName(),
      "Sobrenome": _lastname,
      "Endereço": getAddress(),
      "CPF": getRegisterNumber(),
    }.toString();
  }
}
