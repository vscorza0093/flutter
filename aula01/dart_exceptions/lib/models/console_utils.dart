import 'dart:io';
import 'dart:convert';

class ConsoleUtils {
  static String readString() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static String readAndPrintString(String text) {
    print(text);
    return readString();
  }

  void returnNome() {
    print("blabla");
  }
}
