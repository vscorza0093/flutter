import 'dart:math';

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

String setTitle(String title) {
  print(title);
  return title;
}

void printName(String name, {String? lastname}) =>
    (lastname != null ? print("$name $lastname") : print(name));

implicitType(int num1, int num2) => num1 + num2;
