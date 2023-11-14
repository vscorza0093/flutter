import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = Color(0x0ff0c569);
const lightColor = Color(0xFFFFFFFF);
const backgroundColor = Color(0xfff5f5f5);

ThemeData lightTheme() {
  return ThemeData(
    brightness: brightness,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
      displayLarge: TextStyle(fontSize: 78),
      labelLarge: TextStyle(color: Colors.green),
    ),
    primaryColor: primaryColor,
  );
}
