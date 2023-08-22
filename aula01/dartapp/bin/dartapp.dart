import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dartapp/functions/utils.dart' as utils;

import 'package:dartapp/dartapp.dart' as dartapp;

void main(List<String> arguments) {
  //print(dartapp.calculate());

  utils.recursivity(3, 4);
  int number1 = Random().nextInt(11);
  int number2 = Random().nextInt(11);
  var number3 = stdin.readLineSync(encoding: utf8);
  print("Num1: $number1\nNum2: $number2\n");

  int num = 2;

  var firstround = (number1 > 6) ? number1 + utils.getNum() : number1;
  print("First round: $firstround");
  var secondround =
      (number2 > 6) ? number2 + utils.getNum() : utils.transformInFive(number2);
  print("Second round: $secondround\n");
  var finalScore = firstround + secondround;
  String finalresult = (finalScore > 15) ? "Vitória" : "Derrota";

  print("$finalScore pontos");
  print(finalresult);

  print(number3);

  String title = "Teste de operador";

  utils.setTitle(title.length > 10 ? title : "Título padrão");

  utils.printName(title, lastname: "Ternário");

  print(utils.implicitType(5, 15));
}
