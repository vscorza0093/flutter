import 'dart:io';

void main(List<String> arguments) {
  double valor = double.parse(stdin.readLineSync()!);

  if (valor > 0) {
    print(successMessage(valor));
  } else if (valor == 0) {
    print(exitApplicationMessage());
  } else {
    print(invalidValueMessage());
  }
}

String successMessage(double valor) {
  String message =
      "Deposito realizado com sucesso!\nSaldo atual: R\$ ${valor.toStringAsFixed(2)}";
  return message;
}

String invalidValueMessage() {
  String message = "Valor invalido! Digite um valor maior que zero.";
  return message;
}

String exitApplicationMessage() {
  String message = "Encerrando o programa...";
  return message;
}
