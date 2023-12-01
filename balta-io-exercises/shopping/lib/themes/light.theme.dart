import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = Colors.green;
const lightColor = Color(0xFFFFFFFF);
const backgroundColor = Color(0xfff5f5f5);
const dangerColor = Color(0xFFFF0000);
const secondaryColor = Colors.white;

ThemeData lightTheme() {
  return ThemeData(
    brightness: brightness,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
      displayLarge: TextStyle(fontSize: 78),
      labelLarge: TextStyle(color: Colors.green),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontSize: 30,
      ),
    ),
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
  );
}
