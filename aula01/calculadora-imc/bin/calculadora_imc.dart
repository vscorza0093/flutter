import 'dart:io';

import 'package:calculadora_imc/calculadora_imc.dart';
import 'package:calculadora_imc/exceptions/invalid_height_exception.dart';
import 'package:calculadora_imc/exceptions/invalid_name_exception.dart';
import 'package:calculadora_imc/exceptions/invalid_weight_exception.dart';
import 'package:calculadora_imc/pessoa.dart';

void main(List<String> arguments) {
  // Pessoa pessoa = Pessoa('Vinicius', 52, 1.65);

  String? nome = stdin.readLineSync();
  String? altura = stdin.readLineSync();
  String? peso = stdin.readLineSync();

  double? alturaParse;
  double? pesoParse;

  print("${nome} ${altura} ${peso}");
  try {
    if (nome == null || nome.trim() == "") {
      throw InvalidNameException();
    }
  } on InvalidNameException {
    print(InvalidNameException().toString());
    nome = "Cliente";
    print("Nome padrão adicionado");
  } catch (e) {
    exit(0);
  }

  try {
    if (altura == "" || altura == "0") {
      throw InvalidHeightException();
      print("oi altura");
    }
  } catch (InvalidHeightException) {
    print("oi altura invalida");
    print(InvalidHeightException);
    altura = "168";
    print("Altura padrão adicionada");
  }

  try {
    if (peso == "" || peso == "0") {
      throw InvalidWeightException();
    }
  } on InvalidWeightException {
    print(InvalidWeightException().toString());
    peso = "70";
    print("Peso padrão adicionado");
  } catch (e) {
    exit(0);
  }
  print("${nome} ${altura} ${peso}");

  alturaParse = double.tryParse(altura!);
  pesoParse = double.tryParse(peso!);

  Pessoa cliente = Pessoa(nome!, pesoParse!, alturaParse!);
  print(cliente.getPeso());
  print(cliente.getAltura());
  cliente.setIMC(CalculadoraIMC.getIMC(cliente.getPeso(), cliente.getAltura()));
  print(cliente.getIMC());
  CalculadoraIMC.checkIMC(cliente.getIMC());
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
