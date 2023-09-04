import 'dart:io';

import 'package:calculadora_imc/calculadora_imc.dart';
import 'package:calculadora_imc/exceptions/invalid_height_exception.dart';
import 'package:calculadora_imc/exceptions/invalid_name_exception.dart';
import 'package:calculadora_imc/exceptions/invalid_weight_exception.dart';
import 'package:calculadora_imc/pessoa.dart';
import 'package:test/test.dart';

void main(List<String> arguments) {
  // Pessoa pessoa = Pessoa('Vinicius', 52, 1.65);

  print("Insira seu nome");
  String? nome = stdin.readLineSync();
  print("Insira sua altura em metros");
  String? altura = stdin.readLineSync();
  print("Insira seu peso em quilos");
  String? peso = stdin.readLineSync();

  double? alturaParse;
  double? pesoParse;

  try {
    if (nome == null || nome.trim() == "") {
      throw InvalidNameException();
    }
  } catch (invalidNameException) {
    print(InvalidNameException().toString());
    nome = "Cliente";
  }

  try {
    if (altura == "" || altura == "0") {
      throw InvalidHeightException();
    }
  } catch (invalidHeightException) {
    print(InvalidHeightException().toString());
    altura = "1.68";
  }

  try {
    if (peso == "" || peso == "0") {
      throw InvalidWeightException();
    }
  } catch (invalidWeightException) {
    print(InvalidWeightException().toString());
    peso = "70";
  }

  try {
    alturaParse = double.tryParse(altura!);
    if (alturaParse.runtimeType != double) {
      throw InvalidHeightException();
    }
  } catch (e) {
    print(InvalidHeightException().toString());
    alturaParse = 1.68;
  }

  try {
    pesoParse = double.tryParse(peso!);
    if (pesoParse.runtimeType != double) {
      throw InvalidWeightException();
    }
  } catch (e) {
    print(InvalidWeightException().toString());
    pesoParse = 70;
  }
  print("\nNome: $nome\nAltura: $altura\nPeso:$peso\n");

  Pessoa cliente = Pessoa(nome, pesoParse!, alturaParse!);
  cliente.setIMC(CalculadoraIMC.getIMC(cliente.getPeso(), cliente.getAltura()));
  print(cliente.getIMC());
  print(CalculadoraIMC.checkIMC(cliente.getIMC()));
}



// Calculadora IMC
/*
* Ler dados do terminal
* Tratar exceções
* Calcular imc
* printar na tela o resultado do cálculo
* testes
*
* imc = peso(quilos)/altura²(metros)
*
* < 16 magreza grave
* 16 a 17 magreza moderad
* 17 a 18,5 magreza leve
* 18,5 a < 25 saudável
* 25 a < 30 sobrepeso
* 30 a < 35 obesidade i
* 35 a < 40 obesidade ii
* >= 40 obesidade iii
*
*/
