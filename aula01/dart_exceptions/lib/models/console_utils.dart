import 'dart:io';
import 'dart:convert';

class ConsoleUtils {
  static String readString() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static String readStringMessage(String text) {
    print(text);
    return readString();
  }

  static double? readDouble() {
    var value = readString();
    try {
      return double.parse(value);
    } catch (e) {
      return null;
    }
  }

  static double? readDoubleMessage(String text) {
    print(text);
    return readDouble();
  }
}
