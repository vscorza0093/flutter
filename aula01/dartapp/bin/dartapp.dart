import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dartapp/dartapp.dart' as dartapp;

void main(List<String> arguments) {
  //print(dartapp.calculate());

  recursivity(3, 4);
  /*
  int number1 = Random().nextInt(11);
  int number2 = Random().nextInt(11);
  var number3 = stdin.readLineSync(encoding: utf8);
  print("Num1: $number1\nNum2: $number2\n");

  int num = 2;

  var firstround = (number1 > 6) ? number1 + getNum() : number1;
  print("First round: $firstround");
  var secondround =
      (number2 > 6) ? number2 + getNum() : transformInFive(number2);
  print("Second round: $secondround\n");
  var finalScore = firstround + secondround;
  String finalresult = (finalScore > 15) ? "Vitória" : "Derrota";

  print("$finalScore pontos");
  print(finalresult);

  print(number3);
  */
}

int getNum() {
  return Random().nextInt(6);
}

// i d k
int transformInFive(int number) {
  int dif = 6 - number;
  int six = number + dif;
  return six - 1;
}

void recursivity(int number, int counter) {
  int result = number * number;
  print(number);
  print(counter);
  if (counter != 1) {
    counter -= 1;
    recursivity(result, counter);
  } else {
    print(result);
  }
}
